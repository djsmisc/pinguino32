// millis library for pinguino
// Jean-Pierre MANDON 2009
// added interrupt.c functions (regis blanchot 2011)
// [14-05-12][jp.mandon changed long to u32 and Millis to millis / thanks mark harper]
// [31-01-13][r.blanchot use of SystemGetInstructionClock()]

#ifndef _MILLIS_C_
#define _MILLIS_C_

#include <pic18fregs.h>
#include <typedef.h>
#include <interrupt.h>
#include <interrupt.c>
#include <oscillator.c>         // SystemGetInstructionClock()

volatile u32 _millis;

void millis_init(void)
{
    intUsed[INT_TMR0] = INT_USED;

    /*
    T0CON = 0x80;		// TMR0 on, 16 bits counter, prescaler=2
    INTCON |= 0xA0;		// set GIE and TMR0IE
    */
    
    // if Fosc = 48 MHz then Fosc/4 = 12MHz
    // which means 12.E-06 cycles/sec = 12.000 cycles/ms
    // if TMR0 is loaded with 65536 - 12000
    // overload will occur after 12.000 cycles = 1ms
    
    INTCONbits.GIEH = 0;   // Disable global HP interrupts
    INTCONbits.GIEL = 0;   // Disable global LP interrupts
    TMR0H = high8(0xFFFF - SystemGetInstructionClock() / 1000 / 2);
    TMR0L =  low8(0xFFFF - SystemGetInstructionClock() / 1000 / 2);
    T0CON = T0_ON | T0_16BIT | T0_SOURCE_INT | T0_PS_OFF;
    INTCON2bits.TMR0IP = INT_HIGH_PRIORITY;
    INTCONbits.TMR0IE = INT_ENABLE;
    INTCONbits.TMR0IF = 0;
    INTCONbits.GIEH = 1;   // Enable global HP interrupts
    INTCONbits.GIEL = 1;   // Enable global LP interrupts

    _millis = 0;
}

u32 millis()
{
    return(_millis);
}

// called by interruption service routine in main.c    if (INTCONbits.TMR0IF)
void millis_interrupt(void)
{
    if (INTCONbits.TMR0IF)
    {
        INTCONbits.TMR0IF = 0;
        TMR0H = high8( 0xFFFF - SystemGetInstructionClock() / 1000 / 2 );
        TMR0L =  low8( 0xFFFF - SystemGetInstructionClock() / 1000 / 2 );
        _millis++;
    }
}

#endif /* _MILLIS_C_ */
