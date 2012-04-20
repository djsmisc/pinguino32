#define blinkPin 10
#define DCF77Pin 0

char DaysOfWeek[7][4]		= {"Sun","Mon","Tue","Wed","Thu","Fri","Sat"};

u8 PrevSec = 0;

void setup(void)
{
   Serial.begin(9600);
	pinMode(GREENLED, OUTPUT);
	pinMode(YELLOWLED, OUTPUT);
	DCF77.init(DCF77Pin);
	delay(500);
	Serial.println("\r\n*  Pinguino DCF77 demo  *");
}

void loop(void)
{
	toggle(YELLOWLED);
	if (DCF77.scanSignal())
		digitalWrite(GREENLED, HIGH);
	else
		digitalWrite(GREENLED, LOW);

//	if ((DCF77.ss != PrevSec) && (DCF77.ss % 10 == 0))
	if (DCF77.ss != PrevSec)
	{
		Serial.printf("Time: %02d:%02d:%02d    ", DCF77.hh, DCF77.mm, DCF77.ss);
		Serial.printf("Date: %s  %02d-%02d-%02d  %1d  ", DaysOfWeek[DCF77.dw], DCF77.da, DCF77.mo, DCF77.yr, DCF77.dw);
		if (DCF77.sync > 0)
			Serial.printf("Synced  ");
		Serial.println("");
	}
	
	delay(20);
	PrevSec = DCF77.ss;
}
