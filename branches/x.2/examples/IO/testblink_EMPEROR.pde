// Test blink of UBW32 LED with Pinguino 32X
// Marcus Fazzi (Anunakin) 2011

//UBW32 hardware definitions file
//That file contains LED pins and Buttons for use with UBW32 and EMPEROR boards
//Emperor have one USER Button and 2 LEDs only
#include <hardware.c>

int tempo;					// tempo is an integer

void setup() 
{
	tempo=500;				// tempo for blink is 1 sec
	pinMode(BLUELED, OUTPUT);
	pinMode(REDLED, OUTPUT);
	
	//Start on setup to alternate LEDs...
	UBW32LedToggle(BLUELED);
	delay(tempo);
}

void loop() 
{
	UBW32LedToggle(REDLED);
	delay(tempo);
	UBW32LedToggle(BLUELED);
	delay(tempo);
}	