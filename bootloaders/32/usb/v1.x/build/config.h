/*******************************************************************************
	Title:	USB Pinguino Bootloader
	File:	config.h
	Descr.: configuration bits for supported PIC18F
	Author:	Régis Blanchot <rblanchot@gmail.com>

	This file is part of Pinguino (http://www.pinguino.cc)
	Released under the LGPL license (http://www.gnu.org/licenses/lgpl.html)
*******************************************************************************/

#ifndef _CONFIG_H
#define _CONFIG_H

#include <p32xxxx.h>

#if defined(__PIC32MX__)

    #define BOOTZONE __attribute__ ((section(".text")))

    #pragma config UPLLIDIV = DIV_2         // USB PLL Input Divider
    #pragma config UPLLEN   = ON            // USB PLL Enabled
    // USB Clock = 8MHz / UPLLIDIV = 4MHz x PLL x24 -> div 2 = 48MHz

    #pragma config FPLLIDIV = DIV_2         // PLL Input Divider
    #pragma config FPLLMUL  = MUL_20        // PLL Multiplier
    #pragma config FPLLODIV = DIV_2         // PLL Output Divider
    // CPU Clock = 8MHz / FPLLIDIV = 4MHz x FPLLMUL = 80MHz / FPLLODIV = 40MHz
    
    #pragma config FPBDIV   = DIV_1         // Peripheral Clock divisor
    // Periph. Clock = CPU Clock / FPBDIV = 40MHz
    
    #pragma config FWDTEN   = OFF           // Watchdog Timer
    #pragma config WDTPS    = PS1           // Watchdog Timer Postscale
    //#pragma config FCKSM    = CSDCMD        // Clock Switching & Fail Safe Clock Monitor
    #pragma config OSCIOFNC = OFF           // CLKO Enable
    #pragma config POSCMOD  = HS            // Primary Oscillator
    #pragma config IESO     = OFF           // Internal/External Switch-over
    #pragma config FSOSCEN  = OFF           // Secondary Oscillator Enable (KLO was off)
    #pragma config FNOSC    = PRIPLL        // Oscillator Selection
    #pragma config CP       = OFF           // Code Protect
    #pragma config BWP      = OFF           // Boot Flash Write Protect
    #pragma config PWP      = OFF           // Program Flash Write Protect
    #pragma config ICESEL   = ICS_PGx1      // ICE/ICD Comm Channel Select
    #pragma config DEBUG    = OFF           // Background Debugger Enable
    #pragma config JTAGEN   = OFF           // JTAG Disable

#else

    #error "    -------------------------------    "
    #error "     PROJECT DESIGNED FOR PIC32MX      "
    #error "    NO CONFIG. WORDS FOR YOUR CHIP.    "
    #error "    -------------------------------    "
    
#endif

#endif /* _CONFIG_H */
