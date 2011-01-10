/*	----------------------------------------------------------------------------
	test.c - Régis Blanchot
	----------------------------------------------------------------------------
	system library test
	----------------------------------------------------------------------------
	TTL/RS232
		=> GND TX RX +5V (Black Green White Red)
	PIC32MX4XXL (Datasheet DS61143C-page 6)
		U1RX = RF2 (pin 52) = Green
		U1TX = RF8 (pin 53) = White
	--------------------------------------------------------------------------*/

#include <proc/p32mx460f512l.h>
#include <p32xxxx.h>
#include <pinguino/pinguino.h>

#include <pinguino/serial1.c>

int main(void)
{
	SystemConfig(12000000L);
	SerialConfigure(UART1, UART_ENABLE,	UART_RX_TX_ENABLED,	9600);
	SerialPrintf(UART1, ">> System Clock is %2uMHz *\n\r", GetSystemClock()/1000000L);
}


