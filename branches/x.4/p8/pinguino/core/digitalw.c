/*	--------------------------------------------------------------------
	FILE:			digitalw.c
	PROJECT:		pinguino
	PURPOSE:		Digital IO management
	PROGRAMER:		Jean-Pierre MANDON
	FIRST RELEASE:	2008
	LAST RELEASE:	2012/12/07
	----------------------------------------------------------------------------
	TODO : 
	----------------------------------------------------------------------------
    CHANGELOG :
        jean-pierre mandon : modification 2009/08/08 18F4550
        regis blanchot 2011/08/09 : FreeJALduino support
        regis blanchot 2012/02/14 : Pinguino 26J50 support
        regis blanchot 2012/09/28 : complete rewrite
        regis blanchot 2012/11/19 : Pinguino 1220 and 1320 support
        regis blanchot 2012/12/07 : Pinguino 25k50 and 45k50 support
	----------------------------------------------------------------------------
	This library is free software; you can redistribute it and/or
	modify it under the terms of the GNU Lesser General Public
	License as published by the Free Software Foundation; either
	version 2.1 of the License, or (at your option) any later version.

	This library is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
	Lesser General Public License for more details.

	You should have received a copy of the GNU Lesser General Public
	License along with this library; if not, write to the Free Software
	Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
	------------------------------------------------------------------*/

#ifndef __DIGITALW__
#define __DIGITALW__

//#include <pic18fregs.h>
#include <typedef.h>

/*
#define pB	0
#define pC	1
#define pA	2
#define pD	3
#define pE	4
#define pF	5
#define pG	6
*/

#define pA	0
#define pB	1
#define pC	2
#define pD	3
#define pE	4
#define pF	5
#define pG	6

#define _0	0x01    // 1<<0
#define _1	0x02    // 1<<1 
#define _2	0x04    // 1<<2
#define _3	0x08    // 1<<3 
#define _4	0x10    // 1<<4 
#define _5	0x20    // 1<<5 
#define _6	0x40    // 1<<6 
#define _7	0x80    // 1<<7 

/**********************************************************************/
#if defined(PINGUINO1220) || defined(PINGUINO1320)
/**********************************************************************/
                                                    // Pinguino pin number
const u8 mask[19]={	_0,_1,_2,_3,_4,_5,_6,_7,        // 0 - 7
					_0,_1,_2,_3,_4,_5};             // 8 - 13

const u8 port[19]={	pB, pB, pB, pB, pB, pB, pB, pB, // 0 - 7
					pA, pA, pA, pA, pA, pA};        // 8 - 13

/**********************************************************************/
#elif defined(PINGUINO14K22)
/**********************************************************************/
                                                    // Pinguino pin number
const u8 mask[19]={	_0,_1,_2,_3,_4,_5,_6,_7,        // 0 - 7
					_6,_7,_0,_1,_2,                 // 8 - 12
					_0,_1,_2,_3,_5,_4};             // 13 - 18

const u8 port[19]={	pB, pB, pB, pB, pB, pB, pB, pB, // 0 - 7
					pC, pC, pC, pC, pC,             // 8 - 12
					pA, pA, pA, pA, pA, pA};        // 13 - 18

/**********************************************************************/
#elif defined(PINGUINO2550) || defined(PINGUINO25K50) || defined(CHRP3)
/**********************************************************************/
                                                    // Pinguino pin number
const u8 mask[19]={	_0,_1,_2,_3,_4,_5,_6,_7,        // 0 - 7
					_6,_7,_0,_1,_2,                 // 8 - 12
					_0,_1,_2,_3,_5,_4};             // 13 - 18

const u8 port[19]={	pB, pB, pB, pB, pB, pB, pB, pB, // 0 - 7
					pC, pC, pC, pC, pC,             // 8 - 12
					pA, pA, pA, pA, pA, pA};        // 13 - 18

/**********************************************************************/
#elif defined(PINGUINO26J50)
/**********************************************************************/
                                                    // Pinguino pin number
const u8 mask[18]={	_0,_1,_2,_3,_4,_5,_6,_7,        // 0 - 7
					_6,_7,_0,_1,_2,                 // 8 - 12
					_0,_1,_2,_3,_5};                // 13 -17

const u8 port[18]={	pB, pB, pB, pB, pB, pB, pB, pB, // 0 -7
					pC, pC, pC, pC, pC,             // 8 - 12
					pA, pA, pA, pA, pA};            // 13 - 17

/**********************************************************************/
#elif defined(PINGUINO4550) || defined(PINGUINO45K50)
/**********************************************************************/
                                                    // Pinguino pin number
const u8 mask[29]={	_0,_1,_2,_3,_4,_5,_6,_7,		// 0 - 7
					_6,_7,_0,_1,_2,					// 8 - 12
					_0,_1,_2,_3,_5,_4,				// 13 - 18
					_0,_1,_2,						// 19 - 21
					_0,_1,_2,_3,_4,_5,_6,_7};		// 22 - 29

const u8 port[29]={	pB, pB, pB, pB, pB, pB, pB, pB,
					pC, pC, pC, pC, pC,
					pA, pA, pA, pA, pA, pA,
					pE, pE, pE,
					pD, pD, pD, pD, pD, pD, pD, pD};

/**********************************************************************/
#elif defined(FREEJALDUINO)
/**********************************************************************/

const u8 mask[19]={_7,_6,_4,_0,_1,_2,_3,_4,_5,_6,_7,_0,_1,_2,_0,_1,_2,_3, _5};
const u8 port[19]={1,1,2,0,0,0,0,0,0,0,0,1,1,1,2,2,2,2,2};

/**********************************************************************/
#elif defined(PICUNO_EQUO)
/**********************************************************************/

const u8 mask[14]={_7,_6,_2,_3,_0,_2,_1,_1,_2,_3,_4,_5,_6,_7};
const u8 port[14]={1,1,0,0,3,1,1,3,3,3,3,3,3,3};

#else
    #error "Processor Not Yet Supported. Please, Take Contact with Developpers."
#endif

void digitalwrite(u8 pin, u8 state)
{
/*
	switch (port[pin])
	{
		case pB: if (state) PORTB=PORTB | mask[pin]; 
				else PORTB=PORTB & (255-mask[pin]);
				break;
		case pC: if (state) PORTC=PORTC | mask[pin];
				else PORTC=PORTC & (255-mask[pin]);
				break;
		case pA: if (state) PORTA=PORTA | mask[pin];
				else PORTA=PORTA & (255-mask[pin]);
				break;
		#if defined(PINGUINO4550) || defined(PICUNO_EQUO) 
		case pD: if (state) PORTD=PORTD | mask[pin]; 
				else PORTD=PORTD & (255-mask[pin]);
				break;
		case pE: if (state) PORTE=PORTE | mask[pin]; 
				else PORTE=PORTE & (255-mask[pin]);
				break;
		#endif
	}
*/
    u8 b = mask[pin];           // bit
    u8 *p;

    p = port[pin] + 0xF80;      // lat
    
    if (state)
        *p |= b;                // set bit
    else
        *p &= (255-b);          // clear bit
}

u8 digitalread(u8 pin)
{
/*
	switch (port[pin])
	{
		case pB: if ((PORTB & mask[pin])!=0) return (1);
			else return (0);
			break;
		case pC: if ((PORTC & mask[pin])!=0) return (1);
			else return (0);
			break;
		case pA: if ((PORTA & mask[pin])!=0) return (1);
			else return (0);
			break;
		#if defined(PINGUINO4550) || defined(PICUNO_EQUO) 
		case pD: if ((PORTD & mask[pin])!=0) return (1);
			else return (0);
			break;
		case pE: if ((PORTE & mask[pin])!=0) return (1);
			else return (0);
			break;
		#endif	
	}
	return (0);
*/
    u8 *p;

    p = port[pin] + 0xF80;      // lat
    
    if ((*p & mask[pin]) == 0)
        return 0;               // bit is not set
    else
        return 1;               // bit is set
}

void pinmode(u8 pin, u8 state)
{
/*
	switch (port[pin])
	{
		case pB: if (state) TRISB=TRISB | mask[pin];
			else TRISB=TRISB & (255-mask[pin]);
			break;
		case pC: if (state) TRISC=TRISC | mask[pin];
			else TRISC=TRISC & (255-mask[pin]);
			break;
		case pA: if (state) TRISA=TRISA | mask[pin];
			else TRISA=TRISA & (255-mask[pin]);
			break;
		#if defined(PINGUINO4550) || defined(PICUNO_EQUO) 
		case pD: if (state) TRISD=TRISD | mask[pin];
			else TRISD=TRISD & (255-mask[pin]);
			break;
		case pE: if (state) TRISE=TRISE | mask[pin];
			else TRISE=TRISE & (255-mask[pin]);
			break;
		#endif	
	}
*/
    u8 b = mask[pin];           // bit
    u8 *p;
    
    p = port[pin] + 0xF92;      // tris
    
    if (state)                  // if 1
        *p |= b;                // set bit (input)
    else                        // if 0
        *p &= (255-b);          // clear bit (output)
}

void toggle(u8 pin)
{
/*
	u8 val;
	val = digitalread(pin);
	digitalwrite(pin, val^1);
*/
    u8 b = mask[pin];           // bit
    u8 *p;
    
    p = port[pin] + 0xF80;      // lat
    
    if ((*p & b) == 0)          // bit is not set ?
        *p |= b;                // set bit
    else                        // bit is set ?
        *p &= (255-b);          // clear bit
}

#endif /* __DIGITALW__ */
