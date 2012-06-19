/*	----------------------------------------------------------------------------
	FILE:			pinguinoi2c.c
	PROJECT:		pinguino
	PURPOSE:		Include all functions to handle I2C communication for Master and Slave
	PROGRAMER:		Régis Blanchot, Jean-Pierre Mandon, Jesús Carmona Esteban & Rafael Salazar
	VERSION:		1.1
	FIRST RELEASE:	03 apr. 2010
	LAST RELEASE:	18 jun. 2012
	----------------------------------------------------------------------------
	TODO : Arduino Compatibility ???

	begin() initializes pinguino as an I2C master
	begin(address) initializes pinguino as a slave at address address. 
	=> I2C.master I2C_master#include <pinguinoi2c.c>
	=> I2C.slave I2C_slave#include <pinguinoi2c.c>

		void beginTransmission(uint8_t);
		void beginTransmission(int);

		uint8_t endTransmission(void);

		uint8_t requestFrom(uint8_t, uint8_t);
		uint8_t requestFrom(int, int);

		void send(uint8_t);
		void send(uint8_t*, uint8_t);
		void send(int);
		void send(char*);

		uint8_t available(void);
		uint8_t receive(void);
		void onReceive( void (*)(int) );
		void onRequest( void (*)(void) );
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

#define __I2C__

#include <pic18fregs.h>
#include <typedef.h>
#include <macro.h>
#include <const.h>
#include <interrupt.c>
//#include <stdio.c>
//#include <stdarg.h>

// Modules
#define I2C1            1
#define I2C2            2

// Mode I2C
#define I2C_WRITE		0
#define I2C_READ		1
#define I2C_MASTER_MODE	0
#define I2C_SLAVE_MODE	1
#define I2C_SLEW_OFF	0
#define I2C_SLEW_ON		1
#define I2C_100KHZ		0
#define I2C_400KHZ		1
#define I2C_1MHZ		2

//typedef void (*i2c_stdout) (void);	// type of :	void foo(int x)
//i2c_stdout _i2c_onRequest_function;	// then : 		void pputchar(void)
//i2c_stdout _i2c_onReceive_function;	// then : 		void pputchar(void)

/// PROTOTYPES

// high-level functions
void I2C_master(u8, u16);   
void I2C_slave(u8, u16);   
void I2C_init(u8, u8, u16);
//void I2C_printf(u8, u8, u8 *, ...);
u8 I2C_write(u8, u8, u8 *, u8);
u8 I2C_read(u8, u8, u8 *, u8);
u8 I2C_send(u8, u8, u8);
u8 I2C_get(u8, u8);
void I2C_sendID(u8, u16, u8);

// low-level function
u8 I2C_writechar(u8, u8);
u8 I2C_readchar(u8);
u8 I2C_waitAck(u8);
void I2C_wait(u8);
void I2C_start(u8);
void I2C_stop(u8);
void I2C_restart(u8);
void I2C_sendNack(u8);
void I2C_sendAck(u8);
//void I2C_interrupt();
//void I2C_OnRequest(void (*)(void));       // TODO : move to interrupt.c ?
//void IC2_OnReceive(void (*)(void));

/*	----------------------------------------------------------------------------
	---------- Initialitation Functions for Master and Slave
	--------------------------------------------------------------------------*/

void I2C_master(u8 module, u16 speed)   
{
	I2C_init(module, I2C_MASTER_MODE, speed);
}

void I2C_slave(u8 module, u16 DeviceID)   
{
	I2C_init(module, I2C_SLAVE_MODE, DeviceID);
}

/*	----------------------------------------------------------------------------
	---------- Open the I2C bus
	----------------------------------------------------------------------------
	SSPSTAT.SMP: Slew Rate Control bit
	In Master or Slave mode:
	1 = Slew Mode Off = Standard Speed mode (100 kHz and 1 MHz)
	0 = Slew Mode On = High-Speed mode (400 kHz)
	RB0 = SDA
	RB1 = SCL
	--------------------------------------------------------------------------*/

void I2C_init(u8 module, u8 mode, u16 sora)
{
    #if !defined(PIC18F26J50)
    module = I2C1;
    #endif
    
   	switch(module)
	{
		case I2C1:

            // In Slave mode, the SCL and SDA pins must be configured as inputs
            #if defined(PIC18F26J50)
            TRISBbits.TRISB5 = INPUT;			// SDA1 = INPUT
            TRISBbits.TRISB4 = INPUT;			// SCL1 = INPUT
            #else
            TRISBbits.TRISB0 = INPUT;			// SDA = INPUT
            TRISBbits.TRISB1 = INPUT;			// SCL = INPUT
            #endif
            
            switch (mode)
            {
                case I2C_SLAVE_MODE:
                    intUsed[INT_SSP] = INT_USED;
                    // Enabling interrupts (peripheral & general)
                    INTCONbits.PEIE=1;
                    INTCONbits.GIE=1;
                    SSPCON1 = 0b00101110;		// Slave mode,  7-bit address with Start and Stop bit interrupts enabled
                    //SSPCON1 = 0b00101111;		// Slave mode, 10-bit address with Start and Stop bit interrupts enabled
/*	---------------------------------------------------------------------------*/
                    SSPADD = sora;				// Slave 7-bit address
                    // TODO						// Slave 10-bit address
/*	---------------------------------------------------------------------------*/
                    break;

                case I2C_MASTER_MODE:
                default:// I2C_MASTER_MODE
                    SSPCON1 = 0b00101000;		// Master Mode, clock = FOSC/(4 * (SSPADD + 1))
                    // datasheet p208
                    switch (sora)
                    {
                        case I2C_1MHZ:
                            // SMP = 1 = Slew rate control disabled for Standard Speed mode (100 kHz and 1 MHz)
                            SSPSTAT = 0b10000000;		// Slew Mode Off
                            SSPADD = 11;				// 1MHz = FOSC/(4 * (SSPADD + 1))

                        case I2C_400KHZ:
                            // SMP = 0 = Slew rate control enabled for High-Speed mode (400 kHz)
                            SSPSTAT = 0b00000000;		// Slew Mode On
                            SSPADD = 29;				// 400kHz = FOSC/(4 * (SSPADD + 1))

                        case I2C_100KHZ:
                        default:
                            // SMP = 1 = Slew rate control disabled for Standard Speed mode (100 kHz and 1 MHz)
                            SSPSTAT = 0b10000000;		// Slew Mode Off
                            SSPADD = 119;				// 100kHz = FOSC/(4 * (SSPADD + 1))
                    }
            }
            SSPCON2 = 0;
            PIR1bits.SSPIF = 0;
            PIR2bits.BCLIF = 0;
            break;

        #if defined(PIC18F26J50)
		case I2C2:

            // In Slave mode, the SCL and SDA pins must be configured as inputs
            TRISDbits.TRISD1 = INPUT;			// SDA2 = INPUT
            TRISDbits.TRISD0 = INPUT;			// SCL2 = INPUT
            
            switch (mode)
            {
                case I2C_SLAVE_MODE:
                    intUsed[INT_SSP] = INT_USED;
                    // Enabling interrupts (peripheral & general)
                    INTCONbits.PEIE=1;
                    INTCONbits.GIE=1;
                    SSPCON2 = 0b00101110;		// Slave mode,  7-bit address with Start and Stop bit interrupts enabled
                    //SSPCON1 = 0b00101111;		// Slave mode, 10-bit address with Start and Stop bit interrupts enabled
        /*	---------------------------------------------------------------------------*/
                    SSPADD = sora;				// Slave 7-bit address
                    // TODO						// Slave 10-bit address
        /*	---------------------------------------------------------------------------*/
                    break;

                case I2C_MASTER_MODE:
                default:// I2C_MASTER_MODE
                    SSPCON2 = 0b00101000;		// Master Mode, clock = FOSC/(4 * (SSPADD + 1))
                    // datasheet p208
                    switch (sora)
                    {
                        case I2C_1MHZ:
                            // SMP = 1 = Slew rate control disabled for Standard Speed mode (100 kHz and 1 MHz)
                            SSP2STAT = 0b10000000;		// Slew Mode Off
                            SSP2ADD = 11;				// 1MHz = FOSC/(4 * (SSPADD + 1))

                        case I2C_400KHZ:
                            // SMP = 0 = Slew rate control enabled for High-Speed mode (400 kHz)
                            SSP2STAT = 0b00000000;		// Slew Mode On
                            SSP2ADD = 29;				// 400kHz = FOSC/(4 * (SSPADD + 1))

                        case I2C_100KHZ:
                        default:
                            // SMP = 1 = Slew rate control disabled for Standard Speed mode (100 kHz and 1 MHz)
                            SSP2STAT = 0b10000000;		// Slew Mode Off
                            SSP2ADD = 119;				// 100kHz = FOSC/(4 * (SSPADD + 1))
                    }
            }
            SSP2CON2 = 0;
            PIR3bits.SSP2IF = 0;
            PIR3bits.BCL2IF = 0;
            break;
        #endif
    }
}

/*	----------------------------------------------------------------------------
	---------- Send a formated string to the slave
	----------------------------------------------------------------------------
	--------------------------------------------------------------------------*/
/*
void I2C_printf(u8 address, u8 *fmt, ...)
{
	va_list args;

	va_start(args, fmt);
	I2C_sendID(address, I2C_WRITE);
	pprintf(I2C_writechar, fmt, args);
	I2C_stop();
	va_end(args);
}
*/
/*	----------------------------------------------------------------------------
	---------- Send x bytes to the slave
	----------------------------------------------------------------------------
	--------------------------------------------------------------------------*/

u8 I2C_write(u8 module, u8 address, u8 *buffer, u8 length)
{
    u8 i;
    
	I2C_start(module);
	I2C_sendID(module, address, I2C_WRITE);
    for (i=0; i<length; i++)
    {
        if (I2C_writechar(module, buffer[i]) == 0)
            return (0);
    }
	I2C_stop(module);
	return (1);
}

/*	----------------------------------------------------------------------------
	---------- Get x bytes from the slave
	----------------------------------------------------------------------------
	--------------------------------------------------------------------------*/

u8 I2C_read(u8 module, u8 address, u8 *buffer, u8 length)
{
    u8 i;
    
	I2C_start(module);
	I2C_sendID(module, address, I2C_WRITE);
    for (i=0; i<length; i++)
    {
        buffer[i] = I2C_get(module, address);
    }
	I2C_stop(module);
	return (1);
}

/*	----------------------------------------------------------------------------
	---------- Send 1 byte to slave
	----------------------------------------------------------------------------
	--------------------------------------------------------------------------*/

u8 I2C_send(u8 module, u8 address, u8 byte)
{
	I2C_start(module);
	I2C_sendID(module, address, I2C_WRITE);
	if (I2C_writechar(module, byte) == 0)
		return (0);
	I2C_stop(module);
	return (1);
}

/*	----------------------------------------------------------------------------
	---------- Get 1 byte from slave
	----------------------------------------------------------------------------
	--------------------------------------------------------------------------*/

u8 I2C_get(u8 module, u8 address)
{
	u8 byte;

	I2C_start(module);
	I2C_sendID(module, address, I2C_READ);
	byte = I2C_readchar(module);
	I2C_sendNack(module);
	I2C_stop(module);
	return (byte);
}

/*	----------------------------------------------------------------------------
	---------- Send the start, device address and r_w command
	----------------------------------------------------------------------------
	In Master Transmitter mode, the first byte transmitted contains the slave
	address of the receiving device (seven bits) and the Read/Write (R/W)
	bit.
	----------------------------------------------------------------------------
	author : Rafael Salazar
	For 7 bits address Device:
		Device address Format = 0 A6 A5 A4 A3 A2 A1 A0
		were: A6:A0 7 bits Device address,
	For 10 bits address Device:                
		Device address Format = 1 1 1 1 0 0 A9 A8 A7 A6 A5 A4 A3 A2 A1 A0
		were: A9:A0 are Device address,
	rw
		I2C_READ (1) or I2C_WRITE (0) parameter
	If the device is busy then it resends until accepted
	--------------------------------------------------------------------------*/

void I2C_sendID(u8 module, u16 DeviceID, u8 rw)
{         
	u8 temp;

	// 10-bit address
	if (DeviceID > 0x00FF)
	{         
		temp = (DeviceID >> 7) & 0x06;	// set A9 and A8 to temp.bit2 and temp.bit1
		temp = temp | 0xF0 | rw;		// set DeviceID address Hi format = 11110(A9A8)(R/W)
		if (I2C_writechar(module, temp) != 1)
		{
			do {
				I2C_restart(module);
			} while ( I2C_writechar(module, temp) != 1);
			temp = (DeviceID << 1 & 0xFE) | rw;
			I2C_writechar(module, temp);
		}
	}
    
	// 7-bit address
	else
	{         
		temp = DeviceID;
		temp = temp | rw;               // bit 0 commands read or write mode
		if (I2C_writechar(module, temp) != 1)
		{
			do {
				I2C_restart(module);
			} while (I2C_writechar(module, temp) != 1);
		}
	}
}

/*	----------------------------------------------------------------------------
	---------- Send byte and return ack bit
	----------------------------------------------------------------------------
	Serial data is transmitted eight bits at a time. After each byte is
	transmitted, an Acknowledge bit is received. Start and Stop conditions are
	output to indicate the beginning	and the end of a serial transfer.
	1 = Ack
	0 = NAck
	--------------------------------------------------------------------------*/

u8 I2C_writechar(u8 module, u8 b)
{
    #if !defined(PIC18F26J50)
    module = I2C1;
    #endif

   	if (module == I2C1)
    {
        SSPBUF = b;
        I2C_wait(module);
        return (!SSPCON2bits.ACKSTAT);
    }
    #if defined(PIC18F26J50)
    else
    {
        SSPBUF = b;
        I2C_wait(module);
        return (!SSP2CON2bits.ACKSTAT);
    }
    #endif
}

/*	----------------------------------------------------------------------------
	---------- Get a byte from the slave
	----------------------------------------------------------------------------
	--------------------------------------------------------------------------*/

u8 I2C_readchar(u8 module)
{
    #if !defined(PIC18F26J50)
    module = I2C1;
    #endif

   	if (module == I2C1)
    {
        SSPCON2bits.RCEN = 1;
        I2C_wait(module);
        return (SSPBUF);
    }
    #if defined(PIC18F26J50)
    else
    {
        SSP2CON2bits.RCEN = 1;
        I2C_wait(module);
        return (SSP2BUF);
    }
    #endif
}

/*	----------------------------------------------------------------------------
	---------- Wait for the module to finish it's last action
	----------------------------------------------------------------------------
	--------------------------------------------------------------------------*/

void I2C_wait(u8 module)
{
    #if !defined(PIC18F26J50)
    module = I2C1;
    #endif

   	switch(module)
	{
		case I2C1:
            while (PIR1bits.SSPIF == 0);
            PIR1bits.SSPIF = 0;
            break;
        
        #if defined(PIC18F26J50)
		case I2C2:
            while (PIR3bits.SSP2IF == 0);
            PIR3bits.SSP2IF = 0;
            break;
        #endif
    }

}

/*	----------------------------------------------------------------------------
	---------- I2C_ start bit
	----------------------------------------------------------------------------
	--------------------------------------------------------------------------*/

void I2C_start(u8 module)
{
    #if !defined(PIC18F26J50)
    module = I2C1;
    #endif

   	switch(module)
	{
		case I2C1:
            SSPCON2bits.SEN = 1;
            break;
        
        #if defined(PIC18F26J50)
		case I2C2:
            SSP2CON2bits.SEN = 1;
            break;
        #endif
    }

	I2C_wait(module);
}

/*	----------------------------------------------------------------------------
	---------- Send stop bit
	----------------------------------------------------------------------------
	--------------------------------------------------------------------------*/

void I2C_stop(u8 module)
{
    #if !defined(PIC18F26J50)
    module = I2C1;
    #endif

   	switch(module)
	{
		case I2C1:
            SSPCON2bits.PEN = 1;
            break;
        
        #if defined(PIC18F26J50)
        case I2C2:
            SSP2CON2bits.PEN = 1;
            break;
        #endif
    }

	I2C_wait(module);
}

/*	----------------------------------------------------------------------------
	---------- Send stop bit
	----------------------------------------------------------------------------
	--------------------------------------------------------------------------*/

void I2C_restart(u8 module)
{
    #if !defined(PIC18F26J50)
    module = I2C1;
    #endif

   	switch(module)
	{
		case I2C1:
            SSPCON2bits.RSEN=1;
            break;
        
        #if defined(PIC18F26J50)
		case I2C2:
            SSP2CON2bits.RSEN=1;
            break;
        #endif
    }

	I2C_wait(module);
}

/*	----------------------------------------------------------------------------
	---------- Wait for Acknowledge (Ack) from the slave
	----------------------------------------------------------------------------
	--------------------------------------------------------------------------*/

u8 I2C_waitAck(u8 module)
{
	u8 i=0;

    #if !defined(PIC18F26J50)
    module = I2C1;
    #endif

   	switch(module)
	{
		case I2C1:
            while(SSPCON2bits.ACKSTAT == 1) 
            {
                i++;
                if(i==0) return -1;
            }
            break;
        
        #if defined(PIC18F26J50)
		case I2C2:
            while(SSP2CON2bits.ACKSTAT == 1) 
            {
                i++;
                if(i==0) return -1;
            }
            break;
        #endif
    }

	return 0;
}

/*	----------------------------------------------------------------------------
	---------- Abort reading
	----------------------------------------------------------------------------
	--------------------------------------------------------------------------*/

void I2C_readAbort(u8 module)
{
    #if !defined(PIC18F26J50)
    module = I2C1;
    #endif

   	switch(module)
	{
		case I2C1:
            SSPCON1bits.WCOL = 0;
            break;
        
        #if defined(PIC18F26J50)
		case I2C2:
            SSP2CON1bits.WCOL = 0;
            break;
        #endif
    }

	I2C_stop(module);
	I2C_wait(module);  
}

/*	----------------------------------------------------------------------------
	---------- Send a Not Acknowledge (NAck) to the slave
	----------------------------------------------------------------------------
	--------------------------------------------------------------------------*/

void I2C_sendNack(u8 module)
{
    #if !defined(PIC18F26J50)
    module = I2C1;
    #endif

   	switch(module)
	{
		case I2C1:
            SSPCON2bits.ACKDT = 1;
            SSPCON2bits.ACKEN = 1;
            break;
        
        #if defined(PIC18F26J50)
		case I2C2:
            SSP2CON2bits.ACKDT = 1;
            SSP2CON2bits.ACKEN = 1;
            break;
        #endif
    }

	I2C_wait(module);
}

/*	----------------------------------------------------------------------------
	---------- Send an Acknowledge (Ack) to the slave
	----------------------------------------------------------------------------
	--------------------------------------------------------------------------*/

void I2C_sendAck(u8 module)
{
    #if !defined(PIC18F26J50)
    module = I2C1;
    #endif

   	switch(module)
	{
		case I2C1:
            SSPCON2bits.ACKDT = 0;
            SSPCON2bits.ACKEN = 1;
            break;
        
        #if defined(PIC18F26J50)
		case I2C2:
            SSP2CON2bits.ACKDT = 0;
            SSP2CON2bits.ACKEN = 1;
            break;
        #endif
    }

	I2C_wait(module);
}

#endif


//
//  TODO: move the following to interrupt.c ?
//



/*	----------------------------------------------------------------------------
	---------- OnRequest
	----------------------------------------------------------------------------
	--------------------------------------------------------------------------*/
/*
void I2C_OnRequest(i2c_stdout func)
{
	_i2c_onRequest_function = func;
}
*/
/*	----------------------------------------------------------------------------
	---------- OnReceive
	----------------------------------------------------------------------------
	--------------------------------------------------------------------------*/
/*
void I2C_OnReceive(i2c_stdout func)
{
	_i2c_onReceive_function = func;
}
*/
/*	----------------------------------------------------------------------------
	---------- Interrupt handler for I2C slave
	----------------------------------------------------------------------------
	--------------------------------------------------------------------------*/
/*
void I2C_interrupt()
{
	if (PIR1bits.SSPIF)
	{
		PIR1bits.SSPIF = 0;
		if (SSPSTATbits.R_W)
			_i2c_onRequest_function();
		else
			_i2c_onReceive_function();
	}
}
*/
