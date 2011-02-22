/*	----------------------------------------------------------------------------
	lcd.printf demo
	<rblanchot@gmail.com>
	----------------------------------------------------------------------------
	---------- LCD 2x16
	----------------------------------------------------------------------------
	01 - VSS (GND)
	02 - VDD (+5V)
	03 - Vo (R = 1K Ohm to GND)
	04 - RS (pin 8 in this ex.)
	05 - RW (GND = LOW = write mode)
	06 - EN (pin 9 in this ex.)
	07 a 10 - D0 a D3   (connected to GND in this ex.)
	11 a 16 - D4 to D7  (pin 0 to 3 in this ex.)
	15 - LED+ (R = 470 Ohm to +5V)
	16 - LED- (GND)
	---------------------------------------------------------------------------*/
 
// Comment line above if you using a pinguino with PIC18F2550.
//#define PIC18F4550

// Global vars

u8 sec  = 0;
u8 min  = 0;
u8 hour = 0;

// This function is called every sec. by timer 0

void tick()
{
	sec++;
	
	if (sec > 59)
	{
		sec = 0;
		min++;
	}
	
	if (min > 59)
	{
		min = 0;
		hour++;
	}
	
	if (hour > 23)
	{
		hour = 0;
	}
	
	lcd.setCursor(4, 1);
	lcd.printf("%02u:%02u:%02u", hour, min, sec);
}

void setup()
{
	// 4 bits mode, last four pins arenot used
	lcd(8, 9, 0, 1, 2, 3, 0, 0, 0, 0); // RS, E, D4 ~ D8	

	// LCD format
	lcd.begin(2, 0); // lines, dotsize

	lcd.home(); // 0, 0
	lcd.printf(" lcd.printf demo");
	
	// Timer0 call function tick() every sec.
	OnTimer0(tick, INT_MILLISEC, 1000);
}
 
void loop()
{
}
