/*  -------------------------------------------------------------------------
    FILE:           main.c
    PROJECT:        pinguino
    PURPOSE:        application main function
    PROGRAMER:      Jean-pierre Mandon - Régis Blanchot
    FIRST RELEASE:  19 Sep 2008
    LAST RELEASE:   14 Dec. 2012
    ----------------------------------------------------------------------------
    CHANGELOG :
    Originally based on a file by (c) 2006 Pierre Gaufillet <pierre.gaufillet@magic.fr>
    19 Sep 2008 - Jean-pierre Mandon - adapted to Pinguino  
    21 Apr 2012 - Régis Blanchot - added bootloader v4.x support
    20 Jun 2012 - Régis Blanchot - added io.c support (remapping)
    ----------------------------------------------------------------------------
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

#include <pic18fregs.h>
#include <const.h>
#include <macro.h>
#include <typedef.h>

#ifdef boot2
    #include <common_types.h>
    #include <boot_iface.h>
#endif

#ifdef boot4
    // runtime start code with variable initialisation
    #include "crt0iPinguino.c"
#endif

/*
#ifdef __USB__
    #include <usb.h>
    #include <usb.c>
#endif
*/

// only for compatibility with application_iface.o
#ifdef boot2
    #ifndef __USB__
        void epap_in()      { return; }
        void epap_out()     { return; }
        void epapin_init()  { return; }
        void epapout_init() { return; }
    #endif
#endif

#include "define.h"
// files that need define.h to be included first
#include <pin.h>
#include <io.c>

// user's .pde file translated to C
#include "user.c"

#ifdef noboot
// in order to use default startup code
void main(void)
#else
// Application entry point called from the bootloader
void pinguino_main(void)
#endif
{
    SystemWaitForStableOsc();
    SystemDisablePeripheralInterrupt();
    
    IOsetSpecial();
    IOsetDigital();
    IOsetRemap();
    
    #ifdef ON_EVENT             // Enable General/Peripheral interrupts
    int_init();                 // Disable all individual interrupts
    #endif

    #ifdef __USB__
		#if defined(__18f25k50) || defined(__18f45k50)
			PIE3bits.USBIE = 1;
        #else
			PIE2bits.USBIE = 1;
        #endif
        INTCONbits.PEIE = 1;
        INTCONbits.GIE  = 1;
    #endif

    //setup();

    //#ifdef ON_EVENT
    //int_start();                // Enable all defined timers interrupts
    //#endif

    #ifdef ANALOG
    analog_init();
    #endif

    #ifdef __MILLIS__          // Use Timer 0
    millis_init();
    #endif

    #ifdef SERVOSLIBRARY
    servos_init();
    #endif

    #ifdef __USBCDC
        CDC_init();
		#if defined(__18f25k50) || defined(__18f45k50)
			PIE3bits.USBIE = 1;
        #else
			PIE2bits.USBIE = 1;
        #endif
        INTCONbits.PEIE = 1;
        INTCONbits.GIE  = 1;
    #endif    

    #ifdef __USBBULK
        bulk_init();
		#if defined(__18f25K50) || defined(__18f45K50)
			PIE3bits.USBIE = 1;
        #else
			PIE2bits.USBIE = 1;
        #endif
        INTCONbits.PEIE = 1;
        INTCONbits.GIE  = 1;
    #endif

    #ifdef __PS2KEYB__
    keyboard_init()
    #endif

    #if defined(__SERIAL__) || defined(SERVOSLIBRARY)
    INTCONbits.PEIE = 1;
    INTCONbits.GIE  = 1;
    #endif 

/*  RB : millis.c/millis_init() did already the job
    #ifdef MILLIS
    INTCONbits.TMR0IE= 1;
    INTCONbits.GIE  = 1;
    #endif 
*/

    setup();
    
    #ifdef ON_EVENT
    int_start();                // Enable all defined timers interrupts
    #endif

    while (1)
        loop();
}

/*  ----------------------------------------------------------------------------
    High Interrupt Vector
    --------------------------------------------------------------------------*/

#ifdef boot2

    #pragma code high_priority_isr 0x2020
    void high_priority_isr(void) __interrupt 1

#else

    // ENTRY + 0x08
    void high_priority_isr(void) __interrupt 1

#endif
{
#if defined(__USBCDC) || defined(__USBBULK)
    #if defined(__18f25k50) || defined(__18f45k50)
    if(PIR3bits.USBIF)
    #else
    if(PIR2bits.USBIF)
    #endif
    {
        ProcessUSBTransactions();
        UIRbits.SOFIF = 0;
        UIRbits.URSTIF = 0;
        #if defined(__18f25k50) || defined(__18f45k50)
        PIR3bits.USBIF = 0;
        #else
        PIR2bits.USBIF = 0;
        #endif
        UEIR = 0;
    }
#endif

#ifdef __USB__
    #if defined(__18f25k50) || defined(__18f45k50)
    if(PIR3bits.USBIF)
    #else
    if(PIR2bits.USBIF)
    #endif
    {
        dispatch_usb_event();
        UIRbits.SOFIF = 0;
        UIRbits.URSTIF = 0;
        PIR2bits.USBIF = 0;
        UEIR = 0;
    }
#endif

#ifdef __SERIAL__
    #if defined(__18f1220)  || defined(__18f1320)   || \
        defined(__18f14k22) || defined(__18lf14k22) || \
        defined(__18f2550)  || defined(__18f4550)   || \
        defined(__18f25k50) || defined(__18f45k50)  || \
        defined(__18f2455)  || defined(__18f4455)
        if (PIR1bits.RCIF) 
    #elif defined(__18f26j50) || defined(__18f46j50)
        if (PIR1bits.RC1IF) 
    #else
        #error "Processor Not Yet Supported. Please, Take Contact with Developpers."
    #endif
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

//#ifdef __I2C__
//    I2C_interrupt();
//#endif

#ifdef SERVOSLIBRARY
    servos_interrupt();
#endif

#ifdef INT0INT
    userhighinterrupt();
#endif

#ifdef __PS2KEYB__
    keyboard_isr();
#endif

#ifdef __DCF77__
    dcf77_interrupt();
#endif
}

/*  ----------------------------------------------------------------------------
    Low Interrupt Vector
    --------------------------------------------------------------------------*/

#ifdef boot2

    #pragma code low_priority_isr 0x4000
    void low_priority_isr(void) __interrupt 2

#else

    // ENTRY + 0x18
    void low_priority_isr(void) __interrupt 2

#endif

{
#ifdef USERINT
    userinterrupt();
#endif

#ifdef ON_EVENT
    userlowinterrupt();
#endif
}
