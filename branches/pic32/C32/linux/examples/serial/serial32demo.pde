/*	----------------------------------------------------------------------------
	serial32demo - Régis Blanchot
	----------------------------------------------------------------------------
	serial demo for pinguino 32 bits
	----------------------------------------------------------------------------
	TTL/RS232
		=> GND TX RX +5V (Black Green White Red)
	PIC32MX4XXL (Datasheet DS61143C-page 6)
		U1RX = RF2 (pin 52) = Green
		U1TX = RF8 (pin 53) = White
	--------------------------------------------------------------------------*/

#include <serial.c>

const u8 mainMenu[] =
{
	"\n"\
	"Welcome to Pinguino32 Serial Demo!\n"\
	"Here are the main menu choices:\n"\
	"0. SerialPrintf Test\n"\
	"1. View System Clock Frequency\n"\
	"2. View Peripheral Clock Frequency\n"\
	"3. View Actual BAUD rate\n"\
	"4. Increase BAUD rate\n"\
	"5. Decrease BAUD rate\n"\
	"6. Set Line Control\n"\
	"7. ECHO\n"
	"Please Choose a number\n"
};

const u8 lineMenu[] =
{
    "Line Control Menu\n"\
    "You may need to change your port conficuration on your terminal to see data\n"\
    "1. 8-N-1\n"\
    "2. 8-E-1\n"\
    "3. 8-O-1\n"\
    "4. 8-N-2\n"\
    "5. 8-E-2\n"\
    "6. 8-O-2\n"\
    "\n\nPlease Choose a number\n"
};

const u32 lineControl[] =
{
	(UART_8_BITS_NO_PARITY   | UART_STOP_BITS_1),
	(UART_8_BITS_EVEN_PARITY | UART_STOP_BITS_1),
	(UART_8_BITS_ODD_PARITY  | UART_STOP_BITS_1),
	(UART_8_BITS_NO_PARITY   | UART_STOP_BITS_2),
	(UART_8_BITS_EVEN_PARITY | UART_STOP_BITS_2),
	(UART_8_BITS_ODD_PARITY  | UART_STOP_BITS_2)
};

u32 baudrate;

void setup()
{
	baudrate = 9600;	// 300, 600, 1200, 2400, 4800, 9600, 19200, 38400, 57600, 115200, until Sys. Clock / 4
	serial_Configure(UART1, UART_ENABLE, UART_RX_TX_ENABLED,	baudrate);

/*	---Use one of these forms------------------------------------------------------------
	SerialConfigure(	UART1, 0x8000, 0x1400, 9600);
	SerialConfigure(	UART1, UART_ENABLE,	UART_RX_TX_ENABLED,	baudrate);
	SerialConfigure(	UART1,
							UART_ENABLE | UART_ENABLE_PINS_TX_RX_ONLY | UART_8_BITS_NO_PARITY | UART_STOP_BITS_1,
							UART_RX_TX_ENABLED | UART_INTERRUPT_ON_RX_FULL,
							baudrate);
/*	---or-----------------------------------------------------------------------
	SerialPinConfigure(UART1);
	SerialSetDataRate(UART1, baudrate);
	SerialSetLineControl(UART1, UART_ENABLE | UART_ENABLE_PINS_TX_RX_ONLY | UART_8_BITS_NO_PARITY | UART_STOP_BITS_1);
	SerialEnable(UART1, UART_RX_TX_ENABLED | UART_INTERRUPT_ON_RX_FULL);
	SerialIntConfigure(UART1, INT_PRIORITY_3, INT_SUBPRIORITY_3);
	--------------------------------------------------------------------------*/

	//Serial.Printf(UART1, "* System Clock is %2uMHz *\n\r", GetSystemClock()/1000000);

/*	---Test---------------------------------------------------------------------
	s16 i=-1000;
	char *string = "Fine !";
	loop
	{
		SerialPrintf(UART1, "Decimal[%5d] = Hexa[0x%4X] %s\n\r", i, i, string);
		i++;
	}
	--------------------------------------------------------------------------*/
}


void loop()
{
	u8 choice;
	u8 mainItem;
	u8 lineItem;

	char *string = "Hello world!";
	char c = 65;
	int i = 333;
	long l = 115200;
	//float f = 3.14159265; // floating point support is not yet implemented in printf

	serial_Printf(UART1, "%s\n", mainMenu);
	mainItem = serial_GetKey(UART1);
	mainItem -= '0';

	switch (mainItem)
	{
		case 0:
			serial_printf(UART1, "\n");
			serial_printf(UART1, "**************************\n");
			serial_printf(UART1, "*      Serial32 Demo     *\n");
			serial_printf(UART1, "**************************\n");
			serial_printf(UART1, "\n");
			serial_printf(UART1, "string = %s\n", string);
			serial_printf(UART1, "character = \"%c\"\n", c);
			serial_printf(UART1, "signed char = %d / unsigned char = %u\n", -c, -c);
			serial_printf(UART1, "signed int = %d / unsigned int = %u\n", -i, -i);
			serial_printf(UART1, "signed long = %d / unsigned long = %u\n", -l, -l);
			serial_printf(UART1, "decimal[%d] = hexa[0x%X] = binary[0b%016b] = octal[%o]\n", i, i, i, i);
			//SerialPrintf(UART1, "float = %f\n", f);
			serial_printf(UART1, "justif: \"%-10s\"\n", "left");
			serial_printf(UART1, "justif: \"%10s\"\n", "right");
			serial_printf(UART1, " 3: %04d zero padded\n", 3);
			serial_printf(UART1, " 3: %-4d left justif.\n", 3);
			serial_printf(UART1, " 3: %4d right justif.\n", 3);
			serial_printf(UART1, "-3: %04d zero padded\n", -3);
			serial_printf(UART1, "-3: %-4d left justif.\n", -3);
			serial_printf(UART1, "-3: %4d right justif.\n", -3);
			serial_printf(UART1, "\n");
			serial_printf(UART1, "Press Any Key to continue ...\n");
			serial_GetKey(UART1);
			break;
		case 1:
			serial_Printf(UART1, "**************************\n");
			serial_Printf(UART1, "* System Clock is %2uMHz *\n", GetSystemClock()/1000000);
			serial_Printf(UART1, "**************************\n");
			serial_Printf(UART1, "Press Any Key to continue ...\n");
			serial_GetKey(UART1);
			break;
		case 2:
			serial_Printf(UART1, "******************************\n");
			serial_Printf(UART1, "* Peripheral Clock is %2uMHz *\n", GetPeripheralClock()/1000000);
			serial_Printf(UART1, "******************************\n");
			serial_Printf(UART1, "Press Any Key to continue ...\n");
			serial_GetKey(UART1);
			break;
		case 3:
			serial_Printf(UART1, "**************************************\n");
			serial_Printf(UART1, "* Actual BAUD rate is %8u bauds *\n", SerialGetDataRate(UART1));
			serial_Printf(UART1, "**************************************\n");
			serial_Printf(UART1, "Press Any Key to continue ...\n");
			serial_GetKey(UART1);
			break;
		case 4:
			baudrate = baudrate << 1;
			serial_Printf(UART1, "BAUD rate was %u and will be %u bauds\n", SerialGetDataRate(UART1), baudrate);
			serial_Printf(UART1, "Press Any Character after re-configuring you terminal\n");
			serial_GetKey(UART1);
			serial_SetDataRate(UART1, baudrate);
			serial_Printf(UART1, "New BAUD rate is %u bauds\n", SerialGetDataRate(UART1));
			serial_Printf(UART1, "Press Any Key to continue ...\n");
			serial_GetKey(UART1);
			break;
		case 5:
			baudrate = baudrate >> 1;
			serial_Printf(UART1, "BAUD rate was %u and will be %u bauds\n", SerialGetDataRate(UART1), baudrate);
			serial_Printf(UART1, "Press Any Character after re-configuring you terminal\n");
			serial_GetKey(UART1);
			serial_SetDataRate(UART1, baudrate);
			serial_Printf(UART1, "New BAUD rate is %u bauds\n", SerialGetDataRate(UART1));
			serial_Printf(UART1, "Press Any Key to continue ...\n");
			serial_GetKey(UART1);
			break;
		case 6:
			serial_Printf(UART1, "%s", lineMenu);
			lineItem = serial_GetKey(UART1);
			lineItem = lineItem - '0';
			serial_Printf(UART1, "Press Any Character after re-configuring you terminal\n");
			serial_GetKey(UART1);
			serial_SetLineControl(UART1, lineControl[lineItem]);
			break;
		case 7:
			serial_Printf(UART1, "Type a message (less than 100 characters) and press return\n");
			serial_GetDataBuffer(UART1);
			serial_Printf(UART1, "You Typed:\n\n%s\n\n", UART1SerialBuffer);
			serial_Printf(UART1, "\n\nPress any key to continue");
			serial_GetKey(UART1);
			break;
	}
}
