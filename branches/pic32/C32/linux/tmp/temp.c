//
//

void setup(void)
{
pinmode(13,OUTPUT);	// test caractères
}

void loop(void)
{
digitalwrite(13,HIGH);
Delayms(500);
digitalwrite(13,LOW);
Delayms(500);
}

