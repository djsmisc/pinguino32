/*	----------------------------------------------------------------------------
	FILE:				math.c
	PROJECT:			pinguino - http://www.pinguino.cc/
	PURPOSE:			various mathematics functions
	PROGRAMER:		regis blanchot <rblanchot@gmail.com>
	FIRST RELEASE:	12 apr. 2011
	LAST RELEASE:	12 apr. 2011
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

#ifndef __MATH_C
#define __MATH_C

#include <typedef.h>

u32 dec2bcd(u32 dec)
{
	return ((dec/10)<<4)+(dec%10);
}

u32 bcd2dec(u32 bcd)
{
	return ((bcd>>4)*10)+bcd%16;
}

#endif
