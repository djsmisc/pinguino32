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
 * $Id: usb_defs.h,v 1.1.1.1 2006/02/16 17:37:44 mtvs12 Exp $
 *-------------------------------------------------------------------
*/

#ifndef USB_DEFS_H_INCLUDED
#define USB_DEFS_H_INCLUDED

/*
*-----------------------------------------------------------------------------
* Constants
*-----------------------------------------------------------------------------
*/

/* UEPn Initialization Parameters */
#define EP_CTRL     0x06	/* Cfg Control pipe for this ep */
#define EP_OUT      0x0C    /* Cfg OUT only pipe for this ep */
#define EP_IN       0x0A    /* Cfg IN only pipe for this ep	*/
#define EP_OUT_IN   0x0E    /* Cfg both OUT & IN pipes for this ep */
#define HSHK_EN     0x10    /* Enable handshake packet */

/* Buffer Descriptor Status Register Initialization Parameters */
#define _BSTALL     0x04	/* Buffer Stall enable */
#define _DTSEN      0x08    /* Data Toggle Synch enable */
#define _INCDIS     0x10    /* Address increment disable */
#define _KEN        0x20    /* SIE keeps buff descriptors enable */
#define _DAT0       0x00    /* DATA0 packet expected next */
#define _DAT1       0x40    /* DATA1 packet expected next */
#define _DTSMASK    0x40    /* DTS Mask */
#define _USIE       0x80    /* SIE owns buffer */
#define _UCPU       0x00    /* CPU owns buffer */

/* USTAT checking constants */
#define OUT         0
#define IN          1
#define EP00_OUT    (0x00<<3)|(OUT<<2)
#define EP00_IN     (0x00<<3)|(IN<<2)

/* USB PID: Token Types - See chapter 8 in the USB specification */
#define SETUP_TOKEN         0b00001101
#define OUT_TOKEN           0b00000001
#define IN_TOKEN            0b00001001

#define EP0_BUFF_SIZE	64	

/* HID */
#define HID_INTF_ID			0x00
#define HID_UEP             UEP1
#define HID_BD_OUT          ep1Bo
#define HID_OUT_EP_SIZE		EP0_BUFF_SIZE
#define HID_BD_IN           ep1Bi
#define HID_IN_EP_SIZE 		64

/*
*-----------------------------------------------------------------------------
* Type Definitions
*-----------------------------------------------------------------------------
*/
typedef union union_BD_STAT
{
    byte _byte;
    struct{
        unsigned BC8:1;
        unsigned BC9:1;
        unsigned BSTALL:1;	/* Buffer Stall Enable */
        unsigned DTSEN:1;   /* Data Toggle Synch Enable */
        unsigned INCDIS:1;  /* Address Increment Disable */
        unsigned KEN:1;     /* BD Keep Enable */
        unsigned DTS:1;     /* Data Toggle Synch Value */
        unsigned UOWN:1;    /* USB Ownership */
    };
    struct{
        unsigned BC8:1;
        unsigned BC9:1;
        unsigned PID0:1;
        unsigned PID1:1;
        unsigned PID2:1;
        unsigned PID3:1;
        unsigned :1;
        unsigned UOWN:1;
    };
    struct{
        unsigned :2;
        unsigned PID:4; 	/* Packet Identifier */
        unsigned :2;
    };
} BD_STAT;		/* Buffer Descriptor Status Register */

typedef union union_BDT
{
    struct
    {
        BD_STAT Stat;
        byte Cnt;
        byte ADRL; 			/* Buffer Address Low */
        byte ADRH;          /* Buffer Address High */
    };
    struct
    {
        unsigned :8;
        unsigned :8;
        byte* ADR;   		/* Buffer Address */
    };
} BDT;			/* Buffer Descriptor Table */

typedef union union_CTRL_TRF_SETUP
{
    /* Array for indirect addressing */
    struct
    {
        byte _byte[EP0_BUFF_SIZE];
    };
    
    /* Standard Device Requests */
    struct
    {
        byte bmRequestType;
        byte bRequest;    
			#define GET_STATUS  0
			#define CLR_FEATURE 1
			#define SET_FEATURE 3
			#define SET_ADR     5
			#define GET_DSC     6
			#define SET_DSC     7
			#define GET_CFG     8
			#define SET_CFG     9
			#define GET_INTF    10
			#define SET_INTF    11
			#define SYNCH_FRAME 12
			
			/* HID Class-Specific Requests */
			#define GET_REPORT      0x01
			#define GET_IDLE        0x02
			#define GET_PROTOCOL    0x03
			#define SET_REPORT      0x09
			#define SET_IDLE        0x0A
			#define SET_PROTOCOL    0x0B

        word wValue;
        word wIndex;
        word wLength;
    };
    struct
    {
        unsigned :8;
        unsigned :8;
        WORD W_Value;
        WORD W_Index;
        WORD W_Length;
    };
    struct
    {
        unsigned Recipient:5;  	/* Device,Interface,Endpoint,Other */
			#define RCPT_DEV            0
			#define RCPT_INTF           1
			#define RCPT_EP             2
			#define RCPT_OTH            3

        unsigned RequestType:2; /* Standard,Class,Vendor,Reserved  */
			#define STANDARD	0x00
			#define CLASS       0x01
			#define VENDOR      0x02

        unsigned DataDir:1;     /* Host-to-device,Device-to-host   */
			#define HOST_TO_DEV	0
			#define DEV_TO_HOST 1
        unsigned :8;
        byte bFeature;          /* DEVICE_REMOTE_WAKEUP,ENDPOINT_HALT */
			#define DEVICE_REMOTE_WAKEUP    0x01
			#define ENDPOINT_HALT           0x00
        unsigned :8;
        unsigned :8;
        unsigned :8;
        unsigned :8;
        unsigned :8;
    };
    struct
    {
        unsigned :8;
        unsigned :8;
        byte bDscIndex;  		/* For Configuration and String DSC Only */
        byte bDscType;          /* Device,Configuration,String */
			#define DSC_DEV     0x01
			#define DSC_CFG     0x02
			#define DSC_STR     0x03
			#define DSC_INTF    0x04
			#define DSC_EP      0x05
        word wLangID;           /* Language ID */
        unsigned :8;
        unsigned :8;
    };
    struct
    {
        unsigned :8;
        unsigned :8;
        BYTE bDevADR;     		/* Device Address 0-127 */
        byte bDevADRH;          /* Must equal zero */
        unsigned :8;
        unsigned :8;
        unsigned :8;
        unsigned :8;
    };
    struct
    {
        unsigned :8;
        unsigned :8;
        byte bCfgValue; 		/* Configuration Value 0-255 */
        byte bCfgRSD;           /* Must equal zero (Reserved) */
        unsigned :8;
        unsigned :8;
        unsigned :8;
        unsigned :8;
    };
    struct
    {
        unsigned :8;
        unsigned :8;
        byte bAltID;     		/* Alternate Setting Value 0-255 */
        byte bAltID_H;          /* Must equal zero */
        byte bIntfID;           /* Interface Number Value 0-255 */
        byte bIntfID_H;         /* Must equal zero */
        unsigned :8;
        unsigned :8;
    };
    struct
    {
        unsigned :8;
        unsigned :8;
        unsigned :8;
        unsigned :8;
        byte bEPID;     		/* Endpoint ID (Number & Direction) */
        byte bEPID_H;           /* Must equal zero */
        unsigned :8;
        unsigned :8;
    };
    struct
    {
        unsigned :8;
        unsigned :8;
        unsigned :8;
        unsigned :8;
        unsigned EPNum:4; 		/* Endpoint Number 0-15 */
        unsigned :3;
        unsigned EPDir:1;       /* Endpoint Direction: 0-OUT, 1-IN */
        unsigned :8;
        unsigned :8;
        unsigned :8;
    };
} CTRL_TRF_SETUP;

typedef union union_CTRL_TRF_DATA
{
    /* Array for indirect addressing */
    struct
    {
        byte _byte[EP0_BUFF_SIZE];
    };
    
    /* First 8-byte direct addressing */
    struct
    {
        byte _byte0;
        byte _byte1;
        byte _byte2;
        byte _byte3;
        byte _byte4;
        byte _byte5;
        byte _byte6;
        byte _byte7;
    };
    struct
    {
        word _word0;
        word _word1;
        word _word2;
        word _word3;
    };

} CTRL_TRF_DATA;

#endif /*_H_INCLUDED*/

