/*
	cdc example
	
	if gtkterm doesn't allow connecting to /dev/ttyACM0,
	you can create a symlink in /dev pointing /dev/ttyUSB0 to /dev/ttyACM0 thus:
	sudo ln -s /dev/ttyACM0 /dev/ttyUSB0
	open gtkterm with	:
	gtkterm --port /dev/ttyUSB0
	or
	gtkterm --port /dev/ttyACM0
*/

#include <__cdc.c>

void setup()
{
	//u8 c;
	// wait until a key is pressed
	//c = CDC.getkey();
}

void loop()
{
	u8 i;
	u8 *buffer="Test\r\n";
	u8 length;

	length=strlen(buffer);
	//CDC.printf("i=%d\r\n", i++);
	//CDC.puts(buffer, length);
	for (i=0; i<length; i++)
	{
		putUSBUSART(buffer[i],1);
		CDCTxService();
	}
}