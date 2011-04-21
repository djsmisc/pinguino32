//
//

char *string = "Hello world!";
char c = 65;
int i = 333;
long l = 115200;
float f = 3.14159265; // floating point support is not yet implemented in printf
void setup()
{
	serial_begin(9600);
}
void loop()
{
	serial_printf("\r\n");
	serial_printf("**************************\r\n");
	serial_printf("*** Serial Printf Demo ***\r\n");
	serial_printf("**************************\r\n");
	serial_printf("\r\n");
	serial_printf("string = %s\r\n", string);
	serial_printf("character = \"%c\"\r\n", c);
	serial_printf("signed char = %d / unsigned char = %u\r\n", -c, -c);
	serial_printf("signed int = %d / unsigned int = %u\r\n", -i, -i);
	serial_printf("signed long = %d / unsigned long = %u\r\n", -l, -l);
	serial_printf("decimal[%d] = hexa[0x%X] = binary[0b%016b] = octal[%o]\r\n", i, i, i, i);
	serial_printf("float = %f\r\n", f);
	serial_printf("justif: \"%-10s\"\r\n", "left");
	serial_printf("justif: \"%10s\"\r\n", "right");
	serial_printf(" 3: %04d zero padded\r\n", 3);
	serial_printf(" 3: %-4d left justif.\r\n", 3);
	serial_printf(" 3: %4d right justif.\r\n", 3);
	serial_printf("-3: %04d zero padded\r\n", -3);
	serial_printf("-3: %-4d left justif.\r\n", -3);
	serial_printf("-3: %4d right justif.\r\n", -3);
	serial_printf("\r\n");
	serial_printf("Press Any Key to continue ...\r\n");
	serial_getkey();
}


