/*
	Pinguino example to read ds18b20 1wire temperature sensor
	Result is sent on usb bus and can be read with temp18b20.py
	author		Régis Blanchot
	first release	14/09/2010
	last update	06/10/2010
	IDE			Pinguino b9.2

	DS18B20 Connection
	------------------
	pin 1: GND
	pin 2: DQ (Data in/out) must be connected to the PIC
	pin 3: VDD (+5V)
	NB : 1-wire bus (DQ line) must have 4K7 pull-up resistor (connected to +5V)
*/

#define ONEWIREBUS	0		
#define LEDRUN PORTAbits.RA4	

void setup()
{
//
//
//
	
//
}

void loop()
{
	DS18B20_Temperature t;
	u8 temp[4];
//
//
//
	if (DS18B20Read(ONEWIREBUS, SKIPROM, RES12BIT, &t))
	{
//
		temp[0] = t.sign;			
		temp[1] = t.integer;		
		temp[2] = high8(t.fraction);	
		temp[3] = low8(t.fraction);
		usbsend(temp, 4);			
		LEDRUN=LEDRUN^1;
		Delayms(1000);			
	}
}

