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

#pragma stack 0x200 255

#include "pic18fregs.h"
#include "types.h"
#include "hardware.h"
#include "picUSB.h"
#include "config.h"

/* usb device descriptor */
__code USB_Device_Descriptor device_descriptor = 
{
    sizeof(USB_Device_Descriptor),      // Size of this descriptor in bytes
    DEVICE_DESCRIPTOR,                  // Device descriptor type
    0x0200,                             // USB Spec Release Number in BCD format (0x0100 for USB 1.0, 0x0110 for USB1.1, 0x0200 for USB2.0)
    0x02,                               // Class Code-->00
    0x00,                               // Subclass code
    0x00,                               // Protocol code
    EP0_BUFFER_SIZE,                    // Max packet size for EP0
    0x04D8,                             // Vendor ID, microchip=0x04D8, generic=0x05f9, test=0x067b
    0xFEAA,                             // Product ID 0x00A für CDC, generic=0xffff, test=0x2303
    0x0001,                             // Device release number in BCD format-->0
    0,                                  // Manufacturer string index
    0,                                  // Product string index-->1
    0,                                  // Device serial number string index
    1                                   // Number of possible configurations
};

__code USB_Configuration_Descriptor configuration_descriptor =
{
    // Configuration Descriptor Header
    {sizeof(USB_Configuration_Descriptor_Header),       // Size of this descriptor in bytes
    CONFIGURATION_DESCRIPTOR,                   // CONFIGURATION descriptor type
    sizeof(USB_Configuration_Descriptor),       // Total length of data for this configuration
    1,                                          // Number of interfaces in this configuration
    1,                                          // Index value of this configuration
    0,                                          // Configuration string index
    DEFAULT | POWERED,                          // Attributes
    20},                                         // Maximum Power Consumption in 2mA units
    // Data Interface Descriptor with in and out EPs
    {sizeof(USB_Interface_Descriptor),          // Size of this descriptor in bytes
    INTERFACE_DESCRIPTOR,                       // Interface descriptor type
    0,                                          // Interface Number
    0,                                          // Alternate Setting Number
    2,                                          // Number of endpoints in this interface
    0x00,                                       // Class code
    0x00,                                       // TODO: Subclass code
    0x00,                                       // TODO: Protocol code
    0},                                         // Index of String Descriptor Describing this interface-->2
    // Endpoint 1 Out
    {sizeof(USB_Endpoint_Descriptor),           // Size of Descriptor
    ENDPOINT_DESCRIPTOR,                        // Descriptor Type
    0x01,                                       // Endpoint Address
    0x02,                                       // Attribute = Bulk Transfer
    EP1_BUFFER_SIZE,                          // Packet Size
    0x00},                                      // Poll Intervall
    // Endpoint 1 IN
    {sizeof(USB_Endpoint_Descriptor),           // Size of Descriptor
    ENDPOINT_DESCRIPTOR,                        // Descriptor Type
    0x81,                                       // Endpoint Address
    0x02,                                       // Attribute = Bulk Transfer
    EP1_BUFFER_SIZE,                           // Packet Size
    0x00}
};

/* String descriptors for the USB device */
/*
__code unsigned char string_descriptor[3][22] =
{
    {4,STRING_DESCRIPTOR,0x09,0x04},
    {18, STRING_DESCRIPTOR, 'P',0x00,'i',0x00,'n',0x00,'g',0x00,'u',0x00,'i',0x00,'n',0x00,'o',0x00},
    {22, STRING_DESCRIPTOR, 'B',0x00,'o',0x00,'o',0x00,'t',0x00,'l',0x00,'o',0x00,'a',0x00,'d',0x00,'e',0x00,'r',0x00}
};
*/
void start_write()
{
	__asm
    
	#if defined(__18f2550) || defined(__18f4550) //|| defined(__18f14k50)
	movlw	0x55
	movwf	_EECON2			; EECON2 = 0x55;
	movlw	0xAA
	movwf	_EECON2			; EECON2 = 0xAA;
	bsf		_EECON1, 1		; EECON1bits.WR = 1; start flash/eeprom writing
	nop						; proc. can forget to execute the first operation
	#endif

    #if defined(__18f26j50) || defined(__18f14k50)
	bsf		_EECON1, 2		; EECON1bits.WREN = 1; allows write cycles to Flash program memory
    bcf     _INTCON, 7      ; INTCONbits.GIE = 0 ; disable interrupts (activated in startup sequence)
	movlw	0x55
	movwf	_EECON2			; EECON2 = 0x55;
	movlw	0xAA
	movwf	_EECON2			; EECON2 = 0xAA;
	bsf		_EECON1, 1		; EECON1bits.WR = 1; start flash/eeprom writing
	bcf		_EECON1, 2		; EECON1bits.WREN = 0; inhibits write cycles to Flash program memory
    bsf     _INTCON, 7      ; INTCONbits.GIE = 1 ; re-enable interrupts
	#endif

	__endasm;
}

void set_boot_address()
{
	TBLPTRU = bootCmd.addru;
	TBLPTRH = bootCmd.addrh;
	TBLPTRL = bootCmd.addrl;
}

void disable_boot()
{
	word big_counter = 0xFFFF;

	__asm
	clrf	_T1CON				; disable timer 1
	clrf	_UCON				; disable USB
	bsf		LED_TRIS, LED_PIN	; led input
	bcf		LED_PORT, LED_PIN	; led off
	__endasm;

	// force timeout on USB
	while (big_counter != 0) big_counter--;
}

void usb_configure_endpoints()
{
	UEP1bits.EPHSHK   = 1;		// EP handshaking on
	UEP1bits.EPOUTEN  = 1;		// EP OUT enabled
	UEP1bits.EPINEN   = 1;		// EP IN enabled
	UEP1bits.EPCONDIS = 1;		// control transfers off

	// for IN
	// set DTS bit, turn on data togle sync TOGGLE
	EP_IN_BD(1).Stat.uc  = 0b01000000;

	// for OUT
	EP_OUT_BD(1).Cnt  = EP1_BUFFER_SIZE;
	EP_OUT_BD(1).ADDR = PTR16(&bootCmd);
	// set UOWN bit, SIE owns the buffer
	EP_OUT_BD(1).Stat.uc = 0b10000000;
}

//void usb_ep_data_out_callback(char end_point, word buffer_addr, byte byte_count)
void usb_ep_data_out_callback(char end_point)
{
	byte counter;

	EP_IN_BD(end_point).Cnt = 0x00;
	set_boot_address();

	// whatever the command, keep LED high
	__asm
	bsf		LED_PORT, LED_PIN	; led on
	__endasm;

	if (bootCmd.cmd == READ_VERSION)
	{
		bootCmd.buffer[2] = MINOR_VERSION;
		bootCmd.buffer[3] = MAJOR_VERSION;
		EP_IN_BD(end_point).Cnt = 4;
		T1CON = 0b00000000; // disable timer 1
	}

	else if (bootCmd.cmd == READ_FLASH)
	{
//		set_boot_address();

		for (counter=0; counter < bootCmd.len; counter++)
		{
			__asm
			TBLRD*+
			__endasm;
			bootCmd.xdat[counter] = TABLAT;
		}

		EP_IN_BD(end_point).Cnt = 5 + bootCmd.len;
	}

    #if defined(__18f2550) || defined(__18f4550) || defined(__18f14k50)
	else if (bootCmd.cmd == WRITE_FLASH)
	{
//		set_boot_address();

		TBLPTRL = (TBLPTRL & 0xF0);   // Force 16-byte boundary

		// * The write holding register for the 18F4550 family is
		// * actually 32-byte. The code below only tries to write
		// * 16-byte because the GUI program only sends out 16-byte
		// * at a time.
		// * This limitation will be fixed in the future version.

		EECON1 = 0b10000100; // Setup writes: EEPGD=1,WREN=1
		for (counter=0; counter < bootCmd.len; counter++)
		{
			TABLAT = bootCmd.xdat[counter];
			__asm
			TBLWT*+
			__endasm;
			if ((counter & 0x0F) == 0x0F)
			{
				__asm
				TBLRD*-
				__endasm;
				start_write();
			}
		}

		EP_IN_BD(end_point).Cnt = 1;
	}
    #endif

    #if defined(__18f26j50)
	else if (bootCmd.cmd == WRITE_FLASH)
	{
//		set_boot_address();

		//TBLPTRL = ( TBLPTRL & 0xF0 );   // 0b11110000, Force 16-byte boundary

		EECON1bits.WPROG = 1; // Enable single-word write
		for (counter=0; counter < bootCmd.len; counter+=2)
		{
			TBLPTRL =  bootCmd.addrl + counter;
			TABLAT = bootCmd.xdat[counter];
			__asm
			TBLWT*+         ; TBLPTR is incremented after the write
			__endasm;
			TABLAT = bootCmd.xdat[counter + 1];
			__asm
			TBLWT*         ; TBLPTR is not incremented after the write
			__endasm;
			start_write();
		}
		EECON1bits.WPROG = 0;	// Disable single-word write
		EP_IN_BD(end_point).Cnt = 1;
	}
    #endif

    #if defined(__18f2550) || defined(__18f4550) || defined(__18f14k50)
	else if (bootCmd.cmd ==  ERASE_FLASH)
	{
		// The most significant 16 bits of the address pointer points to the block
		// being erased. Bits5:0 are ignored. (In hardware).

//		set_boot_address();

		// Setup writes: EEPGD=1,FREE=1,WREN=1
		EECON1 = 0b10010100;
		for (counter=0; counter < bootCmd.len; counter++)
		{
			start_write();
            // LEN = # of 64-byte block to erase
			__asm
			movlw	0x40
			addwf	_TBLPTRL			; TBLPTR += 64
			movlw	0x00				; if (TBLPTRL == 0)
			addwfc	_TBLPTRH			; TBLPTRH += 1
			__endasm;
		}
		// TBLPTRU = 0

		EP_IN_BD(end_point).Cnt = 1;
	}
    #endif

    #if defined(__18f26j50)
	else if (bootCmd.cmd ==  ERASE_FLASH)
	{
//		set_boot_address();         // start address

        // bootCmd.len = num. of 1024-byte blocks to erase
		for (counter=0; counter < bootCmd.len; counter++)
		{
            EECON1bits.FREE = 1;    // allow a program memory erase operation
            start_write();
            EECON1bits.FREE = 0;    // inhibit program memory erase operation

            // next block (TBLPTR = TBLPTR + 1024)
			__asm
			movlw	0x04                ; 0x04 + (TBLPTRH) -> TBLPTRH
			addwf	_TBLPTRH, 1			;  (W) + (TBLPTRH) -> TBLPTRH
                                        ; (C) is affected
			movlw	0x00				; 0x00 + (TBLPTRU) + (C) -> TBLPTRU
			addwfc	_TBLPTRU, 1			;  (W) + (TBLPTRU) + (C) -> TBLPTRU
			__endasm;
		}

		EP_IN_BD(end_point).Cnt = 1;
	}
    #endif

	else if (bootCmd.cmd ==  RESET)
	{
		disable_boot();
		__asm
		goto	ENTRY		; start user app
		__endasm;
	}

	if (EP_IN_BD(end_point).Cnt > 0)
	{
		if (EP_IN_BD(1).Stat.DTS)
			EP_IN_BD(1).Stat.uc = 0b10001000;
		else
			EP_IN_BD(1).Stat.uc = 0b11001000;
	}

	// reset size
    EP_OUT_BD(end_point).Cnt = EP1_BUFFER_SIZE;
	// set to UOWN
    EP_OUT_BD(end_point).Stat.uc = 0x80;
}

void main()
{
	byte t1_count = 0;
	word led_counter = 0;

	EP_IN_BD(1).ADDR = PTR16(&bootCmd);
	currentConfiguration = 0x00;

	__asm

    #if defined(__18f26j50)
    bsf     _OSCTUNEbits, 6     ; Enable the PLL (PLLEN=bit6)
    ; Wait 2+ms until the PLL locks before enabling USB module
    ; Clock frequency = 48 MHz
    ; Delay > 0.002 seconds > 24000 cycles
	movlw	0xFF
	movwf	r0x00
	movlw	0xFF
	movwf	r0x01
startup_loop:
	decfsz	r0x00, f
	bra 	startup_loop
	decfsz	r0x01, f
	bra 	startup_loop
    #endif

    #if defined(__18f2550) || defined(__18f4550) || defined(__18f14k50)
    movlw	0x0F
    movwf	_ADCON1				; all I/O to Digital mode
    ;movlw	0x07				; configure comparators
    ;movwf	_CMCON				; for digital input
    #endif

    #if defined(__18f26j50)
    movlw	0x0F
    movwf	_ANCON0				; Default all pins to digital
    movwf	_ANCON1				; Default all pins to digital
    #endif

	bcf		LED_TRIS, LED_PIN	; led output
	bsf		LED_PORT, LED_PIN	; led on

	movlw	b'00110001'			; prescaler 8 (0b11)
	movwf	_T1CON				; timer 1 on, 

	bsf		_INTCON, 6			; Enable Peripheral interrupt (PEIE=bit6)
	bsf		_INTCON, 7			; Enable General interrupt (GIE=bit7)

	movlw	0x00				; EECON1=0
	movwf	_EECON1             ;

	#if SPEED == LOW_SPEED
	movlw	b'00010000'			; (0x10) Enable pullup resistors and low speed mode
	#else
	movlw	b'00010100'			; (0x14) Enable pullup resistors and full speed mode
	#endif
	banksel	_UCFG
	movwf	_UCFG, b

	__endasm;

	// Initialize USB

	deviceState = DETACHED;
	while(deviceState != CONFIGURED)
	{
		EnableUSBModule();
		ProcessUSBTransactions();
	}

	while(1)
	{
		ProcessUSBTransactions();

		// strobing LED
		if (led_counter == 0)
		{
			__asm
			movlw	LED_MASK		; toggle
			xorwf	LED_PORT, f		; the led
			__endasm;
		}
		led_counter++;

		// timeout ?
		if (PIR1bits.TMR1IF == 1)
		{
			t1_count++;
			PIR1bits.TMR1IF = 0;

			// if expired, then jump to user location
			if (t1_count > BOOT_TIMER_TICS)
			{
				disable_boot();
				__asm
				goto	ENTRY		; start user app
				__endasm;
			}
		}
	}
}

/***********************************************************************
    Jumps must be declared here so :
    1/ we can simply use ENTRY (impossible in crt0Boot4.c #pragma)
    2/ avoid extra file manipulation, just need to change ENTRY in Makefile
    3/ Never use --ivt-loc option as it will also move the Reset vector from 0 to ENTRY
***********************************************************************/

//#pragma code high_priority_isr 0x0008
void high_priority_isr(void) __naked __interrupt 1
{
    __asm
    goto	ENTRY + 0x08
    __endasm;
}

//#pragma code low_priority_isr 0x0018
void low_priority_isr(void) __naked __interrupt 2
{
    __asm
    goto	ENTRY + 0x18
    __endasm;
}
