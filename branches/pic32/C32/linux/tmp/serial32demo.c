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
	"\n\r"
	"Welcome to Pinguino32 Serial Demo!\n\r"\
	"Here are the main menu choices:\n\r"\
	"0. SerialPrintf Test\n\r"\
	"1. View System Clock Frequency\n\r"\
	"2. View Peripheral Clock Frequency\n\r"\
	"3. View Actual BAUD rate\n\r"\
	"4. Increase BAUD rate\n\r"\
	"5. Decrease BAUD rate\n\r"\
	"6. Set Line Control\n\r"\
	"7. ECHO\n\r"
	"Please Choose a number\n\r"
};

const u8 lineMenu[] =
{
    "Line Control Menu\n\r"\
    "You may need to change your port conficuration on your terminal to see data\n\r"\
    "1. 8-N-1\n\r"\
    "2. 8-E-1\n\r"\
    "3. 8-O-1\n\r"\
    "4. 8-N-2\n\r"\
    "5. 8-E-2\n\r"\
    "6. 8-O-2\n\r"\
    "\n\r\n\rPlease Choose a number\n\r"
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
	SerialConfigure(UART1, UART_ENABLE, UART_RX_TX_ENABLED,	baudrate);

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

	//Serial.Printf(UART1, "* System Clock is %2uMHz *\n\r\r", GetSystemClock()/1000000);

/*	---Test---------------------------------------------------------------------
	s16 i=-1000;
	char *string = "Fine !";
	loop
	{
		SerialPrintf(UART1, "Decimal[%5d] = Hexa[0x%4X] %s\n\r\r", i, i, string);
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

	//SerialPrintf(UART1, "%s\n\r", mainMenu);
	SerialPrintf(UART1,"IEC0= %08X",IEC0);
	mainItem = SerialGetKey(UART1);
	mainItem -= '0';

	switch (mainItem)
	{
		case 0:
			SerialPrintf(UART1, "\n\r");
			SerialPrintf(UART1, "**************************\n\r");
			SerialPrintf(UART1, "*      Serial32 Demo     *\n\r");
			SerialPrintf(UART1, "**************************\n\r");
			SerialPrintf(UART1, "\n\r");
			SerialPrintf(UART1, "string = %s\n\r", string);
			SerialPrintf(UART1, "character = \"%c\"\n\r", c);
			SerialPrintf(UART1, "signed char = %d / unsigned char = %u\n\r", -c, -c);
			SerialPrintf(UART1, "signed int = %d / unsigned int = %u\n\r", -i, -i);
			SerialPrintf(UART1, "signed long = %d / unsigned long = %u\n\r", -l, -l);
			SerialPrintf(UART1, "decimal[%d] = hexa[0x%X] = binary[0b%016b] = octal[%o]\n\r", i, i, i, i);
			//SerialPrintf(UART1, "float = %f\n\r", f);
			SerialPrintf(UART1, "justif: \"%-10s\"\n\r", "left");
			SerialPrintf(UART1, "justif: \"%10s\"\n\r", "right");
			SerialPrintf(UART1, " 3: %04d zero padded\n\r", 3);
			SerialPrintf(UART1, " 3: %-4d left justif.\n\r", 3);
			SerialPrintf(UART1, " 3: %4d right justif.\n\r", 3);
			SerialPrintf(UART1, "-3: %04d zero padded\n\r", -3);
			SerialPrintf(UART1, "-3: %-4d left justif.\n\r", -3);
			SerialPrintf(UART1, "-3: %4d right justif.\n\r", -3);
			SerialPrintf(UART1, "\n\r");
			SerialPrintf(UART1, "Press Any Key to continue ...\n\r");
			SerialGetKey(UART1);
			break;
		case 1:
			SerialPrintf(UART1, "**************************\n\r");
			SerialPrintf(UART1, "* System Clock is %2uMHz *\n\r", GetSystemClock()/1000000);
			SerialPrintf(UART1, "**************************\n\r");
			SerialPrintf(UART1, "Press Any Key to continue ...\n\r");
			SerialGetKey(UART1);
			break;
		case 2:
			SerialPrintf(UART1, "******************************\n\r");
			SerialPrintf(UART1, "* Peripheral Clock is %2uMHz *\n\r", GetPeripheralClock()/1000000);
			SerialPrintf(UART1, "******************************\n\r");
			SerialPrintf(UART1, "Press Any Key to continue ...\n\r");
			SerialGetKey(UART1);
			break;
		case 3:
			SerialPrintf(UART1, "**************************************\n\r");
			SerialPrintf(UART1, "* Actual BAUD rate is %8u bauds *\n\r", SerialGetDataRate(UART1));
			SerialPrintf(UART1, "**************************************\n\r");
			SerialPrintf(UART1, "Press Any Key to continue ...\n\r");
			SerialGetKey(UART1);
			break;
		case 4:
			baudrate = baudrate << 1;
			SerialPrintf(UART1, "BAUD rate was %u and will be %u bauds\n\r", SerialGetDataRate(UART1), baudrate);
			SerialPrintf(UART1, "Press Any Character after re-configuring you terminal\n\r");
			SerialGetKey(UART1);
			SerialSetDataRate(UART1, baudrate);
			SerialPrintf(UART1, "New BAUD rate is %u bauds\n\r", SerialGetDataRate(UART1));
			SerialPrintf(UART1, "Press Any Key to continue ...\n\r");
			SerialGetKey(UART1);
			break;
		case 5:
			baudrate = baudrate >> 1;
			SerialPrintf(UART1, "BAUD rate was %u and will be %u bauds\n\r", SerialGetDataRate(UART1), baudrate);
			SerialPrintf(UART1, "Press Any Character after re-configuring you terminal\n\r");
			SerialGetKey(UART1);
			SerialSetDataRate(UART1, baudrate);
			SerialPrintf(UART1, "New BAUD rate is %u bauds\n\r", SerialGetDataRate(UART1));
			SerialPrintf(UART1, "Press Any Key to continue ...\n\r");
			SerialGetKey(UART1);
			break;
		case 6:
			SerialPrintf(UART1, "%s", lineMenu);
			lineItem = SerialGetKey(UART1);
			lineItem = lineItem - '0';
			SerialPrintf(UART1, "Press Any Character after re-configuring you terminal\n\r");
			SerialGetKey(UART1);
			SerialSetLineControl(UART1, lineControl[lineItem]);
			break;
		case 7:
			SerialPrintf(UART1, "Type a message (less than 100 characters) and press return\n\r");
			SerialGetDataBuffer(UART1);
			SerialPrintf(UART1, "You Typed:\n\r\n\r%s\n\r\n\r", UART1SerialBuffer);
			SerialPrintf(UART1, "\n\r\n\rPress any key to continue");
			SerialGetKey(UART1);
			break;
	}
}

