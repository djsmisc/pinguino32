/*
	Blink a LED
*/

#define myLED PORTA

void setup()
{                
	// EEPROM MARK used by the bootloader
	EEPROM.write(0x00, 0x5A);
	TRISA = OUTPUT;     
}

void loop()
{
	PORTA = 0x00;
	delay(1000);
	PORTA = 0xFF;
	delay(1000);
}
