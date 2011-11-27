/*	---------------------------------------------------------------------------
	Pinguino BASIC
	2011 Regis Blanchot
	<rblanchot@gmail.com>
	http://www.pinguino.cc

	output:
	sudo minicom -o -D /dev/ttyACM0
	press <return> to start
	---------------------------------------------------------------------------*/

#include "pbasic.c"

#define PB_SDCS 8	// SD Card Select pin

/*---------------------------------------------------------------------------*/
void setup(void)
{
	pbasic_init();
}
/*---------------------------------------------------------------------------*/
void loop(void)
{
	pbasic();
}
/*---------------------------------------------------------------------------*/
