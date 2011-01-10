/*	----------------------------------------------------------------------------
	FILE:			digitalw.c
	PROJECT:		pinguinoX
	PURPOSE:		
	PROGRAMER:		jean-pierre mandon <jp.mandon@gmail.com>
	FIRST RELEASE:	02 dec. 2010
	LAST RELEASE:	02 dec. 2010
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

// 02 dec.2010 tested from 0 to 31 OK except PORTA pin
// probably an alternate function on this port, to be fixed

#ifndef __DIGITALW_C
	#define __DIGITALW_C

#define UBW32

// define for UBW32, to be updated for Pinguino32x board

#ifdef UBW32

const u32 portmask[]=
				 {2,6,6,6,6,0,4,4,
				  1,1,1,0,0,1,1,1,
				  1,0,5,5,1,1,1,1,
				  3,3,5,5,5,5,0,0,
				  0,0,0,0,2,2,2,5,
				  5,5,6,5,5,5,6,6,
				  6,4,4,0,0,6,6,5,
				  5,3,3,3,3,3,3,3,
				  3,3,2,2,3,3,3,3,
				  3};

const u32 pinmask[]={0x10,0x40,0x80,0x100,0x200,0x01,0x100,0x200,
				  0x20,0x10,0x08,0x200,0x400,0x100,0x200,0x400,
				  0x800,0x01,0x2000,0x1000,0x1000,0x2000,0x4000,0x8000,
				  0x4000,0x8000,0x10,0x20,0x04,0x100,0x04,0x08,
				  0x10,0x20,0x02,0x8000,0x08,0x04,0x02,0x80,
				  0x40,0x20,0x8000,0x10,0x08,0x04,0x2000,0x1000,
				  0x4000,0x02,0x01,0x80,0x40,0x01,0x02,0x02,
				  0x01,0x80,0x40,0x20,0x10,0x2000,0x1000,0x08,
				  0x04,0x02,0x4000,0x2000,0x01,0x800,0x400,0x200,
				  0x100};

#endif

void pinmode(u8 pin,u8 state)
{
	switch (portmask[pin])
		{
			case 0: if (state) TRISASET=pinmask[pin];
					else TRISACLR=pinmask[pin];
					break;
			case 1: if (state) TRISBSET=pinmask[pin];
					else TRISBCLR=pinmask[pin];
					break;
			case 2: if (state) TRISCSET=pinmask[pin];
					else TRISCCLR=pinmask[pin];
					break;
			case 3: if (state) TRISDSET=pinmask[pin];
					else TRISDCLR=pinmask[pin];
					break;
			case 4: if (state) TRISESET=pinmask[pin];
					else TRISECLR=pinmask[pin];
					break;
			case 5: if (state) TRISFSET=pinmask[pin];
					else TRISFCLR=pinmask[pin];
					break;
			case 6: if (state) TRISGSET=pinmask[pin];
					else TRISGCLR=pinmask[pin];
					break;
		}
}
				  				  
void digitalwrite(u8 pin,u8 state)
{
	switch (portmask[pin])
		{
			case 0: if (state) PORTASET=pinmask[pin];
					else PORTACLR=pinmask[pin];
					break;
			case 1: if (state) PORTBSET=pinmask[pin];
					else PORTBCLR=pinmask[pin];
					break;
			case 2: if (state) PORTCSET=pinmask[pin];
					else PORTCCLR=pinmask[pin];
					break;
			case 3: if (state) PORTDSET=pinmask[pin];
					else PORTDCLR=pinmask[pin];
					break;
			case 4: if (state) PORTESET=pinmask[pin];
					else PORTECLR=pinmask[pin];
					break;
			case 5: if (state) PORTFSET=pinmask[pin];
					else PORTFCLR=pinmask[pin];
					break;
			case 6: if (state) PORTGSET=pinmask[pin];
					else PORTGCLR=pinmask[pin];
					break;
		}	
}

u8 digitalread(u8 pin)
{
	switch (portmask[pin])
		{
			case 0: return((PORTA&pinmask[pin])!=0);
					break;
			case 1: return((PORTB&pinmask[pin])!=0);
					break;
			case 2: return((PORTC&pinmask[pin])!=0);
					break;
			case 3: return((PORTD&pinmask[pin])!=0);
					break;
			case 4: return((PORTE&pinmask[pin])!=0);
					break;
			case 5: return((PORTF&pinmask[pin])!=0);
					break;
			case 6: return((PORTG&pinmask[pin])!=0);
					break;
			default: return -1;
		}
return -1;			
}

#endif
