/*
	cdc example
	pc side : gtkterm --port /dev/ttyACM0
*/

//
u8 chaine[64];		// unsigned char
u8 length;

void setup()
{
	serial1init(9600);
}

void loop()
{
	Delayms(10);
	length=getsUSBUSART(chaine,64);
	if (length !=0) serial1printf("longueur=%d\n\r",length);
	if (length > 0) CDCputs(chaine,length);
}
