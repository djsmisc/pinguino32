#define blinkPin 13
#define DCF77Pin 7

int previousSecond =0;

void setup(void)
{
	pinMode(blinkPin, OUTPUT);
	DCF77.init(DCF77Pin);
}

void loop(void)
{
	u8  signal;
	u8  sec, min, hour, day, mon;
	u16 year;
	
	if (DCF77.scanSignal())
		digitalWrite(blinkPin, HIGH);
	else
		digitalWrite(blinkPin, LOW);

	sec = DCF77.getSeconds();
	min = DCF77.getMinutes();
	hour= DCF77.getHours();
	day = DCF77.getDay();
	mon = DCF77.getMonth();
	year= DCF77.getYear();
	
	if (sec != previousSecond)
	{
		CDC.printf("Time: %d:%d:%d\r\n", hour, min, sec);
		CDC.printf("Date: %d.%d.%d\r\n", day, mon, year);
	}
	
	delay(20);
	previousSecond = sec;
}
