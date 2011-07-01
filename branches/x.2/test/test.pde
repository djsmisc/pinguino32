u8 i;

void setup()
{
}

void loop()
{
	CDC.printf("i=%03d\r\n",i++);
	delay(100);
}
