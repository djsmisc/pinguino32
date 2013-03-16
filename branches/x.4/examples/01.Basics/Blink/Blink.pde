/*
	Blink a LED
*/

void setup()
{                
    // initialize the digital pin USERLED as an output.
    pinMode(10, OUTPUT);     
}

void loop()
{
    toggle(10);			// alternate ON and OFF
    delay(50);		        // wait for 50ms

/*	Or ...
    digitalWrite(USERLED, HIGH);
    delay(50);		     // wait for 50ms
    digitalWrite(USERLED, LOW);
    delay(50);		     // wait for 50ms
*/
}
