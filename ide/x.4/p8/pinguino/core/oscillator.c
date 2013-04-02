/*  ----------------------------------------------------------------------------
    FILE:           oscillator.c
    PROJECT:        pinguino
    PURPOSE:        pinguino system functions
    PROGRAMER:      regis blanchot <rblanchot@gmail.com>
    FIRST RELEASE:  5 Jan. 2011
    LAST RELEASE:   2 jan. 2013
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

#ifndef __OSCILLATOR_C
#define __OSCILLATOR_C

#include <pic18fregs.h>
#include <typedef.h>
#include <const.h>
#include <macro.h>

#ifndef CRYSTAL
#define CRYSTAL 4000000L
#endif

// The indices are valid values for PLLDIV
//static const u8 plldiv[] = {  1,  2,  3,  4,  5,  6, 10,  12 };

// The indices are valid values for CPDIV
static const u8 cpudiv[] = { 1, 2, 3, 6 };

// The indices are valid values for IRCF
#if defined(__18f14k22) || \
    defined(__18f25k50) || defined(__18f45k50)

static const u32 ircf[] = { 31250, 250000, 500000, 1000000, 2000000, 4000000, 8000000, 16000000 };

#elif   defined(__18f2455)  || defined(__18f4455)  || \
        defined(__18f2550)  || defined(__18f4550)  || \
        defined(__18f26j50) || defined(__18f46j50)

static const u32 ircf[] = { 31250, 125000, 250000, 500000, 1000000, 2000000, 4000000, 8000000 };

#endif

#if defined(__18f14k22)
    u32 _cpu_clock_ = 1000000;      // Default Config.
    #define _64MHZ_     0b10000111  // 7  NB = 16 x PLL
    #define _32MHZ_     0b10000110  // 7  NB =  8 x PLL
    #define _16MHZ_     0b111       // 7
    #define _8MHZ_      0b110       // 6
    #define _4MHZ_      0b101       // 5
    #define _2MHZ_      0b100       // 4
    #define _1MHZ_      0b011       // 3
    #define _500KHZ_    0b010       // 2
    #define _250KHZ_    0b001       // 1
    #define _31KHZ_     0b000       // 0
/*  ----------------------------------------------------------------------------
    Switch on Primary clock source
    --------------------------------------------------------------------------*/
    #define SystemSetExtOsc()      do { OSCCONbits.SCS = 0b00; _cpu_clock_ = 64000000; } while (0)
/*  ----------------------------------------------------------------------------
    Switch on Timer1 oscillator, assumes this is a watch crystal
    --------------------------------------------------------------------------*/
    #define SystemSetTimer1Osc()   do { OSCCONbits.SCS = 0b01; _cpu_clock_ = 32768; } while (0)

#elif defined(__18f25k50) || defined(__18f45k50)

    u32 _cpu_clock_ = 48000000;
    #define _16MHZ_     0b111       // 7
    #define _8MHZ_      0b110       // 6
    #define _4MHZ_      0b101       // 5
    #define _2MHZ_      0b100       // 4
    #define _1MHZ_      0b011       // 3
    #define _500KHZ_    0b010       // 2
    #define _250KHZ_    0b001       // 1
    #define _31KHZ_     0b000       // 0
/*  ----------------------------------------------------------------------------
    Switch on Primary clock source
    --------------------------------------------------------------------------*/
    #define SystemSetExtOsc()      do { OSCCONbits.SCS = 0b00; _cpu_clock_ = 48000000; } while (0)
/*  ----------------------------------------------------------------------------
    Switch on Timer1 oscillator, assumes this is a watch crystal
    --------------------------------------------------------------------------*/
    #define SystemSetTimer1Osc()   do { OSCCONbits.SCS = 0b01; _cpu_clock_ = 32768; } while (0)

#elif defined(__18f2455)  || defined(__18f4455)  || \
      defined(__18f2550)  || defined(__18f4550)  || \
      defined(__18f26j50) || defined(__18f46j50)
      
    u32 _cpu_clock_ = 48000000;
    #define _48MHZ_     0b10000111  // 7  NB = PLL 96MHz / 2
    #define _8MHZ_      0b111       // 7
    #define _4MHZ_      0b110       // 6
    #define _2MHZ_      0b101       // 5
    #define _1MHZ_      0b100       // 4
    #define _500KHZ_    0b011       // 3
    #define _250KHZ_    0b010       // 2
    #define _125KHZ_    0b001       // 1
    #define _31KHZ_     0b000       // 0
    
/*  ----------------------------------------------------------------------------
    Switch on Primary clock source
    --------------------------------------------------------------------------*/
    #define SystemSetExtOsc()      do { OSCCONbits.SCS = 0b00; _cpu_clock_ = 48000000; } while (0)
/*  ----------------------------------------------------------------------------
    Switch on Timer1 oscillator, assumes this is a watch crystal
    --------------------------------------------------------------------------*/
    #define SystemSetTimer1Osc()   do { OSCCONbits.SCS = 0b01; _cpu_clock_ = 32768; } while (0)

#endif

/*  ----------------------------------------------------------------------------
    Return current Clock frequency (Fosc) in Hz (not MHz !)
    --------------------------------------------------------------------------*/
#define SystemGetClock()           (_cpu_clock_)

/*  ----------------------------------------------------------------------------
    Return current Instruction Clock frequency (Fosc/4) in Hz (not MHz !)
    --------------------------------------------------------------------------*/
#define SystemGetInstructionClock() (_cpu_clock_/4)

/*  ----------------------------------------------------------------------------
    Return current Peripheral Clock frequency (Fosc/4) in Hz (not MHz !)
    --------------------------------------------------------------------------*/
#define SystemGetPeripheralClock() (_cpu_clock_/4)

/*  ----------------------------------------------------------------------------
    SystemReadFlashMemory() read in all relevant clock settings
    --------------------------------------------------------------------------*/

u16 SystemReadFlashMemory(u32 address)
{
	u8 h8,l8;

	TBLPTRU=address>>16;
	TBLPTRH=address>>8;
	TBLPTRL=address;
	__asm tblrd*+ __endasm;
	l8=TABLAT;
	__asm tblrd*+ __endasm;
	h8=TABLAT;
	return((h8<<8)+l8);
}

/*  ----------------------------------------------------------------------------
    Calculates the CPU frequency.

    - if PLL is enabled
        * CPU Freq. = 48MHz / CPUDIV
        * Incoming Freq. = 4 * PLLDIV (unused) (x3 or x4 on 25k50)
    - if PLL is disabled
        * if OSCCONbits.SCS == 0, Incoming Freq. = External Oscillator
                CPU Freq. = Incoming Freq. / CPUDIV
                Inc. Freq. is unknown, must be defined by user (for ex. #define CRYSTAL = 8000000L)
        * if OSCCONbits.SCS == 1, Incoming Freq. = Timer1
                CPU Freq. = Incoming Freq.
                how to get freq. from Timer 1 ?
        * if OSCCONbits.SCS >= 2, Incoming Freq. = Internal Oscillator
                CPU Freq. = Incoming Freq.
                Inc. Freq. = IRCF bits

    TODO : 18f14k22
    --------------------------------------------------------------------------*/

u32 SystemClocksGetCpuFrequency() 
{
    u8 CPUDIV;
    
    #if defined(__18f25k50) || defined(__18f45k50) || \
        defined(__18f2455)  || defined(__18f4455)  || \
        defined(__18f2550)  || defined(__18f4550)
    CPUDIV  = SystemReadFlashMemory(__CONFIG1L) & 0b00011000;
    #else
    CPUDIV  = SystemReadFlashMemory(__CONFIG1H) & 0b00000011;
    #endif

    #if defined(__18f25k50) || defined(__18f45k50)
    if (OSCCON2bits.PLLEN)
    #elif defined(__18f2455) || defined(__18f4455) || \
          defined(__18f2550) || defined(__18f4550)
    if (1)          // No PLLEN bit
    #else
    if (OSCTUNEbits.PLLEN)
    #endif

    {
        return 48000000L / cpudiv[CPUDIV];
    }
    else
    {
        switch (OSCCONbits.SCS)
        {
            case 0: // primary osc. (internal or external / CPUDIV)
                return CRYSTAL / cpudiv[CPUDIV];
            case 1: // secondary osc. (timer 1, most of the time 32768 Hz)
                return 32768;
            case 2: // reserved or postscaled internal clock
            case 3: // postscaled internal clock (IRCF)
                return ircf[OSCCONbits.IRCF];
        }
    }
}

/*  ----------------------------------------------------------------------------
    Calculates the Peripheral frequency.
    On PIC18F, Peripheral Freq. = CPU. Freq. / 4
    TODO : replace with #define
    --------------------------------------------------------------------------*/

u32 SystemClocksGetPeripheralFrequency() 
{
    return SystemClocksGetCpuFrequency() >> 2;
}

/*  ----------------------------------------------------------------------------
    Switch on postscaled internal oscillator
    * 18f14k22 : PLL enabled = INTOSC x 4 only if INTOSC = 8 or 16 MHz
    --------------------------------------------------------------------------*/

#if defined(__18f14k22) || \
    defined(__18f2550)  || defined(__18f4550)  || \
    defined(__18f25k50) || defined(__18f45k50) || \
    defined(__18f26j50) || defined(__18f46j50)

#if defined(SYSTEMSETINTOSC) || defined(SYSTEMSETPERIPHERALFREQUENCY)
void SystemSetIntOsc(u8 speed)
{
    u8 flag=0;
    
    #if defined(__18f26j50) || defined(__18f46j50)
    u16 pll_startup_counter = 600;
    #endif

    OSCCONbits.SCS  = 0b11;     // Select Internal Osc.
    
    #if defined(__18f25k50) || defined(__18f45k50)
    OSCCON2bits.PLLEN = 0;      // PLL disabled
    OSCCON2bits.INTSRC = 1;     // select INTOSC as a 31.25 KHz clock source
    #elif defined(__18f2550) || defined(__18f4550) || \
          defined(__18f2550) || defined(__18f4550)
    OSCTUNEbits.INTSRC = 1;     // select INTOSC as a 31.25 KHz clock source
    #else
    OSCTUNEbits.PLLEN = 0;      // PLL disabled
    OSCTUNEbits.INTSRC = 1;     // select INTOSC as a 31.25 KHz clock source
    #endif

    #if defined(__18f14k22)
    if (speed == _64MHZ_) {_cpu_clock_ = 64000000; flag = 1; OSCTUNEbits.PLLEN = 1; }
    #endif

    #if defined(__18f26j50) || defined(__18f46j50)
    if (speed == _48MHZ_)
    {
        _cpu_clock_ = 48000000;
        OSCTUNEbits.PLLEN = 1;
        // Enable the PLL and wait 2+ms until the PLL locks
        while (pll_startup_counter--);
    }
    #endif

    #if defined(__18f14k22)
    if (speed == _32MHZ_) {_cpu_clock_ = 32000000; OSCTUNEbits.PLLEN = 1; }
    #endif

    #if defined(__18f14k22) || defined(__18f25k50) || defined(__18f45k50)
    if (speed == _16MHZ_)  _cpu_clock_ = 16000000;
    #endif

    if (speed == _8MHZ_)   _cpu_clock_ =  8000000;
    if (speed == _4MHZ_)   _cpu_clock_ =  4000000;
    if (speed == _2MHZ_)   _cpu_clock_ =  2000000;
    if (speed == _1MHZ_)   _cpu_clock_ =  1000000;
    if (speed == _500KHZ_) _cpu_clock_ =   500000;
    if (speed == _250KHZ_) _cpu_clock_ =   250000;

    #if defined(__18f2455)  || defined(__18f4455)  || \
        defined(__18f2550)  || defined(__18f4550)  || \
        defined(__18f26j50) || defined(__18f46j50)
    if (speed == _125KHZ_) _cpu_clock_ =   125000;
    #endif

    if (speed == _31KHZ_)  _cpu_clock_ =    31250;

    if (speed >= 128)       speed -= 128;
    OSCCONbits.IRCF = speed;

    #if defined(__18f25k50) || defined(__18f45k50)
    while (!OSCCONbits.HFIOFS); // wait INTOSC frequency is stable (HFIOFS=1) 
    #endif
}

#ifdef SYSTEMSETPERIPHERALFREQUENCY
void SystemSetPeripheralFrequency(u8 speed)
{
    SystemSetIntOsc(speed*4);
}
#endif /* SYSTEMSETPERIPHERALFREQUENCY */

#endif /* defined(SYSTEMSETINTOSC) || defined(SYSTEMSETPERIPHERALFREQUENCY) */

#endif /* defined(__18f14k22) ... */

#endif /* __OSCILLATOR_C */

