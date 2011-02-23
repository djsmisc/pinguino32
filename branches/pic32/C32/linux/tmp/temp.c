

void setup()
{
pinmode(30,OUTPUT);
}

void loop()
{
digitalwrite(30,HIGH);
Delayms(500);
digitalwrite(30,LOW);
Delayms(500);
}

