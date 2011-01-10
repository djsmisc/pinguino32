/*	----------------------------------------------------------------------------
	delay.c
	Régis Blanchot
	--------------------------------------------------------------------------*/
// Modified JPM 21/12/2010
// delay_us replaced with Delayus
// delay_ms replaced with Delayms
// renamed to arduinodelay.c

#ifndef __DELAY_C
	#define __DELAY_C

	#include "typedef.h"

	#define FOSC32	80
	#define MIPS32	FOSC / 4

// FOSC = 80 MHz
// FCY = FOSC / 4 = 20 MHz
// TCY = 1/20 MHz = 50 ns
// 1 us = 1000 ns = 20 x 50 ns

void Delayus(u8 us)
{
	us = us * MIPS32;
	while( --us != 0);
}

void Delayms(u16 ms)
{
	u8 i;
	do {
		i = 4;
		do {
			Delayus(164);
		}
		while(--i);
	}
	while(--ms);
}

#endif
