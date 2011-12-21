/*
	Blink a LED
*/

#define myLED 13

void setup()
{                
	pinMode(myLED, OUTPUT);
}

void loop()
{
	toggle(myLED);
	delay(1000);					// wait for a second
}
