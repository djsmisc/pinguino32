/*
	Blink a LED
*/

#define LED	PORTDbits.RD1

void setup()
{                
	// EEPROM MARK used by the bootloader
	EEPROM.write(0x00, 0x5A);
	TRISDbits.TRISD1	= OUTPUT;     
}

void loop()
{
	LED = LED ^ 1;
	delay(1000);
}
