/*
	cdc example
	pc side : gtkterm --port /dev/ttyACM0
*/

//#include <usb_function_cdc.h>

// char USB_Out_Buffer[64];
char chaine[64];		// unsigned char
u8 length;

void setup()
{
	Serial.begin(9600);
}

void loop()
{
	delay(100);
	length=CDC.read(chaine,64);
	if (length !=0) Serial.printf("longueur=%d\n\r",length);
	if (length > 0) CDC.print(chaine,length);
}