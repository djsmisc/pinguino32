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

	psprintf(buf, "|justif: \"%-10s\"|\n", "left");	serial_printf("%s", buf);
	psprintf(buf, "|justif: \"%10s\"|\n", "right");	serial_printf("%s", buf);
	psprintf(buf, "| 3: %04d zero padded|\n", 3);		serial_printf("%s", buf);
	psprintf(buf, "| 3: %-4d left justif.|\n", 3);	serial_printf("%s", buf);
	psprintf(buf, "| 3: %4d right justif.|\n", 3);	serial_printf("%s", buf);
	psprintf(buf, "|-3: %04d zero padded|\n", -3);	serial_printf("%s", buf);
	psprintf(buf, "|-3: %-4d left justif.|\n", -3);	serial_printf("%s", buf);
	psprintf(buf, "|-3: %4d right justif.|\n", -3);	serial_printf("%s", buf);
}

