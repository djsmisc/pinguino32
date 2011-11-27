/*                  - Dimax Israel Confidential and Proprietary -
 *
 *  Copyright (C) June 2000, Dimax Israel.  ALL RIGHTS RESERVED.
 *
 *  Except as specifically permitted herein, no portion of the information,
 *  including but not limited to object code and source code, may be reproduced,
 *  modified, distributed, republished or otherwise exploited in any form or by
 *  any means for any purpose without the prior written permission of Dimax 
 *  Israel. Use of software subject to the terms and conditions
 *  detailed in the file "LICENSE.txt".
 *
 */

/*-------------------------------------------------------------------
 * $Id: boot.c,v 1.1.1.1 2006/02/16 17:37:44 mtvs12 Exp $
 *-------------------------------------------------------------------
*/
#include <p18cxxx.h>
#include "typedefs.h"
#include "io_cfg.h"
#include "usb_defs.h"
#include "usb_desc.h"
#include "boot.h"
#include "boot_if.h"

/*
*-----------------------------------------------------------------------------
* Constants
*-----------------------------------------------------------------------------
*/


/*
*-----------------------------------------------------------------------------
* Type Definitions
*-----------------------------------------------------------------------------
*/


/*
*-----------------------------------------------------------------------------
* Global Variables
*-----------------------------------------------------------------------------
*/
const byte _zero;	/* Always Zero */

/*
* USB Fixed Location Variables
*/
#pragma udata usbram4=0x400
volatile far BDT ep0Bo; 	/* Endpoint0 BD Out */
volatile far BDT ep0Bi;     /* Endpoint0 BD In	*/
volatile far BDT ep1Bo; 	/* Endpoint1 BD Out */
volatile far BDT ep1Bi;     /* Endpoint1 BD In	*/

volatile far CTRL_TRF_SETUP SetupPkt;
volatile far CTRL_TRF_DATA CtrlTrfData;
#pragma udata usbram5=0x500
volatile far unsigned char hid_report_out[HID_OUT_EP_SIZE];
volatile far unsigned char hid_report_in[HID_IN_EP_SIZE];

/* 
* Global variables must be in same bank 
* This is required by assembler code in boot_asm.asm
*/
#pragma udata bank0=0x000

/*
* State Machine Variables
*/
byte usb_sm_state;		/* State Machine State */
    #define USB_SM_DETACHED		0
	#define USB_SM_ATTACHED		1
	#define USB_SM_POWERED		2
	#define USB_SM_DEFAULT		3
	#define USB_SM_ADR_PENDING	4
	#define USB_SM_ADDRESS		5
	#define USB_SM_CONFIGURED	6
	
byte usb_sm_ctrl_state;	/* State Machine Control I/F state */
	#define USB_SM_CTRL_WAIT_SETUP	0
	#define USB_SM_CTRL_TRF_TX 		1
	#define USB_SM_CTRL_TRF_RX		2

/* Tracking for transfers over multiple transactions */
POINTER pSrc;		/* Data source pointer */
POINTER pDst;       /* Data destination pointer */
byte Count;   		/* Data counter */

byte ctrl_trf_mem;
	#define _RAM 0
	#define _ROM 1
byte ctrl_trf_session_owner;
	#define MUID_NULL               0
	#define MUID_USB9               1
	#define MUID_HID                2
	#define MUID_CDC                3
byte usb_active_cfg;
byte usb_alt_intf;

/* HID */
byte active_protocol;
byte idle_rate;

/* Boot */
boot_cmd_st boot_cmd; 
boot_rep_st boot_rep;


/*
*-----------------------------------------------------------------------------
* Reset and Interrupt Vectors Remaping
*-----------------------------------------------------------------------------
*/
			
/*
*-----------------------------------------------------------------------------
* External Function Prototypes
*-----------------------------------------------------------------------------
*/
void xtea_decode( void );
void xtea_encode( void );

/*
*-----------------------------------------------------------------------------
* Local Function Prototypes
*-----------------------------------------------------------------------------
*/
void bootloader( void );
void usb_init(void);

void usb_state_machine(void);
void usb_sm_reset( void );
void usb_sm_ctrl( void );
void usb_sm_ctrl_setup( void );
void usb_sm_ctrl_out( void );
void usb_sm_ctrl_in( void );
void usb_sm_ctrl_tx( void );
void usb_sm_ctrl_rx( void );
void usb_sm_prepare_next_setup_trf( void );
void usb_sm_HID_request( void );
void usb_sm_HID_init_EP( void );

void hid_process_cmd( void );
void hid_send_report( void );

/*
* Functions in boot_asm
*/
extern void read_code( void );
extern void write_code( void );
extern void erase_code( void );
extern void copy_boot_rep( void );

/*
*-----------------------------------------------------------------------------
* START
*-----------------------------------------------------------------------------
*/
#pragma code
void main( void )
{
	/* All I/O to Digital mode */
	ADCON1=0x0F;

	UD_INIT;
	UD_TXW('X');

	/*
	* Decide what to run bootloader or application
	*/

#if USE_EEPROM_MARK
	/* Check EEPROM mark */
	EEADR = EEPROM_MARK_ADDR;
	EECON1= 0x01;
	if( EEDATA != EEPROM_MARK )
#endif
	{
		/* Check bootloader enable jumper */
#ifdef USE_JP_BOOTLOADER_EN
		if( jp_bootloaderEN != JP_BOOTLOADER_EN )
		{
			/* Run Application FW */
			_asm goto APP_RESET_VECTOR _endasm
		}
#endif
	}

	/* Run bootloader */
	bootloader();
}		

/*
* Bootloader Main Entry
*/
void bootloader( void )
{
#ifdef USE_LED
	LEDtris=0;
	LEDout=0;
#endif

	usb_init();
	/*
	* Main Loop
	*/
	while( 1 )
	{
		usb_state_machine();
		hid_process_cmd();
		hid_send_report();
	}
	
}

/*
*-----------------------------------------------------------------------------
* usb_init
*-----------------------------------------------------------------------------
* DESCR :
* INPUT : no
* OUTPUT: no
*-----------------------------------------------------------------------------
*/
void usb_init( void )
{ 
    UCFG = 0x14; 		/* Enable Internal Pull-Up
						 * Enable Internal Transceiver
						 * Full Speed
						 * Disable ping-pong */

	UIE = 0;
    UCON = 0b00001000;	/* Enable USBEN only */
    /*          
     * After enabling the USB module, it takes some time for the voltage
     * on the D+ or D- line to rise high enough to get out of the SE0 condition.
     * The USB Reset interrupt should not be unmasked until the SE0 condition is
     * cleared. This helps preventing the firmware from misinterpreting this
     * unique event as a USB bus reset from the USB host.
     */

	/* Wait USB module normal operation */
    while(UCONbits.SE0);

    UIR = 0;      			/* Clear all USB interrupts */
    UIE = 0b00010001; 		/* Unmask RESET & IDLE interrupts only */

	usb_sm_state = USB_SM_POWERED;
}
  
/*
*-----------------------------------------------------------------------------
* usb_state_machine
*-----------------------------------------------------------------------------
* DESCR :
* INPUT : no
* OUTPUT: no
*-----------------------------------------------------------------------------
*/
void usb_state_machine( void )
{
	/*
	* Bus Activity detected after IDLE state
	*/
	if( UIRbits.ACTVIF && UIEbits.ACTVIE)
    {
UD_TX('A');
        UCONbits.SUSPND = 0;
        UIEbits.ACTVIE = 0;
        UIRbits.ACTVIF = 0;
    }

    /*
     * Pointless to continue servicing if the device is in suspend mode.
     */    
    if(UCONbits.SUSPND==1) 
		return;

	/*
     * USB Bus Reset Interrupt.
     * When bus reset is received during suspend, ACTVIF will be set first,
     * once the UCONbits.SUSPND is clear, then the URSTIF bit will be asserted.
     * This is why URSTIF is checked after ACTVIF.
     *
     * The USB reset flag is masked when the USB state is in
     * DETACHED_STATE or ATTACHED_STATE, and therefore cannot
     * cause a USB reset event during these two states.
     */
    if( UIRbits.URSTIF && UIEbits.URSTIE )
        usb_sm_reset();

	/* Idle condition detected */
    if( UIRbits.IDLEIF && UIEbits.IDLEIE )
    {
UD_TX('I');
        UIEbits.ACTVIE = 1;		/* Enable bus activity interrupt */
        UIRbits.IDLEIF = 0;
        UCONbits.SUSPND = 1;   	/* Put USB module in power conserve
								 * mode, SIE clock inactive */
        /* Now, go into power saving */
        PIE2bits.USBIE = 1;    /* Set wakeup source */
        Sleep();
        PIR2bits.USBIF = 0;
    }

	/* A STALL handshake was sent by the SIE */
	if( UIRbits.STALLIF && UIEbits.STALLIE )
    {
UD_TX('S');
        if( UEP0bits.EPSTALL == 1 )
        {
            usb_sm_prepare_next_setup_trf();	/* Firmware Work-Around */
            UEP0bits.EPSTALL = 0;
        }
        UIRbits.STALLIF = 0;
    }

	/*
     * Pointless to continue servicing if the host has not sent a bus reset.
     * Once bus reset is received, the device transitions into the DEFAULT
     * state and is ready for communication.
     */
    if( usb_sm_state < USB_SM_DEFAULT ) 
		return;

	/* Detect Interrupt bit */
    if( UIRbits.TRNIF && UIEbits.TRNIE )
    {
        /*
         * Only services transactions over EP0.
         * Ignore all other EP transactions.
         */
        usb_sm_ctrl();
        UIRbits.TRNIF = 0;
    }
}

/*
*-----------------------------------------------------------------------------
* USB State Machine Handlers
*-----------------------------------------------------------------------------
*/

/*
* USB Reset
*/
void usb_sm_reset( void )
{
UD_TX('R');
    UIR = 0;         			/* Clears all USB interrupts */
    UIE = 0b01111011;     		/* Enable all interrupts except ACTVIE */
    UADDR = 0x00;            	/* Reset to default address */
    UEP0 = EP_CTRL|HSHK_EN;     /* Init EP0 as a Control EP */
    while(UIRbits.TRNIF == 1) 	/* Flush any pending transactions */
        UIRbits.TRNIF = 0;
    UCONbits.PKTDIS = 0;       	/* Make sure packet processing is enabled */

	usb_sm_prepare_next_setup_trf();
    usb_sm_state = USB_SM_DEFAULT;
}

/*
* Control Transfer over EP0
*/
void usb_sm_ctrl( void )
{
    if( USTAT == EP00_OUT )
    {
        if( ep0Bo.Stat.PID == SETUP_TOKEN )
			usb_sm_ctrl_setup();
        else
			usb_sm_ctrl_out();
    }
    else if( USTAT == EP00_IN )
		usb_sm_ctrl_in();
}

void usb_sm_ctrl_setup( void )
{
	/* Stage 1 */
    usb_sm_ctrl_state = USB_SM_CTRL_WAIT_SETUP;
    ctrl_trf_session_owner = MUID_NULL;
    Count = 0;

/* TBD
* Must check that EPNum does not exceed number of EP's
*/
	/* Stage 2 */
    if( SetupPkt.RequestType == STANDARD )
	{
		switch( SetupPkt.bRequest )
		{
		case SET_ADR:
UD_TX('a');
            ctrl_trf_session_owner = MUID_USB9;
            usb_sm_state = USB_SM_ADR_PENDING;
			break;

		case GET_DSC:
UD_TX('d');
            ctrl_trf_session_owner = MUID_USB9;
            if(SetupPkt.bDscType == DSC_DEV)
            {
                pSrc.bRom = (rom byte*)&device_desc;
                Count = sizeof(device_desc);
            }
            else if(SetupPkt.bDscType == DSC_CFG)
            {
                pSrc.bRom = (rom byte*)&cfg01;
                Count = sizeof(cfg01);
            }
            else if(SetupPkt.bDscType == DSC_STR)
            {
				/* Get String Descriptor */
				if( SetupPkt.bDscIndex )
				{
                    pSrc.bRom = (rom byte*)&sd001;
					Count = sizeof(sd001);
				}
				else
				{
					pSrc.bRom = (rom byte*)&sd000;
					Count = sizeof(sd000);
				}
            }
            else
                /* This is required to stall the DEVICE_QUALIFIER request */
                ctrl_trf_session_owner = MUID_NULL;
            ctrl_trf_mem = _ROM;
            break;

		case SET_CFG:
			ctrl_trf_session_owner = MUID_USB9;
            UEP1=0;		/* Disable EP1 */
			
			usb_active_cfg = SetupPkt.bCfgValue;
			if(SetupPkt.bCfgValue == 0)
				usb_sm_state = USB_SM_ADDRESS;
			else
			{
				usb_sm_state = USB_SM_CONFIGURED;

				/* Modifiable Section */
				usb_sm_HID_init_EP();
			}
            break;

        case GET_CFG:
            ctrl_trf_session_owner = MUID_USB9;
            pSrc.bRam = (byte*)&usb_active_cfg;
            ctrl_trf_mem = _RAM;
            Count = 1;
            break;

		case GET_STATUS:
            CtrlTrfData._byte0 = 0;
            CtrlTrfData._byte1 = 0;
/*
* Due to code size limits do not fully
* process GET_STATUS. 
* Simply return 0x0000 status - everything good
*/
#define GET_STATUS_FULLY_SUPPORTED 0
#if GET_STATUS_FULLY_SUPPORTED
			switch(SetupPkt.Recipient)
            {
			case RCPT_DEV:
                ctrl_trf_session_owner = MUID_USB9;
				break;
			case RCPT_INTF:
				ctrl_trf_session_owner = MUID_USB9;    
				break;
			case RCPT_EP:
				ctrl_trf_session_owner = MUID_USB9;
				pDst.bRam = (byte*)&ep0Bo+(SetupPkt.EPNum*8)+(SetupPkt.EPDir*4);
				if(*pDst.bRam & _BSTALL)    	/* Use _BSTALL as a bit mask */
					CtrlTrfData._byte0=0x01;	/* Set bit0 to indicate that EP Halted */
				break;
			}
#endif /*GET_STATUS_FULLY_SUPPORTED*/
			if(ctrl_trf_session_owner == MUID_USB9)
			{
				pSrc.bRam = (byte*)&CtrlTrfData;
				ctrl_trf_mem = _RAM;
				Count = 2;
			}
            break;
/*
* Due to code size limits CLR/SET FEATURE 
* not be supported
*/
#define CLR_SET_FEATURE_SUPPORTED 0
#if CLR_SET_FEATURE_SUPPORTED
        case CLR_FEATURE:
		case SET_FEATURE:
            if((SetupPkt.bFeature == DEVICE_REMOTE_WAKEUP)&&
				(SetupPkt.Recipient == RCPT_DEV))
			{
				ctrl_trf_session_owner = MUID_USB9;
				/* Bootloader does not support remote WakeUp */
			}
			if((SetupPkt.bFeature == ENDPOINT_HALT)&&
				(SetupPkt.Recipient == RCPT_EP)&&
				(SetupPkt.EPNum != 0))
			{
				ctrl_trf_session_owner = MUID_USB9;
				/* Must do address calculation here */
				pDst.bRam = (byte*)&ep0Bo+(SetupPkt.EPNum*8)+(SetupPkt.EPDir*4);

				if(SetupPkt.bRequest == SET_FEATURE)
					*pDst.bRam = _USIE|_BSTALL;
				else
				{
					if(SetupPkt.EPDir == 1) // IN
						*pDst.bRam = _UCPU;
					else
						*pDst.bRam = _USIE|_DAT0|_DTSEN;
				}
			}
            break;
#endif /*CLR_SET_FEATURE_SUPPORTED*/
        case GET_INTF:
            ctrl_trf_session_owner = MUID_USB9;
            pSrc.bRam = (byte*)&usb_alt_intf;
            ctrl_trf_mem = _RAM;
            Count = 1;
            break;
        case SET_INTF:
            ctrl_trf_session_owner = MUID_USB9;
            usb_alt_intf = SetupPkt.bAltID;
            break;

        case SET_DSC:
        case SYNCH_FRAME:
        default:
            break;

		}/*end SetupPkt.bRequest*/ 
	}
	/* End Stage 2 */

	/*
	* Class Specific
	*/
    if(ctrl_trf_session_owner == MUID_NULL)
        usb_sm_HID_request();

	/* Stage 3 */

    /*
     * PKTDIS bit is set when a Setup Transaction is received.
     * Clear to resume packet processing.
     */
    UCONbits.PKTDIS = 0;

    if(ctrl_trf_session_owner == MUID_NULL)
    {
        /*
         * If no one knows how to service this request then stall.
         * Must also prepare EP0 to receive the next SETUP transaction.
         */
        ep0Bo.Cnt = EP0_BUFF_SIZE;
        ep0Bo.ADR = (byte*)&SetupPkt;

        ep0Bo.Stat._byte = _USIE|_BSTALL;
        ep0Bi.Stat._byte = _USIE|_BSTALL;
    }
	else
	{
        if(SetupPkt.DataDir == DEV_TO_HOST)
        {
            if( (byte)(SetupPkt.wLength) < Count )
                Count = (byte)(SetupPkt.wLength);
            usb_sm_ctrl_tx();

			/*
			 * Prepare OUT EP to respond to early termination
             *
             * Since the SETUP transaction requires the DTS bit to be
             * DAT0 while the zero length OUT status requires the DTS
             * bit to be DAT1, the DTS bit check by the hardware should
             * be disabled. This way the SIE could accept either of
             * the two transactions.
 			 */
            usb_sm_ctrl_state = USB_SM_CTRL_TRF_TX;
            ep0Bo.Cnt = EP0_BUFF_SIZE;
            ep0Bo.ADR = (byte*)&SetupPkt;
            ep0Bo.Stat._byte = _USIE;	/* Note: DTSEN is 0! */

			/*
             * Prepare IN EP to transfer data, Cnt should have
             * been initialized by responsible request owner.
             */
            ep0Bi.ADR = (byte*)&CtrlTrfData;
            ep0Bi.Stat._byte = _USIE|_DAT1|_DTSEN;
		}
		else	/* (SetupPkt.DataDir == HOST_TO_DEV) */
        {
            usb_sm_ctrl_state = USB_SM_CTRL_TRF_RX;
            /*
             * Prepare IN EP to respond to early termination
             * This is the same as a Zero Length Packet Response
             * for control transfer without a data stage
             */
            ep0Bi.Cnt = 0;
            ep0Bi.Stat._byte = _USIE|_DAT1|_DTSEN;

            /*
             * Prepare OUT EP to receive data.
             */
            ep0Bo.Cnt = EP0_BUFF_SIZE;
            ep0Bo.ADR = (byte*)&CtrlTrfData;
            ep0Bo.Stat._byte = _USIE|_DAT1|_DTSEN;
        }
	}
	/* End Stage 3 */
}

void usb_sm_ctrl_out( void )
{
UD_WTX('>');
    if( usb_sm_ctrl_state == USB_SM_CTRL_TRF_RX )
    {
        usb_sm_ctrl_rx();

        if (ctrl_trf_session_owner == MUID_HID)
        {
        }
		/*
         * Don't have to worry about overwriting _KEEP bit
         * because if _KEEP was set, TRNIF would not have been
         * generated in the first place.
         */
        if(ep0Bo.Stat.DTS == 0)
            ep0Bo.Stat._byte = _USIE|_DAT1|_DTSEN;
        else
            ep0Bo.Stat._byte = _USIE|_DAT0|_DTSEN;
    }
    else	/* CTRL_TRF_TX */
		usb_sm_prepare_next_setup_trf();
}

void usb_sm_ctrl_in( void )
{
UD_WTXW('<');
	while (ep0Bi.Stat.UOWN);

	/* Must check if in ADR_PENDING_STATE */
	if( usb_sm_state == USB_SM_ADR_PENDING )
    {
        UADDR = SetupPkt.bDevADR._byte;
        if(UADDR > 0)
            usb_sm_state=USB_SM_ADDRESS;
        else
            usb_sm_state=USB_SM_DEFAULT;
    }

    if( usb_sm_ctrl_state == USB_SM_CTRL_TRF_TX)
    {
        usb_sm_ctrl_tx();

        if(ep0Bi.Stat.DTS == 0)
            ep0Bi.Stat._byte = _USIE|_DAT1|_DTSEN;
        else
            ep0Bi.Stat._byte = _USIE|_DAT0|_DTSEN;
    }
    else
		usb_sm_prepare_next_setup_trf();
}

void usb_sm_ctrl_tx( void )
{
	byte byte_to_send;
UD_TX('-');

    /* First, have to figure out how many byte of data to send */
    if( Count < EP0_BUFF_SIZE)
        byte_to_send = Count;
    else
        byte_to_send = EP0_BUFF_SIZE;

    /* Load the number of bytes to send to BC9..0 in buffer descriptor */
    ep0Bi.Stat.BC9 = 0;
    ep0Bi.Stat.BC8 = 0;
    ep0Bi.Cnt = byte_to_send;

    /* Subtract the number of bytes just about to be sent from the total */
    Count = Count - byte_to_send;

    pDst.bRam = (byte*)&CtrlTrfData;
    
	/* Determine type of memory source */
    if(ctrl_trf_mem == _ROM)
    {
        while(byte_to_send)
        {
            *pDst.bRam = *pSrc.bRom;
            pDst.bRam++;
            pSrc.bRom++;
            byte_to_send--;
        }
    }
    else /* RAM */
    {
        while(byte_to_send)
        {
            *pDst.bRam = *pSrc.bRam;
            pDst.bRam++;
            pSrc.bRam++;
            byte_to_send--;
        }
    }
}

void usb_sm_ctrl_rx( void )
{
	byte byte_to_read;
UD_TX('+');

    byte_to_read = ep0Bo.Cnt;

    /* Accumulate total number of bytes read */
    Count = Count + byte_to_read;
	pSrc.bRam = (byte*)&CtrlTrfData;

    while(byte_to_read)
    {
        *pDst.bRam = *pSrc.bRam;
        pDst.bRam++;
        pSrc.bRam++;
        byte_to_read--;
    }
}


/*
* Prepare EP0 for next setup transfer
*/
void usb_sm_prepare_next_setup_trf( void )
{
    usb_sm_ctrl_state = USB_SM_CTRL_WAIT_SETUP;   
    
	ep0Bo.Cnt = EP0_BUFF_SIZE; 
    ep0Bo.ADR = (byte*)&SetupPkt;

	/* Buffer OUT: SIE ownership, DATA0 Expected, Toggle Synch Enabled */
    ep0Bo.Stat._byte = _USIE|_DAT0|_DTSEN;  

	/* Buffer IN: CPU ownership */
    ep0Bi.Stat._byte = _UCPU; 
}

/*
*-----------------------------------------------------------------------------
* HID
*-----------------------------------------------------------------------------
*/
void usb_sm_HID_request( void )
{
UD_TX('H');
	if(SetupPkt.Recipient != RCPT_INTF) 
		return;
    if(SetupPkt.bIntfID != HID_INTF_ID) 
		return;
	
	/*
     * There are two standard requests that hid.c may support.
     * 1. GET_DSC(DSC_HID,DSC_RPT,DSC_PHY);
     * 2. SET_DSC(DSC_HID,DSC_RPT,DSC_PHY);
     */
    if(SetupPkt.bRequest == GET_DSC)
    {
        switch(SetupPkt.bDscType)
        {
        case DSC_HID:
            ctrl_trf_session_owner = MUID_HID;
			pSrc.bRom = (rom byte*)&cfg01.hid_i00a00;
            Count = sizeof(USB_HID_DSC);
            break;
        case DSC_RPT:
            ctrl_trf_session_owner = MUID_HID;
            pSrc.bRom = (rom byte*)&hid_rpt01;
            Count = sizeof(hid_rpt01);
            break;
        case DSC_PHY:
            break;
        }
        ctrl_trf_mem = _ROM;
    }
    if(SetupPkt.RequestType != CLASS) return;
    switch(SetupPkt.bRequest)
    {
	case GET_REPORT:
        ctrl_trf_session_owner = MUID_HID;
        break;
	case SET_REPORT:
        ctrl_trf_session_owner = MUID_HID;
		pDst.bRam = (byte*)(&boot_cmd);
        break;
#define GET_SET_IDLE 0
#if GET_SET_IDLE
    case GET_IDLE:
        ctrl_trf_session_owner = MUID_HID;
        pSrc.bRam = (byte*)&idle_rate;
        ctrl_trf_mem = _RAM;
        Count = 1;             
        break;
    case SET_IDLE:
        ctrl_trf_session_owner = MUID_HID;
        idle_rate = MSB(SetupPkt.W_Value);
        break;
#endif
#define GET_SET_PROTOCOL 0
#if GET_SET_PROTOCOL
    case GET_PROTOCOL:
        ctrl_trf_session_owner = MUID_HID;
        pSrc.bRam = (byte*)&active_protocol;
        ctrl_trf_mem = _RAM;
        Count = 1;
        break;
    case SET_PROTOCOL:
        ctrl_trf_session_owner = MUID_HID;
        active_protocol = LSB(SetupPkt.W_Value);
        break;
#endif
    }
}

void usb_sm_HID_init_EP( void )
{
#define USE_HID_EP_OUT 0
#if USE_HID_EP_OUT
    HID_UEP = EP_OUT_IN|HSHK_EN;	/* Enable 2 data pipes */

    HID_BD_OUT.Cnt = sizeof(hid_report_out);
    HID_BD_OUT.ADR = (byte*)&hid_report_out;
    HID_BD_OUT.Stat._byte = _USIE|_DAT0|_DTSEN;
#else
    HID_UEP = EP_IN|HSHK_EN;		/* Enable 1 data pipe */
#endif

    HID_BD_IN.ADR = (byte*)&hid_report_in;
    HID_BD_IN.Stat._byte = _UCPU|_DAT1;

	boot_rep.cmd = 0;
}

/*
*-----------------------------------------------------------------------------
* Bootloader Application Functions
*-----------------------------------------------------------------------------
*/
void hid_send_report( void )
{
	if( boot_rep.cmd  && (!HID_BD_IN.Stat.UOWN) )
	{
		/*
		* Copy boot_rep into hid_report_in
		* Clear bytes of boot_rep
		*/
		copy_boot_rep();	

		HID_BD_IN.Cnt = sizeof(boot_rep);
		HID_BD_IN.Stat._byte &= _DTSMASK;        	/* Save only DTS bit */
		HID_BD_IN.Stat.DTS = !HID_BD_IN.Stat.DTS; 	/* Toggle DTS bit    */
		HID_BD_IN.Stat._byte |= _USIE|_DTSEN;      	/* Turn ownership to SIE */
	}
}

/*
*-----------------------------------------------------------------------------
* Auxiliary Functions
*-----------------------------------------------------------------------------
*/


