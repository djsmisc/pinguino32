//
//

u32 i = 0x7000;
//

void setup()
{
//
	while (CDCgetkey() != '\r');
}

void loop()
{
	CDCprintf("%lx\r\n", i++);
//
}

