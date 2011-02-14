/*	----------------------------------------------------------------------------
	FILE:			i2c.c
	PROJECT:		pinguino
	PURPOSE:		I2C functions
	PROGRAMER:		regis blanchot <rblanchot@gmail.com>
	FIRST RELEASE:	03 apr. 2010
	LAST RELEASE:	14 jan. 2011
	----------------------------------------------------------------------------
	TODO : 
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

	// Horloge I2C
	#define FOSC		48
	#define FI2C		100	// 100kHz (10µs)
	#define I2C_SPEED	( (FOSC * 250) / FI2C ) - 1

	// Mode I2C
	#define I2C_WRITE	0
	#define I2C_READ	1

	/// Devices

	#define PCF8574_ADDRESS BIN(01001110)	// adress = 0 1 0 0 A2 A1 A0 0 = 0x4E

	/// VARIABLES GLOBALES

	extern OCTET myPCF8574_data;	// les registres du PCF8574

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
	---------- VARIABLES GLOBALES
	--------------------------------------------------------------------------*/

OCTET myPCF8574_data;	// les registres du PCF8574

/**	----------------------------------------------------------------------------
	---------- Open the I2C bus
	----------------------------------------------------------------------------
	--------------------------------------------------------------------------*/

void I2C_init()
{
	TRISBbits.TRISB0 = INPUT;
	TRISBbits.TRISB1 = INPUT;
	SSPCON1 = BIN(00101000);	// Master Mode
	SSPCON2 = 0;
	SSPSTAT = BIN(10000000);	// Slew Mode Off
	SSPADD = I2C_SPEED;
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

#endif

