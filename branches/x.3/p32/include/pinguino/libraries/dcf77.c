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
 #define UART1DEBUG
 #include <debug.c>
#endif
#include <DCF77.h>
#include <bcd.c>
//#define bin2bcd(x)	(x - ((x/16) * 6))
//#define bcd2bin(bcd) (bcd >> 4) * 10 + bcd % 16;

/*******************************************************************************
 * Number of milliseconds to elapse before we assume a "1",
 * if we receive a falling flank before - its a 0.
*******************************************************************************/

#define DCF_Discr_millis 140

/*******************************************************************************
 * There is no signal in second 59 - detect the beginning of a new minute.
*******************************************************************************/

#define DCF_Sync_millis 1200

/*******************************************************************************
* Global variables
*******************************************************************************/

u8  SignalPin, PrevSignal, BuffPntr;
u16 PrevFlank, SyncTimout;
u32 Buff1, Buff2;

/*******************************************************************************
* Initialize the DCF77 library.
* Provide the pin number of the pin where the DCF77 signal occurs.
*******************************************************************************/

void DCF77_init(u8 dcfPin)
{
	SignalPin  = dcfPin;
	pinmode(SignalPin, INPUT);

	PrevSignal	= 0;
	PrevFlank	= 0;
	BuffPntr	= 0;
	Buff1 		= 0;
	Buff2 		= 0;
}

void Disp_Input_Binary(u32 Bits1, u32 Bits2)
{
  u8 BitC;
	serial1printf("Bits= %08x %08x \r\n", Bits1, Bits2);
    for (BitC = 32; BitC > 0; BitC--)
    {
		if ((Bits2 & (1 << (BitC-1))) > 0)
			serial1write('1');
		else
			serial1write('0');
	}
    for (BitC = 32; BitC > 0; BitC--)
    {
		if ((Bits1 & (1 << (BitC-1))) > 0)
			serial1write('1');
		else
			serial1write('0');
	}
	serial1println("  ");
}

void DCF77_appendSignal(u8 signal)
{
//	serial1printf("BuffPntr: %02d  ", BuffPntr);
	if ((signal > 0) && (BuffPntr < 32))
		Buff1 = Buff1 | (1 << BuffPntr);
	if ((signal > 0) && (BuffPntr > 31))
		Buff2 = Buff2 | (1 << (BuffPntr - 32));
//	serial1printf("Append Buff: %08x %08x  \r\n", DCF77.Buff1, DCF77.Buff2);
	BuffPntr++;
	if (BuffPntr > 59)
	{
		BuffPntr = 0;
		Buff1 	 = 0;
		Buff2 	 = 0;
	}
}

u8 Parity_Even (u32 Bits)
{
  u8 i;
  u8 p = 0;
	for (i = 0; i < 32; i++)
		if ((Bits & (1 << i)) > 0)
			p = !p;
	return p;
}


void DCF77_finalizeBuffer(void)
{
  u8 Code, Par1, Par2, Par3;
//	Disp_Input_Binary(Buff1, Buff2);

	if (BuffPntr == 59)
{
		Code = (Buff1 >> 21) & 0x7F;
		Par1 = Parity_Even(Code);
		if ((Par1 & 1) == ((Buff1 >> 28) & 1))
		{
//			serial1printf("Par1= %1x   ", Par1);
			DCF77.mm = bcd2bin(Code);
		}
		else
		{
			DCF77.mm++;
			if (DCF77.mm > 59)
				DCF77.mm = 0;
				DCF77.hh++;
				if (DCF77.hh > 23)
					DCF77.hh = 0;
		}
//		serial1printf("mm= %02x  %d \r\n", Code, DCF77.mm);

		Code = ((Buff1 >> 29) & 0x7) | ((Buff2 & 0x7) << 3);
		Par2 = Parity_Even (Code);
		if ((Par2 & 1) == ((Buff2 >> 3) & 1))
		{
//			serial1printf("Par2= %1x   ", Par2);
			DCF77.hh = bcd2bin(Code);
		}
//		serial1printf("hh= %02x  %d \r\n", Code, DCF77.hh);

		Code = (Buff2 >> 4) & 0x3FFFFF;
		Par3 = Parity_Even (Code);
		if ((Par3 & 1) == ((Buff2 >> 26) & 1))
		{
//			serial1printf("Par3= %1x   ", Par3);

			Code = (Buff2 >> 10) & 0x7;
			DCF77.dw = bcd2bin(Code);
//			serial1printf("dw= %02x  %02d \r\n", Code, DCF77.dw);

			Code = (Buff2 >> 4) & 0x3F;
			DCF77.da = bcd2bin(Code);
//			serial1printf("da= %02x  %02d \r\n", Code, DCF77.da);

			Code = (Buff2 >> 13) & 0x1F;
			DCF77.mo = bcd2bin(Code);
//			serial1printf("mo= %02x  %02d \r\n", Code, DCF77.mo);

			Code = (Buff2 >> 18) & 0xFF;
			DCF77.yr = bcd2bin(Code);
//			serial1printf("yr= %02x  %d \r\n", Code, DCF77.yr);
			SyncTimout = 0;
			DCF77.sync = 1;
		}
//		serial1printf("Tim=  %d:%02d \r\n", DCF77.hh, DCF77.mm);
//		serial1printf("Dat=: %02d-%02d-%02d  %1d\r\n", DCF77.da, DCF77.mo, DCF77.yr, DCF77.dw);
	}
	// reset stuff
	DCF77.ss    = 0;
	BuffPntr    = 0;
	Buff1 		= 0;
	Buff2 		= 0;
}

/*******************************************************************************
 * Should be called every 20 ms in order to sample the DCF signal.
 * Returns the current state of the signal: 1 for HIGH, 0 for LOW.
 ******************************************************************************/

u8 DCF77_scanSignal(void)
{
  u16 LengthPulse;
  u16 CurrFlank;
  u8  CurrSignal ;
    CurrSignal = digitalread(SignalPin);
	if (CurrSignal != PrevSignal)
	{
		if (CurrSignal == 1)
		{
			/* We detected a raising flank */
			DCF77.ss++;
			if (DCF77.ss > 59)
				DCF77.ss = 0;
			CurrFlank = millis();
			if (CurrFlank - PrevFlank > DCF_Sync_millis)
				DCF77_finalizeBuffer();
			PrevFlank = CurrFlank;
		}
		else
		{
			/* or a falling flank */
			LengthPulse = millis() - PrevFlank;
			if (LengthPulse < DCF_Discr_millis)
				DCF77_appendSignal(0);
			else
				DCF77_appendSignal(1);
		}
		PrevSignal = CurrSignal;
	}
	if (SyncTimout++ > 3000)
		DCF77.sync = 0;
	return CurrSignal;
}

#endif
