/*******************************************************************************
	Title:	USB Pinguino Bootloader
	File:	hardware.h
	Descr.: bootloader def. (version, led, tempo.)
	Author:	André Gentric
			Régis Blanchot <rblanchot@gmail.com>
			Based on Albert Faber's JAL bootloader
			and Alexander Enzmann's USB Framework
	This file is part of Pinguino (http://www.pinguino.cc)
	Released under the LGPL license (http://www.gnu.org/licenses/lgpl.html)
*******************************************************************************/

#include <p32xxxx.h>
#include "types.h"
#include "hardware.h"
#include "picUSB.h"
#include "config.h"

#define USB_HOST_MODE_ENABLE                0x08    // U1CON - Enable host mode
#define USB_SOF_DISABLE                     0x00    // U1CON - Disable SOF generation
#define USB_PINGPONG_RESET                  0x02    // U1CON - Reset ping-pong buffer pointer
#define USB_DPLUS_PULLDOWN_ENABLE           0x20    // U1OTGCON - Enable D+ pull-down
#define USB_DMINUS_PULLDOWN_ENABLE          0x10    // U1OTGCON - Enable D- pull-down
#define USB_VBUS_ON                         0x08    // U1OTGCON - Enable Vbus
#define USB_SOF_THRESHOLD_64                0x4A    // U1SOF - Threshold for a max packet size of 64
#define USB_PING_PONG__EP0_OUT_ONLY         0x01    // U1CFG1 - Ping-pong on EP 0 out only

const USB_Device_Descriptor device_descriptor = 
{
    sizeof(USB_Device_Descriptor),              // Size of this descriptor in bytes
    DEVICE_DESCRIPTOR,                          // Device descriptor type
    0x0200,                                     // USB Spec Release Number in BCD format (0x0100 for USB 1.0, 0x0110 for USB1.1, 0x0200 for USB2.0)
    0xff,                                       // Class Code-->00
    0x00,                                       // Subclass code
    0xff,                                       // Protocol code
    EP0_BUFFER_SIZE,                            // Max packet size for EP0
    0x04D8,                                     // Vendor ID, microchip=0x04D8, generic=0x05f9, test=0x067b
    0xFEAA,                                     // Product ID 0x00A für CDC, generic=0xffff, test=0x2303
    (MAJOR_VERSION<<8)+MINOR_VERSION,           // Device release number in BCD format-->0
    1,                                          // Manufacturer string index (0=no string descriptor)
    2,                                          // Product string index (0=no string descriptor)
    0,                                          // Device serial number string index
    1                                           // Number of possible configurations
};

const USB_Configuration_Descriptor configuration_descriptor =
{
    // Configuration Descriptor Header
    {sizeof(USB_Configuration_Descriptor_Header),// Size of this descriptor in bytes
    CONFIGURATION_DESCRIPTOR,                   // CONFIGURATION descriptor type
    sizeof(USB_Configuration_Descriptor),       // Total length of data for this configuration
    1,                                          // Number of interfaces in this configuration
    1,                                          // Index value of this configuration
    0,                                          // Configuration string index
    192,//DEFAULT | POWERED,                          // Attributes
    20},                                         // Maximum Power Consumption in 2mA units

    // Data Interface Descriptor with in and out EPs
    {sizeof(USB_Interface_Descriptor),          // Size of this descriptor in bytes
    INTERFACE_DESCRIPTOR,                       // Interface descriptor type
    0,                                          // Interface Number
    0,                                          // Alternate Setting Number
    2,                                          // Number of endpoints in this interface
    0xff,                                       // Class code
    0xff,                                       // TODO: Subclass code
    0xff,                                       // TODO: Protocol code
    0},                                         // Index of String Descriptor Describing this interface-->2

    // Endpoint 1 Out
    {sizeof(USB_Endpoint_Descriptor),           // Size of Descriptor
    ENDPOINT_DESCRIPTOR,                        // Descriptor Type
    0x01,                                       // Endpoint Address
    0x02,                                       // Attribute = Bulk Transfer
    EP1_BUFFER_SIZE,                            // Packet Size
    0x00},                                      // Poll Intervall

    // Endpoint 1 IN
    {sizeof(USB_Endpoint_Descriptor),           // Size of Descriptor
    ENDPOINT_DESCRIPTOR,                        // Descriptor Type
    0x81,                                       // Endpoint Address
    0x02,                                       // Attribute = Bulk Transfer
    EP1_BUFFER_SIZE,                            // Packet Size
    0x00}
};

const char lang[] = {4,  STRING_DESCRIPTOR,
    0x09,0x04}; // english = 0x0409
const char manu[] = {22,  STRING_DESCRIPTOR,
    'R',0x00,'.',0x00,'B',0x00,'l',0x00,'a',0x00,'n',0x00,'c',0x00,'h',0x00,'o',0x00,'t',0x00};
const char prod[] = {18,  STRING_DESCRIPTOR,
    'P',0x00,'i',0x00,'n',0x00,'g',0x00,'u',0x00,'i',0x00,'n',0x00,'o',0x00};
const char * const string_descriptor[] = { lang, manu, prod };

/*  --------------------------------------------------------------------
    ------------------------------------------------------------------*/
    
void BOOTZONE delay(void)
{
    int i;
    
    for(i = 0; i < 0xFFFF; i++)
    {
        Nop();
    }
}

/*  --------------------------------------------------------------------
    ------------------------------------------------------------------*/
    
void BOOTZONE flash_operation(unsigned int nvmop)
{
    //asm("di");                  // Suspend or Disable all Interrupts
    NVMCON = NVMCON_WREN | nvmop; // Enable Flash Write/Erase Operations
    // delay_us(7);               // For LVD to become stable
    NVMKEY = 0xAA996655;          // Write Keys
    NVMKEY = 0x556699AA;
    NVMCONSET = NVMCON_WR;        // Initiate a Flash operation (WR=1)
    while (NVMCON & NVMCON_WR);   // Wait for operation to complete 
    //asm("ei");                  // Restore Interrupts
}

/*  --------------------------------------------------------------------
    ------------------------------------------------------------------*/
    
void BOOTZONE exit_boot(void)
{
    // disable timer 1
    T1CON        = 0;
    // disable USB
    U1CON        = 0;
    U1IE         = 0;
    U1OTGIE      = 0;
    U1PWRCbits.USBPWR = 1;
    deviceState = DETACHED;
    // led off
    LED_PORT_CLR = LED_MASK;
    delay();
    asm volatile ("j 0xBFC00000");
    //_RESET_ADDR              = 0xBFC00000;
}

/*  --------------------------------------------------------------------
    ------------------------------------------------------------------*/
    
void BOOTZONE usb_configure_endpoints()
{
    U1EP1bits.EPHSHK   = 1;		// EP handshaking on
    U1EP1bits.EPCONDIS = 1;		// control transfers off
    U1EP1bits.EPTXEN   = 1;		// EP OUT enabled
    U1EP1bits.EPRXEN   = 1;		// EP IN enabled
    
    // for IN
    // set DTS bit, turn on data togle sync TOGGLE
    EP_IN_BD(1).Stat.uc  = 0b01000000;

    // for OUT
    EP_OUT_BD(1).Cnt  = EP1_BUFFER_SIZE;
    EP_OUT_BD(1).ADDR = ConvertToPhysicalAddress(&bootCmd);
    // set UOWN bit, SIE owns the buffer
    EP_OUT_BD(1).Stat.uc = 0b10000000;
}

/*  --------------------------------------------------------------------
    ------------------------------------------------------------------*/
    
void BOOTZONE usb_ep_data_out_callback(char end_point)
{
    byte counter;

    // whatever the command, keep LED high
    LED_PORT_SET = LED_MASK;

    // Number of byte(s) to return
    EP_IN_BD(end_point).Cnt = 0;

    // load table pointer
    NVMADDR = bootCmd.addr;

/**********************************************************************/
    if (bootCmd.cmd ==  RESET)
/**********************************************************************/
    {
        exit_boot();
    }
/**********************************************************************/
    else if (bootCmd.cmd == READ_VERSION)
/**********************************************************************/
    {
        bootCmd.buffer[2] = MINOR_VERSION;
        bootCmd.buffer[3] = MAJOR_VERSION;

        // Number of byte(s) to return
        EP_IN_BD(end_point).Cnt = 4;
    }

/**********************************************************************/
    else if (bootCmd.cmd == READ_FLASH)
/**********************************************************************/
    {
        for (counter=0; counter < bootCmd.len; counter++)
            bootCmd.xdat[counter] = NVMDATA; // 32 bits but xdat = 8 bits

        // Number of byte(s) to return
        EP_IN_BD(end_point).Cnt = 5 + bootCmd.len;
    }

/**********************************************************************/
    else if (bootCmd.cmd == WRITE_FLASH)
/**********************************************************************/
    {
        /// blocks must be erased before written
        /// the whole memory is erased at the begining of upload
        /// we write 32 bytes not 64 bytes
        /// n   : write [address]      + 64 bytes
        /// n+1 : write [address + 32] + 64 bytes
        /// 32 bytes are written 2 times
        /// that's why we use 2-byte write instead of 64-byte write
        
        // Word Write
        flash_operation(0x0001);
        
        for (counter=0; counter < bootCmd.len; counter+=2)
        {
            NVMADDR += counter; // bootCmd.addrl + counter;
            NVMDATA = bootCmd.xdat[counter]; // 32 bits but xdat = 8 bits
        }

        // End of erase/write operations,
        NVMCONbits.WREN = 0;

        // Number of byte(s) to return
        EP_IN_BD(end_point).Cnt = 1;
    }

/**********************************************************************/
	else if (bootCmd.cmd ==  ERASE_FLASH)
/**********************************************************************/
    {
        // The erase block size is 4096 bytes
        // bootCmd.len = num. of 4096-byte blocks to erase

        // Page Erase
        flash_operation(0x0100);

        for (counter=0; counter < bootCmd.len; counter++)
            NVMADDR += FLASH_PAGE_SIZE;

        // End of erase/write operations,
        NVMCONbits.WREN = 0;

        // Number of byte(s) to return
        EP_IN_BD(end_point).Cnt = 1;
    }

/**********************************************************************/
    // Is there something to return ?
    if (EP_IN_BD(end_point).Cnt > 0)
    {
        // Data packet toggle
        if (EP_IN_BD(1).Stat.DTS)
            EP_IN_BD(1).Stat.uc = 0b10001000; // UOWN 1 DTS 0 DTSEN 1
        else
            EP_IN_BD(1).Stat.uc = 0b11001000; // UOWN 1 DTS 1 DTSEN 1
    }

    // reset size
    EP_OUT_BD(end_point).Cnt = EP1_BUFFER_SIZE;
    // set to UOWN
    EP_OUT_BD(end_point).Stat.uc = 0x80;      // UOWN 1
}

/*  --------------------------------------------------------------------
    Main loop
    ------------------------------------------------------------------*/
 
int BOOTZONE main(void)
{
    byte t1_count = 0;
    word led_counter = 0;

    // set IO to digital
    #if defined(__32MX220F032D__) || defined(__32MX220F032B__) || \
        defined(__32MX230F064D__) || defined(__32MX230F064B__) || \
        defined(__32MX250F128D__) || defined(__32MX250F128B__)
        DDPCONbits.JTAGEN = 0;
        ANSELA = 0;
        ANSELB = 0;
        #if defined(__32MX220F032D__) || \
            defined(__32MX230F064D__) || \
            defined(__32MX250F128D__)
            ANSELC = 0;
        #endif
    #else
        AD1PCFG = 0xFFFF;
    #endif

    // init IO
    LED_TRIS_OUT        = LED_MASK;
    LED_PORT_SET        = LED_MASK;
    MON_TRIS_IN         = MON_MASK;

    // init Timer1 with prescaler 1:8
    T1CON               = 0x8010;

    // Clear and turn off all USB interrupts
    U1IE                = 0;
    U1IR                = 0xFF;
    U1OTGIE             &= 0x8C;
    U1OTGIR             = 0x7D;
    U1EIE               = 0;
    U1EIR               = 0xFF;
    
    // if USB cable is detached, jump to user application
    if ( (U1OTGSTATbits.VBUSVD != 0) && (U1OTGSTATbits.SESVD != 0) )
    {
        exit_boot();
    }

    // Configure USB module

    IEC1bits.USBIE = 0;         // USBDisableInterrupts()

    // Clear all USB error flags
    U1EIR = 0xFF;               // USBClearInterruptRegister(U1EIR)

    // Clears all USB interrupts          
    U1IR = 0xFF;                // USBClearInterruptRegister(U1IR) 

    //Clear all of the endpoint control registers
    U1EP0 = 0;
    U1EP1 = 0;                  // DisableNonZeroEndpoints(USB_MAX_EP_NUMBER);

    //  Set Configuration Options
    U1CNFG1 = 0;
    U1EIE = 0x9F;
    U1IE = 0x99 | USB_SOF_INTERRUPT | USB_ERROR_INTERRUPT;
    U1OTGCON &= 0x000F;
    U1OTGCON |= USB_PULLUP_OPTION;

    //power up the module (if not already powered)
    U1PWRCbits.USBPWR = 1;      // USBPowerModule();

    //set the address of the BDT (if applicable)
    U1BDTP3 = ConvertToPhysicalAddress(addr) >> 24;
    U1BDTP2 = ConvertToPhysicalAddress(addr) >> 16;
    U1BDTP1 = ConvertToPhysicalAddress(addr) >> 8;
    //USBSetBDTAddress(BDT);

/*
    //Clear all of the BDT entries
    for(i=0;i<(sizeof(BDT)/sizeof(BDT_ENTRY));i++)
    {
        BDT[i].Val = 0x00;
    }
*/

    // Assert reset request to all of the Ping Pong buffer pointers
    U1CONbits.PPBRST = 1;       // USBPingPongBufferReset = 1;                    

    // Reset to default address
    U1ADDR = 0x00;                   

    // Make sure packet processing is enabled
    U1CONbits.PKTDIS = 0;       // USBPacketDisable = 0;           

    //Stop trying to reset ping pong buffer pointers
    U1CONbits.PPBRST = 0;       // USBPingPongBufferReset = 0;

    // Flush any pending transactions
    while(U1IRbits.TRNIF == 1)      
        U1IRbits.TRNIF = 0;

    // Initialize EP0 as a Ctrl EP
    U1EP0 = EP_CTRL|USB_HANDSHAKE_ENABLED;        

    EP_IN_BD(1).ADDR = ConvertToPhysicalAddress(&bootCmd);
    // Clear active configuration
    currentConfiguration = 0x00;    // USBActiveConfiguration = 0;
    //Indicate that we are now in the detached state        
    deviceState = DETACHED;         // USBDeviceState = DETACHED_STATE;

    U1CON               = USB_HOST_MODE_ENABLE | USB_SOF_DISABLE;                       // Turn of SOF's to cut down noise
    U1CON               = USB_HOST_MODE_ENABLE | USB_PINGPONG_RESET | USB_SOF_DISABLE;  // Reset the ping-pong buffers
    U1CON               = USB_HOST_MODE_ENABLE | USB_SOF_DISABLE;                       // Release the ping-pong buffers
    U1OTGCON            = USB_DPLUS_PULLDOWN_ENABLE | USB_DMINUS_PULLDOWN_ENABLE | USB_VBUS_ON;
    U1CNFG1             = USB_PING_PONG__EP0_OUT_ONLY;
    U1ADDR              = 0;                        // Set default address and LSPDEN to 0
    U1EP0bits.LSPD      = 0;
    U1SOF               = USB_SOF_THRESHOLD_64;     // Maximum EP0 packet size

    // if USB cable is attached, wait for USB to be ready
    do
    {
        EnableUSBModule();
        ProcessUSBTransactions();
    }
    while (deviceState != CONFIGURED);

    // *****
    // *****    Device never get configured
    // *****

    // Wait until boot time has expired or USB Transaction is complete
    while (1)
    {
        ProcessUSBTransactions();

        // strobing LED
        if (led_counter == 0)
            LED_PORT_INV = LED_MASK;
        led_counter++;

        // timeout ?
        if (IFS0bits.T1IF == 1)
        {
            t1_count++;
            IFS0bits.T1IF = 0;

            // if expired, then jump to user location
            if (t1_count > BOOT_TIMER_TICS)
                exit_boot();
        }
    }
}
