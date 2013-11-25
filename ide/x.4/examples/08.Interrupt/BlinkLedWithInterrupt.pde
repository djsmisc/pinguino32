/*	----------------------------------------------------------------------------
	blink built-in led with help from interrupt library
	----------------------------------------------------------------------------
	author:			    Régis Blanchot
	first release:  19/12/2010
	last update:	  25/11/2013
	pinguino ide:   > 9.5
 	boards:         8-bit ONLY
	--------------------------------------------------------------------------*/

void myBlink0() { toggle(0); }
void myBlink1() { toggle(1); }
void myBlink2() { toggle(2); }
void myBlink3() { toggle(3); }

void setup()
{
    pinMode(0, OUTPUT);
    pinMode(1, OUTPUT);
    pinMode(2, OUTPUT);
    pinMode(3, OUTPUT);
    OnTimer0(myBlink0, INT_MILLISEC, 100);  // Use Timer0 to toggle pin 0 every 100 ms
    OnTimer1(myBlink1, INT_MILLISEC, 200);	 // Use Timer1 to toggle pin 1 every 200 ms
    OnTimer2(myBlink2, INT_MILLISEC, 400);	 // Use Timer2 to toggle pin 2 every 400 ms
    OnTimer3(myBlink3, INT_MILLISEC, 800);	 // Use Timer3 to toggle pin 3 every 800 ms
}

void loop()
{
    // Whatever you want here
}
