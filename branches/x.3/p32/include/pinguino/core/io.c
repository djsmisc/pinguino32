/*	----------------------------------------------------------------------------
	FILE:			io.c
	PROJECT:		pinguino
	PURPOSE:		PIC32 Peripheral Remappage and IOs Configuration
	PROGRAMER:		Jean-Pierre Mandon <jp.mandon@gmail.com>
 					Régis Blanchot <rblanchot@gmail.com>
	FIRST RELEASE:	16 feb. 2012
	LAST RELEASE:	16 feb. 2012
	----------------------------------------------------------------------------
	CHANGELOG:
	[20-02-12][Régis Blanchot][Exported in this file]
	[25-02-12][Régis Blanchot][Added PWM remap. for PIC32 PINGUINO 220]
	[19-05-12][Jean-Pierre Mandon][Added ANALOG,PWM,SPI,SERIAL remap for GENERIC 32 bits board]
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

#ifndef __REMAP_C
#define __REMAP_C

#include <p32xxxx.h>
#include <const.h>
#include <typedef.h>
#include <system.c>

void IOsetSpecial()
{
	#if defined(PIC32_PINGUINO) || defined(PIC32_PINGUINO_OTG)
	TRISDbits.TRISD9  = INPUT;		// because PORTB is shared with SDA on Olimex board
	TRISDbits.TRISD10 = INPUT;		// because PORTB is shared with SCL on Olimex board
	#endif	
	
	#if defined(PIC32_PINGUINO_220)
	//the followings are already declared in serial.c
	//TRISCbits.TRISC9 = OUTPUT;	// RC9 / U2TX output
	//TRISCbits.TRISC8 = INPUT;		// RC8 / U2RX input			
	#endif	
}

// All Analog Pins as Digital IOs
void IOsetDigital()
{
	#if defined(__32MX220F032D__)||defined(__32MX250F128B__)||defined(__32MX220F032B__)
			DDPCONbits.JTAGEN=0;		// check : already in system.c
			ANSELA = 0;
			ANSELB = 0;
			#if defined(__32MX220F032D__)
				ANSELC = 0;
			#endif
	#else
	AD1PCFG = 0xFFFF;
	#endif
}

// PIC32 Peripheral Remappage
void IOsetRemap()
{
SystemUnlock();
CFGCONbits.IOLOCK=0;			// unlock configuration
CFGCONbits.PMDLOCK=0;
#if defined(PIC32_PINGUINO_220)
	#ifdef __SERIAL__
		U2RXRbits.U2RXR=6;			// Define U2RX as RC8 ( D0 )
		RPC9Rbits.RPC9R=2;			// Define U2TX as RC9 ( D1 )
		U1RXRbits.U1RXR=2;			// Define U1RX as RA4 ( UEXT SERIAL )
		RPB4Rbits.RPB4R=1;			// Define U1TX as RB4 ( UEXT SERIAL )
	#endif
	#ifdef __SPI__
		SDI1Rbits.SDI1R=5;			// Define SDI1 as RA8 ( UEXT SPI )
		RPA9Rbits.RPA9R=3;			// Define SDO1 as RA9 ( UEXT SPI )
	#endif
	#ifdef __PWM__
		RPC2Rbits.RPC2R  =0b0101;	// PWM0 = OC3 as D2  = RC2
		RPC3Rbits.RPC3R  =0b0101;	// PWM1 = OC4 as D3  = RC3
		RPB5Rbits.RPB5R  =0b0101;	// PWM2 = OC2 as D11 = RB5
		RPB13Rbits.RPB13R=0b0110;	// PWM3 = OC5 as D12 = RB13
		RPB15Rbits.RPB15R=0b0101;	// PWM4 = OC1 as D13 = RB15
	#endif
#endif
#if defined(GENERIC32MX250F128)||defined(GENERIC32MX220F032)
	#ifdef __SERIAL__
		U2RXRbits.U2RXR=0b0010;		// Define U2RX as RB1 ( pin 11 )
		RPB0Rbits.RPB0R=0b0010;		// Define U2TX as RB0 ( pin 12 )
		U1RXRbits.U1RXR=0b0100;		// Define U1RX as RB2 ( pin 10 )
		RPB3Rbits.RPB3R=0b0001;		// Define U1TX as RB3 ( pin 9 )
	#endif
	#ifdef __SPI__
		SDI1Rbits.SDI1R=0b0001;		// Define SDI1 as RB5 ( pin 6 )
		RPB13Rbits.RPB13R=0b0011;	// Define SDO1 as RB13 ( pin 2 )
		RPB7Rbits.RPB7R=0b0011;		// define SS1 as RB7 ( pin 5 )
	#endif
	#ifdef __PWM__
		RPB4Rbits.RPB4R  =0b0101;	// PWM1 = OC1 as pin 8  = RB4
		RPB5Rbits.RPB5R  =0b0101;	// PWM2 = OC2 as pin 6  = RB5
		RPB14Rbits.RPB14R=0b0101;	// PWM3 = OC3 as pin 1  = RB14
		RPB13Rbits.RPB13R =0b0101;	// PWM4 = OC4 as pin 2  = RB13
		RPA4Rbits.RPA4R =0b0110;	// PWM5 = OC5 as pin 7  = RA4
	#endif
#endif
CFGCONbits.IOLOCK=1;			// relock configuration
CFGCONbits.PMDLOCK=1;	
SystemLock();
}

#endif /* __REMAP_C */
