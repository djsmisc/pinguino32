/*	----------------------------------------------------------------------------
	FILE:			dcf77.c
	PROJECT:		pinguino
	PURPOSE:		get Time and Date from DCF77 module
	PROGRAMER:		regis blanchot <rblanchot@gmail.com>
	FIRST RELEASE:	20 mar. 2012
	LAST RELEASE:	21 mar. 2012
	----------------------------------------------------------------------------
	Adapted from Mathias Dalheimer's work (md@gonium.net)
	----------------------------------------------------------------------------
	TODO :
	* load RTCC with DCF77 Time and Date
	* use interrupt to scan DCF77 every 15-20 ms
	----------------------------------------------------------------------------	----------------------------------------------------------------------------
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

#ifndef _DCF77_C_
#define _DCF77_C_

#include <typedef.h>			// u8, u16, ...
#include <digitalw.c>			// pinMode, ...
#include <millis.c>				// millis
#ifdef DEBUG					// NB: Turn debugging on or off from the IDE 
#include <debug.c>
#endif

//#include <bcd.c> 
#define bin2bcd(x)	(x - ( (x/16) *6))

/*******************************************************************************
 * Number of milliseconds to elapse before we assume a "1",
 * if we receive a falling flank before - its a 0.
*******************************************************************************/

#define DCF_split_millis 140

/*******************************************************************************
 * There is no signal in second 59 - detect the beginning of a new minute.
*******************************************************************************/

#define DCF_sync_millis 1200

/*******************************************************************************
 * DCF time format struct
 * NB : SDCC bit field size cannot be greater than 16 bits
*******************************************************************************/

typedef struct
{
	unsigned prefix1	:16	;
	unsigned prefix2	:5	;
	unsigned Min		:7	;	//7 Bits für die Minuten
	unsigned P1			:1	;	//Parity Minuten
	unsigned Hour		:6	;	//6 Bits für die Stunden
	unsigned P2			:1	;	//Parity Stunden
	unsigned Day		:6	;	//6 Bits für den Tag
	unsigned Weekday	:3	;	//3 Bits für den Wochentag 
	unsigned Month		:5	;	//3 Bits für den Monat
	unsigned Year		:8	;	//8 Bits für das Jahr **eine 5 für das Jahr 2005**
	unsigned P3			:1	;	//Parity von P2
	u8  pin;
	u8  previousSignalState;
	u8  ss, mm, hh, day, mon;
	u16 year;
	u16 previousFlankTime;
	u16 bufferPosition;
	u32 dcf_rx_buffer;
} DCF77Struct;

/*******************************************************************************
* Global variables
*******************************************************************************/

DCF77Struct DCF77;

/*******************************************************************************
* Prototypes
*******************************************************************************/

// public
void DCF77_init(u8);
u16  DCF77_scanSignal(void);
u8  DCF77_getSeconds();
u8  DCF77_getMinutes();
u8  DCF77_getHours();
u8  DCF77_getDay();
u8  DCF77_getMonth();
u16 DCF77_getYear();

// private
static void DCF77_appendSignal(u8);
static void DCF77_finalizeBuffer(void);
static void DCF77_addSecond();

/*******************************************************************************
* Initialize the DCF77 library.
* Provide the pin number of the pin where the DCF77 signal occurs.
*******************************************************************************/

void DCF77_init(u8 dcfPin)
{
	DCF77.pin = dcfPin;
	DCF77.previousSignalState=0;
	DCF77.previousFlankTime=0;
	DCF77.bufferPosition=0;
	DCF77.dcf_rx_buffer=0;
	DCF77.ss=0;
	DCF77.mm=0;
	DCF77.hh=0;
	DCF77.day=0;
	DCF77.mon=0;
	DCF77.year=0;
	#ifdef DEBUG 
	debug("Initializing DCF77 lib. using pin #%d\r\n", DCF77Pin);
	#endif
	pinmode(DCF77.pin, INPUT);
}

static void DCF77_appendSignal(u8 signal)
{
	#ifdef DEBUG
	debug("Appending value %d at position %d\r\n", signal, DCF77.bufferPosition);
	#endif
	DCF77.dcf_rx_buffer = DCF77.dcf_rx_buffer | ((u32) signal << DCF77.bufferPosition);
	DCF77.bufferPosition++;
	if (DCF77.bufferPosition > 59)
		DCF77_finalizeBuffer();
}

static void DCF77_finalizeBuffer(void)
{
	DCF77Struct *rx_buffer;
	#ifdef DEBUG
	debug("Finalizing Buffer\r\n");
	#endif
	if (DCF77.bufferPosition == 59)
	{
		rx_buffer = (DCF77Struct *)(u32)&DCF77.dcf_rx_buffer;
		//convert the received bits from BCD
		DCF77.mm  = bin2bcd(rx_buffer->Min);
		DCF77.hh  = bin2bcd(rx_buffer->Hour);
		DCF77.day = bin2bcd(rx_buffer->Day); 
		DCF77.mon = bin2bcd(rx_buffer->Month);
		DCF77.year= bin2bcd(rx_buffer->Year) + 2000;
	}
	// reset stuff
	DCF77.ss = 0;
	DCF77.bufferPosition = 0;
	DCF77.dcf_rx_buffer=0;
}

/*******************************************************************************
 * Should be called every 15 ms in order to sample the DCF signal.
 * Returns the current state of the signal: 1 for HIGH, 0 for LOW.
 ******************************************************************************/
 
u16 DCF77_scanSignal(void)
{
	u16 difference;
	u16 thisFlankTime;
	u8 DCFsignal = digitalread(DCF77.pin);

	if (DCFsignal != DCF77.previousSignalState)
	{
		if (DCFsignal == 1)
		{
			/* We detected a raising flank, increase per one second! */
			DCF77_addSecond();
			#ifdef DEBUG
			debug("Time: %d:%d:%d\r\n", hh, mm, ss);
			debug("Date: %d.%d.%d\r\n", day, mon, year);
			#endif
			thisFlankTime=Millis();
			if (thisFlankTime - DCF77.previousFlankTime > DCF_sync_millis)
			{
				#ifdef DEBUG
				debug("####\r\n");
				debug("#### Begin of new Minute!!!\r\n");
				debug("####\r\n");
				#endif
				DCF77_finalizeBuffer();
			}
			DCF77.previousFlankTime = thisFlankTime;
			#ifdef DEBUG
			debug("%d : DCF77 Signal detected,\r\n", DCF77.previousFlankTime);
			#endif
		}
		else
		{
			/* or a falling flank */
			difference = Millis() - DCF77.previousFlankTime;
			#ifdef DEBUG
			debug("duration: %d\r\n", difference);
			#endif
			if (difference < DCF_split_millis)
				DCF77_appendSignal(0);
			else
				DCF77_appendSignal(1);
		}
		DCF77.previousSignalState = DCFsignal;
	}
	return DCFsignal;
}

/******************************************************************************
 * Add one second to the hh:mm:ss variables.
 ******************************************************************************/

static void DCF77_addSecond()
{
	DCF77.ss++;
	if (DCF77.ss==60)
	{
		DCF77.ss=0;
		DCF77.mm++;
		if (DCF77.mm==60)
		{
			DCF77.mm=0;
			DCF77.hh++;
			if (DCF77.hh==24) 
				DCF77.hh=0;
		}
	}
}

/******************************************************************************
 * Functions to get Time and Date
 ******************************************************************************/

u8  DCF77_getSeconds()	{ return DCF77.ss;   }
u8  DCF77_getMinutes()	{ return DCF77.mm;   }
u8  DCF77_getHours()	{ return DCF77.hh;   }
u8  DCF77_getDay()		{ return DCF77.day;  }
u8  DCF77_getMonth()	{ return DCF77.mon;  }
u16 DCF77_getYear()		{ return DCF77.year; }


#endif
