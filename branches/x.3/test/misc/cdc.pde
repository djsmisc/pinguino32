// CDC.printf with long type
// Régis Blanchot 2010
// sudo minicom -o -D /dev/ttyACM0

u32 i = 0;
float pi = 3.14159265;

void setup()
{
	// wait for a key to start
	//while (CDC.getKey() != '\r');
}

void loop()
{
	CDC.printf("%ld\t%f\r\n", i++, i*pi);
}
