//
//

int led1;						// led1 is an integer ( Pin )
int led2;						// led2 is an integer ( Pin )
int tempo;					// tempo is an integer

void setup() 
{
	led1=0;					// led 1 is connected on pin 1
	led2=1;					// led 2 is connected on pin 2
	tempo=500;				// tempo for blink is 500 mS
	pinmode(led1,OUTPUT);		// pin 1 is an output
	pinmode(led2,OUTPUT);		// pin 7 is an output
}

void loop() 
{

	while (1)
	{
	digitalwrite(led1,HIGH);		// led 1 high
	digitalwrite(led2,LOW);		// led 2 low
	Delayms(tempo);				// wait 0,5 second
	digitalwrite(led1,LOW);		// led 1 low
	digitalwrite(led2,HIGH);		// led 2 high
	Delayms(tempo);				// wait 0,5 second
	}
	
}	

