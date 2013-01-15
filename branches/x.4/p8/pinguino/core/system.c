/*  ----------------------------------------------------------------------------
    FILE:           system.c
    PROJECT:        pinguino
    PURPOSE:        pinguino system functions
    PROGRAMER:      regis blanchot <rblanchot@gmail.com>
    FIRST RELEASE:  5 Jan. 2011
    LAST RELEASE:   7 Dec. 2012
    ----------------------------------------------------------------------------
    CHANGELOG:
    21-11-2012        regis blanchot        added PINGUINO1220,1320,14k22 support
    07-12-2012        regis blanchot        added PINGUINO25K50 and 45K50 support
                                            added low power functions
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
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
    --------------------------------------------------------------------------*/

#ifndef __SYSTEM_C
#define __SYSTEM_C

#include <pic18fregs.h>
#include <typedef.h>
#include <const.h>
#include <macro.h>

#if   defined(PINGUINO1220)  || defined(PINGUINO1320)
    u32 _cpu_clock_ = 40000000;

#elif defined(PINGUINO2550)  || defined(PINGUINO4550)  || \
      defined(PINGUINO25K50) || defined(PINGUINO45K50) || \
      defined(PINGUINO2455)  || defined(PINGUINO4455)
    u32 _cpu_clock_ = 48000000;

#elif defined(PINGUINO14K22)
    u32 _cpu_clock_ = 64000000;

#elif defined(PINGUINO26J50) || defined(PINGUINO46J50)
    u32 _cpu_clock_ = 48000000;
    #define _8MHZ_      0b111       // 7
    #define _4MHZ_      0b110       // 6
    #define _2MHZ_      0b101       // 5
    #define _1MHZ_      0b100       // 4
    #define _500KHZ_    0b011       // 3
    #define _250KHZ_    0b010       // 2
    #define _125KHZ_    0b001       // 1
    #define _31KHZ_     0b000       // 0
    // Switch on Primary clock source
    #define SystemExtOsc()      do { OSCCONbits.SCS = 0b00; _cpu_clock_ = 48000000; } while (0)
    // Switch on Timer1 oscillator, assumes this is a watch crystal
    #define SystemTimer1Osc()   do { OSCCONbits.SCS = 0b01; _cpu_clock_ = 32768; } while (0)

#endif

#define SystemClock()           (_cpu_clock_)

#define SystemInstructionClock() (SystemClock()/4)

#define SystemPeripheralClock() SystemInstructionClock()

#define SystemDisablePeripheralInterrupt()  do { PIE1 = 0; PIE2 = 0;} while (0)

// Software Reset
#define SystemReset()           reset()

// Enable watchdog timer
#define SystemWatchdog()        do { WDTCONbits.SWDTEN = 1; } while (0)

// Disable watchdog timer
#define SystemNoWatchdog()        do { WDTCONbits.SWDTEN = 0; } while (0)

// Clear watchdog timer
#define SystemClearWatchdog()   clrwdt()

// Device enters sleep mode on SLEEP instruction
#define SystemSleep()           do { OSCCONbits.IDLEN = 0; sleep(); } while (0)

u8 _gie_status_ = 0;

/*  ----------------------------------------------------------------------------
    SystemPowerAlarm()
    --------------------------------------------------------------------------*/
/*
void SystemPowerAlarm()
{
    HLVDCONbits.HLVDL = 0b1100;         // set voltage trip point to 3.0V typical
    HLVDCONbits.VDIRMAG = 0;            // 0 = set flag when voltage falls below trip point
    HLVDCONbits.HLVDEN = 1;             // enable HLVD module
    while(HLVDCONbits.BGVST == 0);      // wait for stable bandgap reference voltage
    while(HLVDCONbits.IRVST == 0);      // wait for stable HLVD internal reference voltage
    WaitForStableVdd();                 // wait for stable Vdd

    INTCONbits.PEIE = 1;                // peripheral interrupt enable
    INTCONbits.GIE = 1;                 // global interrupt enable
    PIE2bits.LVDIE = 1;                 // allow HLVD interrupts
}
*/
/*  ----------------------------------------------------------------------------
    Function:            void WaitForStableVdd(void)
    PreCondition:        HLVD trip point must be configured and enabled
    Input:               None
    Output:              None
    Side Effects:        None
    Overview:            If the HLVD flag is getting set due to Vdd being
                    below the trip point, this routine will wait.
                    Once Vdd rises above the trip point and stays
                    above for several iterations, the routine will
                    return.
    --------------------------------------------------------------------------*/
/*
void WaitForStableVdd(void)
{
    unsigned int stable = 0xFFFF;
    while(stable--)
    {
        if(PIR2bits.LVDIF)              // unstable Vdd
        {
            PIR2bits.LVDIF = 0;         // clear HLVD interrupt flag
            stable = 0xFFFF;
        }
    }
}
*/

/*  ----------------------------------------------------------------------------
    SystemWaitForStableOsc() perform a loop until frequency is stable
    --------------------------------------------------------------------------*/

void SystemWaitForStableOsc()
{
    #if defined(__18f26j50) || defined(__18f46j50)

        // Enable the PLL and wait 2+ms until the PLL locks
        u16 pll_startup_counter = 600;
        OSCTUNEbits.PLLEN = 1;
        while (pll_startup_counter--);
        // if user switch to INTOSC _31KHZ_ then
        // select INTOSC/256 as a 31.25 KHz clock source
        OSCTUNEbits.INTSRC = 1;

    #elif defined(__18f25k50) || defined(__18f45k50)

        OSCCON = 0x70;              // 0b01110000 : 111 = HFINTOSC (16 MHz)
        while (!OSCCONbits.HFIOFS); // wait HFINTOSC frequency is stable (HFIOFS=1) 

    #else

        nop();
        
    #endif
}

/*  ----------------------------------------------------------------------------
    SystemUnlock() perform a system unlock sequence
    --------------------------------------------------------------------------*/

void SystemUnlock()
{
    if (INTCONbits.GIE)
    {
        INTCONbits.GIE = 0; // disable interrupts
        _gie_status_ = 1;
    }
    EECON2 = 0x55;          // magic sequence
    EECON2 = 0xAA;
/*
    __asm
    movlw   0x55
    movwf   _EECON2,1 
    movlw   0xAA
    movwf   _EECON2,1
    __endasm;
*/
}

/*  ----------------------------------------------------------------------------
    SystemLock() relock OSCCON by relocking the SYSKEY
    --------------------------------------------------------------------------*/

void SystemLock()
{
    if (_gie_status_)
        INTCONbits.GIE = 1; // enable interrupts back
}

#if defined(PIC18f26j50) || defined(PIC18f46j50)

/*  ----------------------------------------------------------------------------
    Switch on postscaled internal oscillator
    --------------------------------------------------------------------------*/

void SystemIntOsc(u8 speed)
{
    OSCCONbits.IRCF = speed;
    OSCCONbits.SCS  = 0b11;
    if (speed == _8MHZ_)   _cpu_clock_ = 8000000;
    if (speed == _4MHZ_)   _cpu_clock_ = 4000000;
    if (speed == _2MHZ_)   _cpu_clock_ = 2000000;
    if (speed == _1MHZ_)   _cpu_clock_ = 1000000;
    if (speed == _500KHZ_) _cpu_clock_ =  500000;
    if (speed == _250KHZ_) _cpu_clock_ =  250000;
    if (speed == _125KHZ_) _cpu_clock_ =  125000;
    if (speed == _31KHZ_)  _cpu_clock_ =   31250;
}

/*  ----------------------------------------------------------------------------
    Device enters deep sleep mode on SLEEP instruction
    --------------------------------------------------------------------------*/
/*
void SystemDeepSleep()
{
    // RTCC wake up cnfiguration 
    DSCONHbits.RTCWDIS = 1;  // disable RTCC as source of wake up 
    // Ultra Low Power Wake UP 
    DSCONHbits.DSULPEN = 0;  // disable ultra low power wake up module 
    DSCONLbits.ULPWDIS = 1;  // ultra low power wake up Disabled 
    OSCCONbits.IDLEN = 0;    // enable deep sleep 
    DSCONHbits.DSEN = 1;     // set the deep sleep enable bit 
    sleep();
}
*/
#endif

#endif /* __SYSTEM_C */

