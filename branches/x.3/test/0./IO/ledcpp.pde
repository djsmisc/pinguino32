/*	----------------------------------------------------------------------------
	ledcpp.pde
	Description:	Toggle Led in C++
	Author:			Régis Blanchot
	First Release:	03-04-11
	Last Release:	13-04-11
	Boards:			UBW/EMPEROR
	Arch:				32-bit
	--------------------------------------------------------------------------*/

#include <led.h>

Led myled = Led(0);

void setup()
{
}

void loop()
{
	myled.toggle();
	delay(500);
}
