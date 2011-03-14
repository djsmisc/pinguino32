/*	----------------------------------------------------------------------------
	hardware.c
	Régis Blanchot
	--------------------------------------------------------------------------*/

#ifndef __HARDWARE_C
	#define __HARDWARE_C

	#include "const.h"
	#include "typedef.h"
	#include "delay.c"
	#include "digitalw.c"

	// UBW32 built-in leds
    #define LED4        4//PORTEbits.RE3	// green led
	#define LED3		3//PORTEbits.RE0	// yellow led
	#define LED2		2//PORTEbits.RE1	// red led
	#define LED1		1//PORTEbits.RE2	// white led

    #define GREENLED    4//PORTEbits.RE3	// green led
	#define YELLOWLED	3//PORTEbits.RE0	// yellow led
	#define REDLED		2//PORTEbits.RE1	// red led
	#define WHITELED	1//PORTEbits.RE2	// white led

	// UBW32 built-in buttons
    #define USERBUTTON  69	// pin 44 = PORTEbits.RE6 = user button
    #define PROGBUTTON  68	// pin 43 = PORTEbits.RE7 = prog button

/*	----------------------------------------------------------------------------
	SwitchDebounce()
	----------------------------------------------------------------------------
	Check twice button value in a short period of time (delayms)
	to make sure it's definitely pressed
	pin		: pin number where switch is connected
	delayms : period whithin button must keep same value (50ms should be a good value)
	return	: value is return only if it's stable
	--------------------------------------------------------------------------*/

u8 SwitchDebounce(u8 pin, u16 ms)
{
	u8 state1 = 0;
	u8 state2 = 0;

	while(1)
	{
		state1 = (digitalread(pin) == 1 ? 1 : 0);		// Met l'état de la pin dans state1
		Delayms(ms);									// anti-rebond 50 milisecondes
		state2 = (digitalread(pin) == 1 ? 1 : 0);		// Met l'état de la pin dans state2
		if(state2 == state1) return state1;				// Si l'etat est stable pendant 50 ms
	}
}

/*	----------------------------------------------------------------------------
	Toggle Led from UBW32 board
	--------------------------------------------------------------------------*/

void UBW32LedToggle(u8 led)
{
	switch (led)
	{
		case LED1:
			//LATEbits.LATE2 = 1;
			TRISEbits.TRISE2 = OUTPUT;
			PORTEbits.RE2 ^= 1;
			break;
		case LED2:
			//LATEbits.LATE1 = 1;
			TRISEbits.TRISE1 = OUTPUT;
			PORTEbits.RE1 ^= 1;
			break;
		case LED3:
			//LATEbits.LATE0 = 1; // open drain output
			TRISEbits.TRISE0 = OUTPUT;
			PORTEbits.RE0 ^= 1;
			break;
        case LED4:
			//LATEbits.LATE3 = 1; // open drain output
			TRISEbits.TRISE3 = OUTPUT;
			PORTEbits.RE3 ^= 1;
			break;
	}
}

#endif

