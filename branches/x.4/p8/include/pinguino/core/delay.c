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

void Delayms(u16 milliseconde)
{
	u16 i;
	
	for (i=0;i<milliseconde;i++) delay10ktcy(1);
}

void Delayus(u16 microsecondes)
{
	u16 i;
	
	for (i=0;i<microsecondes;i++);
}

#endif /* __DELAY_C__ */
