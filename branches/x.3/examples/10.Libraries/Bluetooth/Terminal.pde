/*	---------------------------------------------------------------------------
	Send AT commands to your bluetooth module and check what it returns.
	2011 Regis Blanchot	<rblanchot@gmail.com>
	http://www.pinguino.cc
	---------------------------------------------------------------------------
	tested with Olimex PIC32-PINGUINO & MOD-BT Bluetooth Transciever Module with BGB203
	output : sudo minicom -o -D /dev/ttyACM0
	---------------------------------------------------------------------------*/

void Serial2_GetString(char *buffer)
{
	u8 i = 0;
	char c;
	
	//Serial2.flush();		// reset reception buffer
	do {
		while (!Serial2.available());
		c = Serial2.read();
		CDC.printf("[%c]", c);
		buffer[i++] = c;
	} while (c != '\r');	// AT commands ends with "\r"
	buffer[i] = '\0';		// strings must end with "\0"
	Serial2.flush();		// reset reception buffer
}

void CDC_GetCmd(char *buffer)
{
	u8 i = 0;
	char c;
	
	CDC.printf("ready.\r\n");
	do {
		c = CDC.getKey();
		CDC.printf("%c", c);
		buffer[i++] = c;
	} while (c != '\r');	// until RETURN ("\r") is hit
	CDC.printf("\r\n");
	buffer[i-1] = '\0';		// strings must end with "\0"
}

void setup()
{
	delay(2000);
	Serial2.begin(115200);	// UART baud rate = 115200
	CDC.printf("------------------\r\n");
	CDC.printf("Bluetooth Terminal\r\n");
	CDC.printf("------------------\r\n");
}

void loop()
{
	char cmd[20];
	char res[20];

	CDC_GetCmd(cmd);
	CDC.printf("Command = [%s]\r\n", cmd);
	Serial2.printf("%s", cmd);
	//delay(500);
	Serial2_GetString(res);
	CDC.printf("received [%s]\r\n", res);
}
