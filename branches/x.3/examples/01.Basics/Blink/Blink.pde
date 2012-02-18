/*
	Blink a LED
*/

#define myLED 13

void setup() {                
  // initialize the digital pin 13 as an output.
  pinMode(13, OUTPUT);     
}

void loop()
{
	toggle(myLED);			// alternate ON and OFF
	delay(1000);			// wait for a second
}
