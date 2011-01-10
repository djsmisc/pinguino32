/*	----------------------------------------------------------------------------
	delay.c
	Régis Blanchot
	--------------------------------------------------------------------------*/
// Modified JPM 21/12/2010
// delay_us replaced with Delayus
// delay_ms replaced with Delayms

#include "typedef.h"
#include "system.c"

// FOSC = 80 MHz
// FCY = FOSC / 4 = 20 MHz
// TCY = 1/20 MHz = 50 ns
// 1 us = 1000 ns = 20 x 50 ns

void Delayus(u16 us)
{
	u8 fosc;

	fosc = GetSystemClock() / 1000000;
	us = us * fosc / 4;
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

