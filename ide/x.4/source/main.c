/*  -------------------------------------------------------------------------
    FILE:           main.c
    PROJECT:        pinguino
    PURPOSE:        application main function
    PROGRAMER:      Jean-pierre Mandon - Régis Blanchot
    FIRST RELEASE:  19 Sep 2008
    LAST RELEASE:   05 Jan 2013
    ----------------------------------------------------------------------------
    CHANGELOG :
    Originally based on a file by (c) 2006 Pierre Gaufillet <pierre.gaufillet@magic.fr>
    19 Sep 2008 - Jean-pierre Mandon - adapted to Pinguino  
    21 Apr 2012 - Régis Blanchot - added bootloader v4.x support
    20 Jun 2012 - Régis Blanchot - added io.c support (remapping)
    05 Fev 2013 - Régis Blanchot - added interrupt init
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
#include <typedef.h>
#include <const.h>
#include <macro.h>


#ifdef boot2
    #include <common_types.h>
    #include <boot_iface.h>
#endif

#ifdef boot4
    // runtime start code with variables initialisation
    #include "crt0iPinguino.c"
    /*
    #ifdef __USB__
        #include <usb.h>
        #include <usb.c>
    #endif
    */
#endif

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
    // Perform a loop for some processors until their frequency is stable

    #if defined(__18f26j50) || defined(__18f46j50)

        // Enable the PLL and wait 2+ms until the PLL locks
        u16 pll_startup_counter = 600;
        OSCTUNEbits.PLLEN = 1;
        while (pll_startup_counter--);

    #elif defined(CHRP3)
    
        // wait HFINTOSC frequency is stable (HFIOFS=1) 
        while (!OSCCONbits.HFIOFS);

    #endif

    // Interrupt init

    RCON   = 0x80;                // Enable priority levels on interrupts
/*
    INTCON = 0;     INTCON2 = 0;    INTCON3 = 0;
    PIR1   = 0;     PIR2    = 0;  // Flag
    PIE1   = 0;     PIE2    = 0;  // Enable
    IPR1   = 1;     IPR2    = 1;  // Priority
    #if defined(__18f26j50) || defined(__18f46j50)
    PIR3    = 0;    PIE3    = 0;    IPR3    = 1;
    #endif
*/
    // I/O init 

    IOsetDigital();
    IOsetRemap();
    
    #ifdef ON_EVENT
    IntInit();
    #endif

    #ifdef __USB__
    usb_init();
    #endif

    #ifdef __USBCDC
    CDC_init();
    #endif    

    #ifdef __USBBULK
    bulk_init();
    #endif

    #ifdef ANALOG
    analog_init();
    #endif

    #ifdef __MILLIS__           // Use Timer 0
    millis_init();
    #endif

    #ifdef SERVOSLIBRARY        // Use Timer 1
    servos_init();
    #endif

    #ifdef __PS2KEYB__
    keyboard_init()
    #endif

////////////////////////////////////////////////////////////////////////
    setup();
////////////////////////////////////////////////////////////////////////
    
    #if defined(TMR0INT) || defined(TMR1INT) || \
        defined(TMR2INT) || defined(TMR3INT) || \
        defined(TMR4INT)
    IntTimerStart();                // Enable all defined timers interrupts
    #endif

    while (1) {
////////////////////////////////////////////////////////////////////////
        loop();
////////////////////////////////////////////////////////////////////////
    }
}

/*  ----------------------------------------------------------------------------
    High Interrupt Vector
    --------------------------------------------------------------------------*/

#ifdef boot2

#pragma code high_priority_isr 0x2020
void high_priority_isr(void) __interrupt 1

#else

// boot4 : ENTRY + 0x08
// noboot: 0x08
void high_priority_isr(void) __interrupt 1 //__naked

#endif
{
    #ifdef __USBCDC 
    CDC_interrupt();
    #endif
    
    #if defined(__USBBULK)
    bulk_interrupt();
    #endif

    #ifdef __USB__
    usb_interrupt();
    #endif

    #ifdef __SERIAL__
    serial_interrupt();
    #endif

    #ifdef __MILLIS__
    millis_interrupt();
    #endif

    #ifdef I2CINT
    I2C_interrupt();
    #endif

    #ifdef SERVOSLIBRARY
    servos_interrupt();
    #endif

    #ifdef INT0INT
    userhighinterrupt();
    #endif

    #ifdef __PS2KEYB__
    keyboard_interrupt();
    #endif

    #ifdef __DCF77__
    dcf77_interrupt();
    #endif

    #ifdef RTCCALARMINTENABLE
    rtcc_interrupt();
    #endif
}

/*  ----------------------------------------------------------------------------
    Low Interrupt Vector
    --------------------------------------------------------------------------*/

#ifdef boot2

#pragma code low_priority_isr 0x4000
void low_priority_isr(void) __interrupt 2

#else

// boot4 : ENTRY + 0x18
// noboot: 0x18
void low_priority_isr(void) __interrupt 2 //__naked

#endif

{
    #ifdef USERINT
    userinterrupt();
    #endif

    #ifdef ON_EVENT
    userlowinterrupt();
    #endif
}
