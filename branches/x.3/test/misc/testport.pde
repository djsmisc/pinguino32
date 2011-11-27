void setup()
{
	int i;
	for (i=8 ; i<=13 ;i++)
		pinMode(i, OUTPUT);
	SPI.begin();
}

void loop()
{
	int i;
	for (i=8; i<=13 ;i++)
		digitalWrite(i,HIGH);
	delay(500);
	for (i=8; i<=13 ;i++)
		digitalWrite(i,LOW);
	delay(500);
}