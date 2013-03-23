//
//

void setup(void)
{
pinmode(0,OUTPUT);	// test caractères
}

void loop(void)
{
digitalwrite(0,HIGH);
Delayms(500);
digitalwrite(0,LOW);
Delayms(500);
}

