/*	----------------------------------------------------------------------------
	ledcpp.pde
	Description:	Toggle Led in C++
	Author:			Régis Blanchot
	First Release:	03-04-11
	Last Release:	03-04-11
	Boards:			UBW/EMPEROR
	Arch:				32-bit
	--------------------------------------------------------------------------*/

float pi;

class Led
{
	public:
		Led()
		{
			TRISEbits.TRISE2 = OUTPUT;
		}

		void on()
		{
			PORTEbits.RE2 = ON;
		}

		void off()
		{
			PORTEbits.RE2 = OFF;
		}

		void tog()
		{
			PORTEbits.RE2 ^= 1;
		}
};	// ";" required

void setup()
{
}

void loop()
{
	Led myled;
	pi = 3.14;

	myled.tog();
	if (pi > 3.0)
		delay(500);
	else
		delay(50);
}
