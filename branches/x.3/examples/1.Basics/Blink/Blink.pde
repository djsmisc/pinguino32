/*
	Blink a LED
*/

#define LED	PORTDbits.RD1

void setup()
{                
  //pinMode(RUNLED, OUTPUT);
  TRISDbits.TRISD1	= OUTPUT;     
}

void loop()
{
	LED = LED ^ 1;
	delay(1000);					// wait for a second
/*
	digitalWrite(RUNLED, HIGH);	// set the LED on
	delay(1000);					// wait for a second
	digitalWrite(RUNLED, LOW);	// set the LED off
	delay(1000);					// wait for a second
*/
}
