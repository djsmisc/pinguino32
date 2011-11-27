// CDC.printf with long type
// Régis Blanchot 2010

u32 i = 0x7000;
//float f = 3.14;

void setup()
{
	// wait for a key to start
	while (CDC.getKey() != '\r');
}

void loop()
{
	CDC.printf("%lx\r\n", i++);
	//CDC.printf("%f\r\n", f);
}
