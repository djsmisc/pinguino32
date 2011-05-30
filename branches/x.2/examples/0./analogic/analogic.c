//
//

unsigned int i;

void setup() 
	{
	serial1init(9600);
	}

void loop() 
	{
	while (1) 	{
			i=analogRead(15);
			Serial.print("input 15=");
			Serial.print(i,DEC);
			Serial.print("\n\r");
			}
}
