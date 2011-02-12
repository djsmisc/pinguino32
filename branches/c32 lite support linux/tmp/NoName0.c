/*	----------------------------------------------------------------------------
	sprintfdemo - Régis Blanchot
	--------------------------------------------------------------------------*/

void setup()
{
	//Serial.begin(9600);
	Serial.Configure(UART1, UART_ENABLE, UART_RX_TX_ENABLED,	9600);
}

void loop()
{
	u8 string[128];
	u8 *bond = "Bond";

	sprintf(string, "My name is %s, James Bond!", bond);
	//Serial.printf("%s\n\r", string);
	Serial.Printf(UART1, "%s\n\r", string);
}

