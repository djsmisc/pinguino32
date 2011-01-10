/*	----------------------------------------------------------------------------
	sprintf - Régis Blanchot
	--------------------------------------------------------------------------*/

void setup()
{
	serial_begin(9600);
}

void loop()
{
	char buf[80];

	sprintf(buf, "|justif: \"%-10s\"|\n", "left");	serial_printf("%s", buf);
	sprintf(buf, "|justif: \"%10s\"|\n", "right");	serial_printf("%s", buf);
	sprintf(buf, "| 3: %04d zero padded|\n", 3);		serial_printf("%s", buf);
	sprintf(buf, "| 3: %-4d left justif.|\n", 3);	serial_printf("%s", buf);
	sprintf(buf, "| 3: %4d right justif.|\n", 3);	serial_printf("%s", buf);
	sprintf(buf, "|-3: %04d zero padded|\n", -3);	serial_printf("%s", buf);
	sprintf(buf, "|-3: %-4d left justif.|\n", -3);	serial_printf("%s", buf);
	sprintf(buf, "|-3: %4d right justif.|\n", -3);	serial_printf("%s", buf);
}


