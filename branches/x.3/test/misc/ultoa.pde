void setup()
{
}

void loop()
{
	u32 speed=115200;
	char *string;
	
	CDC.printf("add=%s\r\n", ultoa(speed, string, 10));
}
