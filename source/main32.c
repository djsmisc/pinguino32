/*-------------------------------------------------------------------------
  main32.c - Application main function for Pinguino 32

             (c) 2010 Jean-Pierre Mandon <jp.mandon@gmail.com>
             (c) 2010 Regis Blanchot <rblanchot@gmail.com> 

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
    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
-------------------------------------------------------------------------*/

#include <system.c>
#include "../tmp/define.h"

#include "user.c"

int main(void) 
{
	SystemConfig(80000000);	// default clock frequency is 80Mhz
	setup();
	while (1)
	{
		loop();
	}
	return(0);    
}

