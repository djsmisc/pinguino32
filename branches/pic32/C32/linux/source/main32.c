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
#ifdef PIC32_PINGUINO
#include <proc/p32mx440f256h.h>
#endif
#ifdef EMPEROR460
#include <proc/p32mx460f512l.h>
#endif
#ifdef UBW32
#include <proc/p32mx460f512l.h>
#endif

#include <system.c>
#include "../tmp/define.h"

#include "user.c"

int main(void) 
{
	#ifdef PIC32_PINGUINO
		TRISDbits.TRISD9=1;		// because PORTB is shared with SDA on Olimex board
		TRISDbits.TRISD10=1;	// because PORTB is shared with SCL on Olimex board
	#endif	
	AD1PCFG=0xFFFF;			// set port B as digital	
	SystemConfig(80000000);	// default clock frequency is 80Mhz
	#ifdef __ANALOG__
		analog_init();
    #endif
    #ifdef __MILLIS__
		millis_init();
    #endif
    #ifdef __PWM__
    	pwm_init();
    #endif    
	setup();
	while (1)
	{
		loop();
	}
	return(0);    
}
