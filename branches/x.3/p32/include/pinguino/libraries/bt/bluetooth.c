/*	----------------------------------------------------------------------------
	FILE:			bluetooth.c
	PROJECT:		pinguino
	PURPOSE:		BGB203 basic function
	PROGRAMER:		regis blabnchot <rblanchot@gmail.com>
	FIRST RELEASE:	28 oct. 2011
	LAST RELEASE:	
	----------------------------------------------------------------------------
	This library is free software; you can redistribute it and/or
	modify it under the terms of the GNU Lesser General Public
	License as published by the Free Software Foundation; either
	version 2.1 of the License, or (at your option) any later version.

	This library is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
	Lesser General Public License for more details.

	You should have received a copy of the GNU Lesser General Public
	License along with this library; if not, write to the Free Software
	Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
	--------------------------------------------------------------------------*/

#ifndef __BLUETOOTH_C
#define __BLUETOOTH_C

#include <stdarg.h>				// variable args
#include <typedef.h>			// u8, u32, ... definitions
#include <digitalw.c>			// toggle
#include <serial.c>				// Serial functions
#include <delay.c>				// DelayMs
#include <itoa.c>				// ultoa()
#include <__cdc.c>

#define BT_DELAY		50		// Delay (ms) before sending a new command to the BT module

// BT return codes
typedef enum
{
	BT_OK		=	111,
	BT_ERROR,
	BT_COMPLETE
} BT_EVENT;

// BT response
typedef struct
{
	BT_EVENT	event;
	u8*			buffer;
} BT_RESPONSE;

// Get status error from the module
u8 BT_ok(u8 uart_port)
{
	BT_RESPONSE response;
	
	// get a complete response from the module
	response.buffer = BT_getResponse(uart_port);

	// check if status is OK
	if ((response.buffer[i-2] == 'O') && (response.buffer[i-1] == 'K'))
	{
		response.buffer[i-2] = '\0';
		response.event = BT_OK;
	}
	else
	{
		response.event = BT_ERROR;
	}
	return response;
}

// Get a complete response from the module
char * BT_getResponse(u8 uart_port)
{
	u8 i = 0;
	char c;
	static char buffer[80];
	
	do {
		c = SerialRead(uart_port);
		if ((c != '\r') && (c != '\n') && (c != 255))
			buffer[i++] = c;
		Delayms(10);
	} while (c != 255);
	// C string must be null-terminated
	buffer[i] = '\0';
	CDCprintf("buffer = %s\r\n", buffer);

	return (buffer);
}

// Send an AT command to the module over the UART Port
void BT_sendCommand(u8 uart_port, u8 *fmt, ...)
{
	SerialFlush(uart_port);
	SerialPrintf(uart_port, fmt);
	CDCprintf(fmt);
	Delayms(50);
}

// Restore the current configuration settings back to the settings
// that were stored by the Factory Settings tool
// or settings that were stored to Flash.
void BT_restore(u8 uart_port)
{
	BT_sendCommand(uart_port,"AT&F\r");
}

// Restore the current configuration settings back to internal default values
void BT_reset(u8 uart_port)
{
	BT_sendCommand(uart_port,"ATZ\r");
}

// Ask the module for its firmware version 
void BT_getFirmware(u8 uart_port)
{
	BT_sendCommand(uart_port,"ATI\r");
}

// Change module name
void BT_setDeviceName(u8 uart_port, u8 * name)
{
	BT_sendCommand(uart_port,"AT+BTLNM=\"%s\"\r", name); 
}

// Get module name
u8 * BT_getDeviceName(u8 uart_port)
{
	BT_sendCommand(uart_port,"AT+BTLNM?\r");
/*
	while (!UART2SerialBuffer);
	return UART2SerialBuffer;
*/
}

// Set bluetooth device address (0x01)
void BT_setDeviceAddress(u8 uart_port, u8 * bdaddr)
{
	BT_sendCommand(uart_port,"AT+BTSET=1,%s\r", bdaddr);
}

// Get bluetooth device address
u8 * BT_getDeviceAddress(u8 uart_port)
{
	BT_sendCommand(uart_port,"AT+BTBDA?\r");
/*
	while (!UART2SerialBuffer);
	return UART2SerialBuffer;
*/
}

// Allows automatic Bluetooth connection
void BT_setAutoConnection(u8 uart_port)
{
	BT_sendCommand(uart_port,"AT+BTAUT=1,0\r");
}

void BT_setUARTSpeed(u8 uart_port, u32 baud_rate)
{
	char *string;

	// Change UART settings (baud rate, data bits, stop bits, parity, stop bits, flow control)
	// Enable RTS/CTS, DTR/DSR Flow control
	BT_sendCommand(uart_port,"AT+BTURT=%s,8,0,1,3\r", ultoa(baud_rate, string, 10));
}

// Disable security process when pairing
void BT_disableSecurity(u8 uart_port)
{
	BT_sendCommand(uart_port,"AT+BTSEC=0\r");
}

// Writes above setting to the BGB203 flash memory
void BT_writeFlash(u8 uart_port)
{
	BT_sendCommand(uart_port,"AT+BTFLS\r");
}

// Start Bluetooth Server
void BT_start(u8 uart_port)
{
	BT_sendCommand(uart_port,"AT+BTSRV=1\r");
}

// Get into command mode
void BT_setCommandMode(u8 uart_port)
{
	BT_sendCommand(uart_port,"+++\r");
}

// Configures the device not to echo received characters in command mode
void BT_echoOff(u8 uart_port)
{
	BT_sendCommand(uart_port,"ATE0\r");
}

// Configures the device to echo received characters in command mode
void BT_echoOn(u8 uart_port)
{
	BT_sendCommand(uart_port,"ATE1\r");
}

// Enter deep sleep mode
void BT_sleep(u8 uart_port)
{
	BT_sendCommand(uart_port,"AT+BTSLP\r");
}

// search for new devices for s seconds
u8 * BT_search(u8 uart_port, u8 s)
{
	// cancels any current commands
	BT_sendCommand(uart_port,"AT+BTCAN\r");
	BT_sendCommand(uart_port,"AT+BTINQ=%d\r", s);
	//CDCprintf("command is AT+BTINQ=%d\r\n", s);
	return BT_getResponse(uart_port);
}

u8 BT_init(u8 uart_port, u32 baud_rate)
{
	// 115200 bauds is the default configuration value
	SerialConfigure(uart_port, UART_ENABLE, UART_RX_TX_ENABLED,	115200);

	BT_setCommandMode(uart_port); 
	BT_getFirmware(uart_port);
	BT_echoOff(uart_port);
	//BT_restore(uart_port);
	//BT_setDeviceName(uart_port, "Pinguino");
	// Pass through, DCE, enable escape sequence, disable entering in command mode with DTR/DSR, enable LED
	//BT_sendCommand(uart_port,"AT+BTCFG=33");
	//BT_setAutoConnection(uart_port);

	if (baud_rate != 115200)
	{
		BT_setUARTSpeed(uart_port, baud_rate);
		// new UART speed
		SerialConfigure(uart_port, UART_ENABLE, UART_RX_TX_ENABLED,	baud_rate);
	}

	//BT_disableSecurity(uart_port);
	//BT_writeFlash(uart_port);
	//BT_start(uart_port);
	return BT_ok(uart_port);
}

// 0x00 Delete any stored link key
// 0x01 Pair with remote device (initiate)
// 0x02 Allow another device to pair (wait for pair)
// 0x03 Configure Bluetooth address/Link key pair

u8 BT_connect(u8 uart_port, u8 * bdaddr)
{
	BT_sendCommand(uart_port,"AT+BTPAR=1,%s\r", bdaddr); // Pair with remote device
	BT_sendCommand(uart_port,"AT+BTCLT=%s,1\r", bdaddr); // on Port 1
	// the device will enter data mode if OK
	return BT_ok(uart_port);
}

#endif /* __BLUETOOTH_C */

