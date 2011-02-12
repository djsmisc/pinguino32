/*
Modbus a través  del puerto serial  - RTU Master Pingüino
 
Por  Rafael Salazar - Proyecto PinguinoVE
 
Original de Juan Pablo Zometa: Jpmzometa@gmail.com
 
Las presentes funciones 3 y 16 (read holding reguisters and preset multiple registers) 
del protocolo ModBus RTU fueron adaptadas para ser utilizadas en la plataforma Pingüino,
partiendo del código de Juan Pablo Zometa  y estan en periodo de prueba
 
Gracias Juan.
 
**************************************************************
Modbus over serial line - RTU Master Arduino Sketch 
 
 By Juan Pablo Zometa : jpmzometa@gmail.com
 http://sites.google.com/site/jpmzometa/
 
 These functions implement functions 3 and 16 (read holding registers
 and preset multiple registers) of the Modbus RTU Protocol, to be used
 over the Arduino serial connection.
 
 This implementation DOES NOT fully comply with the Modbus specifications.
 
 This Arduino adaptation is derived from the work
 By P.Costigan email: phil@pcscada.com.au http://pcscada.com.au
 
 These library of functions are designed to enable a program send and
 receive data from a device that communicates using the Modbus protocol.
 
 Copyright (C) 2000 Philip Costigan  P.C. SCADA LINK PTY. LTD.
 
 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; either version 2 of the License, or
 (at your option) any later version.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program; if not, write to the Free Software
 Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 
 The functions included here have been derived from the 
 Modicon Modbus Protocol Reference Guide
 which can be obtained from Schneider at www.schneiderautomation.com.
 
 This code has its origins with 
 paul@pmcrae.freeserve.co.uk (http://www.pmcrae.freeserve.co.uk)
 who wrote a small program to read 100 registers from a modbus slave.
 
 I have used his code as a catalist to produce this more functional set
 of functions. Thanks paul.
*/
 
 
 
/****************************************************************************
 * BEGIN MODBUS RTU MASTER FUNCTIONS
 ****************************************************************************/
#include "stdint.h"
#include <stdlib.h>
#define PIC18F4550
#define TIMEOUT 1000             // 1 second 
#define BAUDRATE 9600            // Defina la rata de baudios
#define MAX_READ_REGS 20         // se limita a 20 registros por transaccion
#define MAX_WRITE_REGS 20        // se limita a 20 registros por transaccion
#define MAX_RESPONSE_LENGTH 46  
#define PRESET_QUERY_SIZE 46    
/* errors */
#define PORT_ERROR -5




/*
 * udf_crc
 *
 * PURPOSE
 *	Calculate a 16-bit CRC checksum 
 *
 * DESCRIPTION
 *	The OSTA-UDF(tm) 1.50 standard states that using CRCs is mandatory.
 *	The polynomial used is:	x^16 + x^12 + x^5 + 1
 *
 * PRE-CONDITIONS
 *	p		Pointer to the data block.
 *	size		Size of the data block.
 *
 * POST-CONDITIONS
 *	<return>	CRC of the data block.
 *
*/
 
uint16_t crc16(uint8_t *p, uint32_t size, uint16_t crc_temp)
{
    uint8_t  i;
 
    while (size--)
    {
        crc_temp ^= *p++;
 
        for (i = 8; i != 0; i--)
        {
            if (crc_temp & 1)
                crc_temp = (crc_temp >> 1) ^ 0xA001U;
            else
                crc_temp >>= 1;
        }
    }
 
    crc_temp = ((crc_temp << 8) | (crc_temp >> 8));       // Byte swaping
    return crc_temp;
}
 
/***********************************************************************
 * 
 * 	The following functions construct the required query into
 * 	a modbus query packet.
 *     count =  the number of registers request
 * 
 ***********************************************************************/
 
#define REQUEST_QUERY_SIZE 6  /* the following packets require          */
#define CHECKSUM_SIZE 2       /* 6 unsigned chars for the packet plus   */
                              /* 2 for the checksum.                    */
 
void build_request_packet(uint8_t slave, uint8_t function, uint16_t start_addr,
uint8_t count, uint8_t *packet)
{
        packet[0] = slave;
        packet[1] = function;
        start_addr -= 1;
        packet[2] = start_addr >> 8;
        packet[3] = start_addr & 0x00ff;
        packet[4] = count >> 8;
        packet[5] = count & 0x00ff;
}
 
 
/*************************************************************************
 * 
 * modbus_query( packet, length)
 * 
 * Function to add a checksum to the end of a packet.
 * Please note that the packet array must be at least 2 fields longer than
 * string_length.									
 **************************************************************************/
 
void modbus_query(uint8_t *packet, uint8_t string_length)
{
        uint16_t temp_crc;
        string_length = string_length - 2;		 
 
        temp_crc = crc16(packet,string_length, 0xffffU);
 
        packet[string_length++] = (unsigned)temp_crc >> 8;				
        packet[string_length++] = temp_crc & 0x00FFU;			
}
 
 
 
/***********************************************************************
 * 
 * send_query(query_string, query_length )
 * 
 * Function to send a query out to a modbus slave.
 ************************************************************************/
 
int send_query(uint8_t *query, uint8_t string_length)
{
 
        uint8_t i ;
 
        modbus_query(query, string_length);
 
        for (i = 0; i < string_length; i++) {
 
                Serial.print(query[i],BYTE);    
                delayMicroseconds((11*1000000*1.5)/BAUDRATE);  // Introduce el tiempo entre bytes
        }
 
        delayMicroseconds((11*1000000*3.5)/BAUDRATE);          // Introduce el tiempo entre querys
 
        return i; 		/* it does not mean that the write was succesful, though */
}
 
 
/***********************************************************************
 * 
 * 	receive_response( array_for_data )
 * 
 * Function to monitor for the reply from the modbus slave.
 * This function blocks for timeout seconds if there is no reply.
 * 
 * Returns:	Total number of characters received.
 ***********************************************************************/
 
int receive_response(unsigned char *received_string)
{
 
        int bytes_received = 0;
        int i = 0;
        /* wait for a response; this will block! */
 
        while(Serial.available() == 0) {
                delay(1); 		  
                if (i++ > TIMEOUT)
                        {
                        CDC.print("Time out",8);	//// Solo para efectos de debugging (eliminar luego)
                        return bytes_received;
                        }
        }
 
        while(Serial.available()) {
 
                received_string[bytes_received] = Serial.read();
                delayMicroseconds((11*1000000*1.5)/BAUDRATE);
                bytes_received++;
                if (bytes_received >= MAX_RESPONSE_LENGTH)
                return PORT_ERROR;
        } 
 
        delayMicroseconds((11*1000000*3.5)/BAUDRATE);
        return (bytes_received);
}
 
 
/*********************************************************************
 * 
 * 	modbus_response( response_data_array, query_array )
 * 
 * Function to the correct response is returned and that the checksum
 * is correct.
 * 
 * Returns:	string_length if OK
 * 		0 if failed
 * 		Less than 0 for exception errors
 * 
 * 	Note: All functions used for sending or receiving data via
 * 	      modbus return these return values.
 * 
 **********************************************************************/
 
int modbus_response(unsigned char *datos, unsigned char *query)
{
        int response_length;
 
        unsigned int crc_calc = 0;
        uint16_t crc_received = 0;
        unsigned char recv_crc_hi;
        unsigned char recv_crc_lo;
 
      do {        
           response_length = receive_response(datos);		// repeat if unexpected slave replied
         } while ((response_length > 0) && (datos[0] != query[0]));
 
        if (response_length) {
 
                crc_calc = crc16(datos, response_length - 2,0xffffU);
 
                recv_crc_hi = (unsigned) datos[response_length - 2];
                recv_crc_lo = (unsigned) datos[response_length - 1];
 
                crc_received = datos[response_length - 2];	
                crc_received = (unsigned) crc_received << 8;
                crc_received = crc_received | (unsigned) datos[response_length - 1];	
 
 
                /*********** check CRC of response ************/
 
                if (crc_calc != crc_received) {
                        response_length = crc_calc;
                }
 
                /********** check for exception response *****/
 
                if (response_length && datos[1] != query[1]) {
                        response_length = 0 - datos[2];
                }
        }
        return (response_length);
}
 
 
/************************************************************************
 * 
 * 	read_reg_response
 * 
 * 	reads the response data from a slave and puts the data into an
 * 	array.
 * 
 ************************************************************************/
 
int read_reg_response(uint16_t *dest, uint8_t *query)
{
 
        unsigned char datos[MAX_RESPONSE_LENGTH];			
        int raw_response_length;
        uint16_t temp;
        uint8_t i;
 
        raw_response_length = modbus_response(datos, query);
 
        if (raw_response_length -= 2 > 0) {
 
                for (i = 0; i < ( datos[2]/2 )  ; i++) 
                  {
                   temp = datos[3 + i * 2] << 8;				/* shift reg hi_byte to temp */
                   temp = temp | datos[4 + i * 2]; 			/* OR with lo_byte           */
                   dest[i] = temp;
                   }
        }
        return (raw_response_length);
}
 
 
/***********************************************************************
 * 
 * 	preset_response
 * 
 * 	Gets the raw data from the input stream.
 * 
 ***********************************************************************/
 
int preset_response(uint8_t *query)
{
        unsigned char datos[MAX_RESPONSE_LENGTH];    
        int raw_response_length;
 
        raw_response_length = modbus_response(datos, query);
 
        return (raw_response_length);
}
 
/************************************************************************
 * 
 * 	read_holding_registers
 * 
 * 	Read the holding registers in a slave and put the data into
 * 	an array.
 * 
 *************************************************************************/
 
int read_holding_registers(int slave, int start_addr, uint8_t count,
int *dest)
{
        int function = 0x03; 	/* Function: Read Holding Registers */
        int ret;
 
        unsigned char packet[REQUEST_QUERY_SIZE + CHECKSUM_SIZE];
 
        if (count > MAX_READ_REGS) {
                count = MAX_READ_REGS;
        }
 
        build_request_packet(slave, function, start_addr, count, packet);
 
        if (send_query(packet, REQUEST_QUERY_SIZE + CHECKSUM_SIZE) > -1) {
                ret = read_reg_response(dest, packet);
        } 
        else {
 
                ret = -1;
        }
 
        return (ret);
}
 
 
/************************************************************************
 * 
 * 	preset_multiple_registers
 * 
 * 	Write the data from an array into the holding registers of a
 * 	slave.
 * 
 *************************************************************************/
 
int preset_multiple_registers(uint8_t slave, int start_addr, uint8_t reg_count, int *datos)
{
        uint8_t function = 0x10; 	/* Function 16: Write Multiple Registers */
        uint8_t byte_count, i, packet_size = 6;
        uint8_t ret;
 
        unsigned char packet[PRESET_QUERY_SIZE + CHECKSUM_SIZE];
 
        if (reg_count > MAX_WRITE_REGS) {
                reg_count = MAX_WRITE_REGS;
        }
 
        build_request_packet(slave, function, start_addr, reg_count, packet);
        byte_count = reg_count * 2;
        packet[6] = byte_count;
 
        for (i = 0; i < reg_count; i++) {
                packet_size++;
                packet[packet_size] = datos[i] >> 8;
                packet_size++;
                packet[packet_size] = datos[i] & 0x00FF;
        }
 
        packet_size+=3;		
        if (send_query(packet, packet_size) > -1) {
                ret = preset_response(packet);
        } 
        else {
                ret = -1;
        }
 
        return (ret);
}
 
 
 
 
/////////////////////////////////////////////////////////////////////////
// Programa de prueba
// Este Progama:
//    1) Lee (via pin8/pin9 (Tx/Rx), 9 holding_registers a partir de
//       la direccion 0001  (400001) del esclavo.
//    2) Envia por puerto USB (modo CDC, COM virtual), los registros 
//       leidos.
//    3) Escribe (copia) lo leido, a partir del registro 0011 (400011)
//       del esclavo
/////////////////////////////////////////////////////////////////////////

void setup()
{

Serial.begin(BAUDRATE);
Serial.flush();
}
 
 
void loop()
{ 
	uint8_t count = 9;         //// cantidad de registros a leer 
	uint8_t slave_id, i;
	uint16_t start_addr;										
	uint16_t dest[0x09U];    
	uint8_t rxstr[10];
	slave_id = 0x01U;
	start_addr = 1;            //// direccion 0001  (400001)
 
	delay(10000);              //// espera de 10 seg para dar tiempo de abrir el hyperterminal
 
	CDC.print("400001\t400002\t400003\t400004\t400005\t400006\t400007\t400008\t400009\n\r",64);	
 
	while (1){
 
		while ((i=read_holding_registers(slave_id, start_addr, count, dest))<= 0 ) {
				itoa(i,rxstr,10);
				CDC.print(rxstr,strlen(rxstr));
				}
 
		for(i=0; i<9; i++)
			{
				itoa(dest[i],rxstr,10);
				CDC.print(rxstr,strlen(rxstr));
				CDC.print("\t",1);
			}
			CDC.print("\r",1);
			start_addr = 11; 
			preset_multiple_registers(slave_id, start_addr, count, dest);
			start_addr = 1;
 
		delay(2500);
 
			for(i=0; i<19; i++)
				{
			CDC.print("    ",4);
				}
			CDC.print("\r",1);
 
		} 
}

