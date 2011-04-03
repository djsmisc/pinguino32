//
//

char *string = "Hello world!";
char c = 65;
int i = 333;
long l = 115200;
float f = 3.14159265; // floating point support is not yet implemented in printf

void setup()
{
	serial1init(9600);
	serial1printf("\r\n");
	serial1printf("**************************\r\n");
	serial1printf("*** Serial Printf Demo ***\r\n");
	serial1printf("**************************\r\n");
	serial1printf("\r\n");
	serial1printf("string = %s\r\n", string);
	serial1printf("character = \"%c\"\r\n", c);
	serial1printf("signed char = %d / unsigned char = %u\r\n", -c, -c);
	serial1printf("signed int = %d / unsigned int = %u\r\n", -i, -i);
	serial1printf("signed long = %d / unsigned long = %u\r\n", -l, -l);
	serial1printf("decimal[%d] = hexa[0x%X] = binary[0b%016b] = octal[%o]\r\n", i, i, i, i);
	serial1printf("float = %f\r\n", f);
	serial1printf("justif: \"%-10s\"\r\n", "left");
	serial1printf("justif: \"%10s\"\r\n", "right");
	serial1printf(" 3: %04d zero padded\r\n", 3);
	serial1printf(" 3: %-4d left justif.\r\n", 3);
	serial1printf(" 3: %4d right justif.\r\n", 3);
	serial1printf("-3: %04d zero padded\r\n", -3);
	serial1printf("-3: %-4d left justif.\r\n", -3);
	serial1printf("-3: %4d right justif.\r\n", -3);
	serial1printf("\r\n");

	serial1printf("Press Any Key ...\r\n");
	c = serial1getkey();
	serial1printf("You pressed Key %c\r\n", c);
	serial1printf("\r\n");

	serial1printf("Press Any Key to continue ...\r\n");
	c = serial1getkey();
}

void loop()
{
	u8 *buffer;
	
	serial1printf("Write Any Texte ...\r\n");
	buffer = serial1getstring();
	serial1printf("You wrote : %s\r\n", buffer);
	serial1printf("\r\n");
}


