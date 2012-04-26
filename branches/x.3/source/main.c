/*	-------------------------------------------------------------------------
	main.c - Application main function

	(c) 2006 Pierre Gaufillet <pierre.gaufillet@magic.fr> 

	This library is free software; you can redistribute it and/or
	modify it under the terms of the GNU Lesser General Public
	License as published by the Free Software Foundation; either
	version 2.1 of the License, or (at your option) any later version.

	This library is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
	Lesser General Public License for more details.

	You should have received a copy of the GNU Lesser General Public
	License along with this library; if not, write to the Free Software
	Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
	-------------------------------------------------------------------------*/

// modified by Jean-pierre Mandon 2008/09/19
// added bootloader V4.0 support - Régis Blanchot - 2012/04/21
// this function is part of Pinguino project

#include <pic18fregs.h>
#include <const.h>
#include <macro.h>

#ifdef boot2
	#include <common_types.h>
	#include <boot_iface.h>
#else
	#include <typedef.h>
#endif

#include "define.h"
#include <pin.h>

#ifdef __USB__
	#include <usb.h>
	#include <usb.c>
#endif

// only for compatibility with application_iface.o
#ifdef boot2
	#ifndef __USB__
		void epap_in() { return; }
		void epap_out() { return; }
		void epapin_init() { return; }
		void epapout_init() { return; }
	#endif
#endif

#include "user.c"

/*	----------------------------------------------------------------------------
	beware : this is not a C main function,
 	but the application entry point called from the bootloader.
	--------------------------------------------------------------------------*/

void pinguino_main(void)
{
	PIE1 = 0;
	PIE2 = 0;

	#if defined(PIC18F4550) || defined(PIC18F4450) || defined(PIC18F2550) || defined(PIC18F2450)
	ADCON1 = 0x0F;				// AN0 to AN12 Digital I/O
	#endif

	#if defined(PIC18F46J50) || defined(PIC18F26J50)
	ANCON0 = 0xFF;				// AN0 to AN7  Digital I/O
	ANCON1 = 0x1F;				// AN8 to AN12 Digital I/O
	#endif

	#ifdef USERINT
	int_init();					// Disable all interrupts
	#endif

	#ifdef __USB__
	PIE2bits.USBIE  = 1;
	INTCONbits.PEIE = 1;
	INTCONbits.GIE  = 1;
	#endif

	setup();

	#ifdef USERINT
	int_start();				// Enable all timers interrupts
	#endif

	#ifdef ANALOG
	analog_init();
	#endif

	#ifdef __MILLIS__
	millis_init();
	#endif

	#ifdef SERVOSLIBRARY
	servos_init();
	#endif

	#ifdef __USBCDC
	CDC_init();
	PIE2bits.USBIE  = 1;
	INTCONbits.PEIE = 1;
	INTCONbits.GIE  = 1;
	#endif    

	#ifdef __USBBULK
	bulk_init();
	PIE2bits.USBIE  = 1;
	INTCONbits.PEIE = 1;
	INTCONbits.GIE  = 1;
	#endif

	#ifdef __SERIAL__
	INTCONbits.PEIE = 1;
	INTCONbits.GIE  = 1;
	#endif 

	#ifdef MILLIS
	INTCONbits.TMR0IE= 1;
	INTCONbits.GIE  = 1;
	#endif 

	#ifdef SERVOSLIBRARY
	INTCONbits.PEIE = 1;
	INTCONbits.GIE  = 1;
	#endif

	#ifdef __PS2KEYB__
	keyboard_init()
	#endif
		
	while (1)
		loop();
}

/*	----------------------------------------------------------------------------
	High Interrupt Vector
	--------------------------------------------------------------------------*/

#ifdef boot2
#pragma code high_priority_isr 0x2020
void high_priority_isr(void) __naked __interrupt 1
#else
void high_priority_isr(void)
#endif
{
#ifdef __USBCDC
    if(PIR2bits.USBIF)
    {
        ProcessUSBTransactions();
        UIRbits.SOFIF = 0;
        UIRbits.URSTIF = 0;
        PIR2bits.USBIF = 0;
        UEIR = 0;
    }
#endif

#ifdef __USBBULK
    if(PIR2bits.USBIF)
    {
        ProcessUSBTransactions();
        UIRbits.SOFIF = 0;
        UIRbits.URSTIF = 0;
        PIR2bits.USBIF = 0;
        UEIR = 0;        
    }
#endif

#ifdef __USB__
	if(PIR2bits.USBIF)
	{
	    dispatch_usb_event();
	    UIRbits.SOFIF = 0;
	    UIRbits.URSTIF = 0;
	    PIR2bits.USBIF = 0;
	    UEIR = 0;
	}
#endif

#ifdef __SERIAL__
    if (PIR1bits.RCIF) 
		serial_interrupt();
#endif

#ifdef __MILLIS__
	if (INTCONbits.TMR0IF)
	{
		INTCONbits.TMR0IF=0;
		TMR0H=0xE8;
		TMR0L=0x50;
		_millis++;
	}	
#endif

#ifdef __I2C__
	I2C_interrupt();
#endif

#ifdef SERVOSLIBRARY
	servos_interrupt();
#endif

#ifdef INT0INT
	userhighinterrupt();
#endif

#ifdef __PS2KEYB__
	keyboard_irr();
#endif
}

/*	----------------------------------------------------------------------------
	Low Interrupt Vector
	--------------------------------------------------------------------------*/

#ifdef boot2
#pragma code low_priority_isr 0x4000
void low_priority_isr(void) __naked __interrupt 2
#else
void low_priority_isr(void)
#endif
{
#ifdef USERINT
	userinterrupt();
#endif
}
