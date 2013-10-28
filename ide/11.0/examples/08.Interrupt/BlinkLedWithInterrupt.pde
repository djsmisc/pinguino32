/*	----------------------------------------------------------------------------
	blink built-in led with help from interrupt library
	----------------------------------------------------------------------------
	author:			Régis Blanchot
	first release:	19/12/2010
	last update:	24/12/2010
	pinguino ide:	9.5
 	boards:			8-bit ONLY
	--------------------------------------------------------------------------*/

void myBlink()
{
    u8 val;
    val = digitalRead(USERLED);
    digitalWrite(USERLED, val^1);
    //	toggle(USERLED);
}

void setup()
{
	pinMode(USERLED, OUTPUT);
	OnTimer0(myBlink, INT_MILLISEC, 100);	// Use Timer0 to toggle pin 0 every 100 ms
}

void loop()
{
}
