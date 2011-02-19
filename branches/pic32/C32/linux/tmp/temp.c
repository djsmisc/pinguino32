//
//



void setup()
{
serial1init(9600);
}

void loop()
{
serial1printf("millis= %d\n\r",millis());
Delayms(5);
}


