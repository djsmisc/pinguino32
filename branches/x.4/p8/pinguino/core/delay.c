/*	----------------------------------------------------------------------------
	FILE:			delay.c
	PROJECT:		pinguino
	PURPOSE:		pinguino delays functions
	PROGRAMER:		jean-pierre mandon
	FIRST RELEASE:	2008
	LAST RELEASE:	
	----------------------------------------------------------------------------
	CHANGELOG:
    *
    TODO:
    * check rountines are interuptible
    * get SystemClock() to calculate right delays
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

#ifndef __DELAY_C__
#define __DELAY_C__

//#ifndef __DELAY_H__
#include <delay.h>
//#endif

#include <typedef.h>
//#include <macro.h>
//#include <system.c>

// ex.
// Clock = 48MHz -> SystemInstructionClock = 12MHz = 12.000.000 Hz
// 12.000.000 Instructions per second
// 12.000     Instructions per millisecond
// 12         Instructions per microsecond
//#define _cycles_per_second_         (SystemInstructionClock())
//#define _cycles_per_millisecond_    (SystemInstructionClock() / 1000)
//#define _cycles_per_microsecond_    (_cycles_per_millisecond_ / 1000)

/*
void DelayCy(u16 p)
{
    while (p--) nop();
}
*/

void Delayms(u16 milliseconds)
{
//    DelayCy(milliseconds * _cycles_per_millisecond_);

    u16 i;
    
    for (i=0;i<milliseconds;i++) delay10ktcy(1);

}

void Delayus(u16 microseconds)
{
//    DelayCy(microseconds * _cycles_per_microsecond_);

    u16 i;

    for (i=0;i<microseconds;i++);

}

#endif /* __DELAY_C__ */
