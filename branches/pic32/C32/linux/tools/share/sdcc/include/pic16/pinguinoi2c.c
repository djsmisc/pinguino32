/*	----------------------------------------------------------------------------
	FILE:			pinguinoi2c.c
	PROJECT:		pinguino
	PURPOSE:		I2C functions
	PROGRAMER:		regis blanchot <rblanchot@gmail.com>
	FIRST RELEASE:	03 apr. 2010
	LAST RELEASE:	09 feb. 2011
	----------------------------------------------------------------------------
	TODO : slave modes improvement
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

#ifndef __PINGUINO_I2C_C
	#define __PINGUINO_I2C_C

	#include <pic18fregs.h>
	#include "const.h"
	#include "macro.h"
	#include "typedef.h"

	// Maybe you will have to comment this one
	#define FOSC			48

	// Mode I2C
	#define I2C_WRITE		0
	#define I2C_READ		1
	#define I2C_MASTER		0
	#define I2C_SLAVE		1
	#define I2C_SLEW_OFF	0
	#define I2C_SLEW_ON		1

	/// PROTOTYPES

	void I2C_init();
	void I2C_wait();
	void I2C_start();
	void I2C_stop();
	void I2C_restart();
	u8 I2C_writechar(u8);
	u8 I2C_readchar();
	void I2C_sendNack();
	void I2C_sendAck();
	u8 I2C_send(u8, u8);
	u8 I2C_get(u8);

/**	----------------------------------------------------------------------------
	---------- FOR TEST ONLY
	--------------------------------------------------------------------------*/

	//#define PCF8574_ADDRESS BIN(01001110)	// adress = 0 1 0 0 A2 A1 A0 0 = 0x4E
	//extern OCTET myPCF8574_data;	// les registres du PCF8574
	//OCTET myPCF8574_data;	// les registres du PCF8574

/**	----------------------------------------------------------------------------
	---------- Open the I2C bus
	----------------------------------------------------------------------------
	SSPSTAT.SMP: Slew Rate Control bit
	In Master or Slave mode:
	1 = Slew Mode Off = Standard Speed mode (100 kHz and 1 MHz)
	0 = Slew Mode On = High-Speed mode (400 kHz)
	--------------------------------------------------------------------------*/

void I2C_init(u8 mode, u8 speed)
{
	TRISBbits.TRISB0 = INPUT;
	TRISBbits.TRISB1 = INPUT;
	switch (mode)
	{
		case I2C_SLAVE_MODE:
			SSPCON1 = 0b00101111;		// Slave mode, 10-bit address with Start and Stop bit interrupts enabled
			break;
		default:
			SSPCON1 = 0b00101000;		// Master Mode, clock = FOSC/(4 * (SSPADD + 1))
	}
	SSPCON2 = 0;
	switch (mode)
	{
		case I2C_SLEW_ON:
			SSPSTAT = 0b00000000;		// Slew Mode On
			SSPADD = 119;				// 100kHz = FOSC/(4 * (SSPADD + 1))
			//SSPADD = 11;				// 1MHz = FOSC/(4 * (SSPADD + 1))
		default:
			SSPSTAT = 0b10000000;		// Slew Mode Off
			SSPADD = 29;				// 400kHz = FOSC/(4 * (SSPADD + 1))
	}
	PIR1bits.SSPIF = 0;
	PIR2bits.BCLIF = 0;
}

/**	----------------------------------------------------------------------------
	---------- Wait for the module to finish it's last action
	----------------------------------------------------------------------------
	--------------------------------------------------------------------------*/

void I2C_wait()
{
	while (PIR1bits.SSPIF == 0);
	PIR1bits.SSPIF = 0;
}

/**	----------------------------------------------------------------------------
	---------- I2C_ start bit
	----------------------------------------------------------------------------
	--------------------------------------------------------------------------*/

void I2C_start()
{
	SSPCON2bits.SEN = 1;
	I2C_wait();
}

/**	----------------------------------------------------------------------------
	---------- Send stop bit
	----------------------------------------------------------------------------
	--------------------------------------------------------------------------*/

void I2C_stop()
{
	SSPCON2bits.PEN = 1;
	I2C_wait();
}

/**	----------------------------------------------------------------------------
	---------- Send stop bit
	----------------------------------------------------------------------------
	--------------------------------------------------------------------------*/

void I2C_restart()
{
	SSPCON2bits.RSEN=1;
	I2C_wait();
}

/**	----------------------------------------------------------------------------
	---------- Send byte and return ack bit
	----------------------------------------------------------------------------
	1 = Ack
	0 = NAck
	--------------------------------------------------------------------------*/

u8 I2C_writechar(u8 byte)
{
	SSPBUF = byte;
	I2C_wait();
	return (!SSPCON2bits.ACKSTAT);
}

/**	----------------------------------------------------------------------------
	---------- Get a byte from the slave
	----------------------------------------------------------------------------
	--------------------------------------------------------------------------*/

u8 I2C_readchar()
{
	SSPCON2bits.RCEN = 1;
	I2C_wait();
	return (SSPBUF);
}

/**	----------------------------------------------------------------------------
	---------- Send a Not Acknowledge (NAck) to the slave
	----------------------------------------------------------------------------
	--------------------------------------------------------------------------*/

void I2C_sendNack()
{
	SSPCON2bits.ACKDT = 1;
	SSPCON2bits.ACKEN = 1;
	I2C_wait();
}

/**	----------------------------------------------------------------------------
	---------- Send an Acknowledge (Ack) to the slave
	----------------------------------------------------------------------------
	--------------------------------------------------------------------------*/

void I2C_sendAck()
{
	SSPCON2bits.ACKDT = 0;
	SSPCON2bits.ACKEN = 1;
	I2C_wait();
}

/**	----------------------------------------------------------------------------
	---------- Send the start and device adress
	----------------------------------------------------------------------------
	If the device is busy then it resends until accepted
	--------------------------------------------------------------------------*/


void I2C_sendID(u8 DeviceID)
{
	I2C_start();
	if (I2C_writechar(DeviceID) == 1) return;
	do {
		I2C_restart();
	} while (I2C_writechar(DeviceID) == 0);
}

/**	----------------------------------------------------------------------------
	---------- Send a byte to slave
	----------------------------------------------------------------------------
	--------------------------------------------------------------------------*/

u8 I2C_send(u8 adress, u8 byte)
{
	I2C_sendID(adress);
	//if (I2C_writechar(adress >> 8) == 0) return(0);
	//if (I2C_writechar(adress & 0xff) == 0) return(0);
	if (I2C_writechar(byte) == 0) return (0);
	I2C_stop();
	return (1);
}

/**	----------------------------------------------------------------------------
	---------- Get a byte from slave
	----------------------------------------------------------------------------
	--------------------------------------------------------------------------*/

u8 I2C_get(u8 adress)
{
	u8 byte;
	I2C_sendID(adress);
	//if (I2C_writechar(adress >> 8) == 0) return(0);
	//if (I2C_writechar(Adress & 0xff) == 0) return(0);
	I2C_restart();
	if (I2C_writechar(adress) == 0) return (0);
	byte = I2C_readchar();
	I2C_sendNack();
	I2C_stop();
	return (byte);
}

/**	----------------------------------------------------------------------------
	---------- Send the start, device address and r_w command
	----------------------------------------------------------------------------
	For 7 bits address Device:
		Divice address Format = 0 A6 A5 A4 A3 A2 A1 A0
		were: A6:A0 7 bits Device address,
	For 10 bits address Device:                
		Divice address Format = 1 1 1 1 0 0 A9 A8 A7 A6 A5 A4 A3 A2 A1 A0
		were: A9:A0 are Device address,
	r_w			read (1) or write (0) parameter
	----------------------------------------------------------------------------
	If the device is busy then it resends until accepted
	--------------------------------------------------------------------------*/

void I2C_sendID(u16 DeviceID, u8 r_w)
{         
	u8 temp;

	if (DeviceID > 0x00FF)
	{         
		temp = (DeviceID >> 7) & 0x06;	// set A9 and A8 to temp.bit2 and temp.bit1
		temp = temp | 0xF0 | r_w;		// set DeviceID address Hi format = 11110(A9A8)(R/W)
		I2C_start();
		if (I2C_writechar(temp) != 1)
		{
			do {
				I2C_restart();
			} while ( I2C_writechar(temp) != 1);
			temp = (DeviceID << 1 & 0xFE) | r_w;
			I2C_writechar(temp);
		}
	}
	else
	{         
		temp = DeviceID << 1 & 0xFE;
		temp = temp | r_w;
		I2C_start();
		if (I2C_writechar(temp) != 1)
		{
			do {
				I2C_restart();
			} while (I2C_writechar(temp) != 1);
		}
	}
}

#endif

