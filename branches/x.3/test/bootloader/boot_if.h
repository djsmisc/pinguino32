/*                  - Dimax Israel Confidential and Proprietary -
 *
 *  Copyright (C) June 2000, Dimax Israel.  ALL RIGHTS RESERVED.
 *
 *  Except as specifically permitted herein, no portion of the information,
 *  including but not limited to object code and source code, may be reproduced,
 *  modified, distributed, republished or otherwise exploited in any form or by
 *  any means for any purpose without the prior written permission of Dimax 
 *  Israel. Use of software subject to the terms and conditions
 *  detailed in the file "LICENSE.txt".
 *
 */

/*-------------------------------------------------------------------
 * $Id: boot_if.h,v 1.1.1.1 2006/02/16 17:37:44 mtvs12 Exp $
 * Bootloader I/F definitions
 *-------------------------------------------------------------------
*/

#ifndef BOOT_IF_H_INCLUDED
#define BOOT_IF_H_INCLUDED

/*
*-----------------------------------------------------------------------------
* Constants
*-----------------------------------------------------------------------------
*/
#define BOOT_CMD_SIZE	64
#if( defined HID_OUT_EP_SIZE && (HID_OUT_EP_SIZE<BOOT_CMD_SIZE) )
	#error "HID_OUT and CMD size missmatch: HID_OUT_EP_SIZE<BOOT_CMD_SIZE"
#endif	
#define BOOT_REP_SIZE	64
#if( defined HID_IN_EP_SIZE && (HID_IN_EP_SIZE<BOOT_CMD_SIZE) )
	#error "HID_IN and CMD size missmatch: HID_IN_EP_SIZE<BOOT_REP_SIZE"
#endif	

/*
*-----------------------------------------------------------------------------
* Types
*-----------------------------------------------------------------------------
*/
typedef struct 
{
    unsigned char cmd;
/*
* To change command you have to fix 
* hid_process_cmd function in boot_asm.asm
*/
        #define BOOT_CMD_READ_CODE 		0x01
        #define BOOT_CMD_WRITE_CODE		0x02
        #define BOOT_CMD_ERASE_CODE		0x03
        #define BOOT_CMD_GET_FW_VER		0x04
        #define BOOT_CMD_RESET     		0x05
		#define	BOOT_CMD_READ_ID		0x06
		#define	BOOT_CMD_WRITE_ID		0x07
		#define	BOOT_CMD_UNKNOWN		0xFF
		
    /* 
	* ID is used to link between command and reply 
	* Reply must contain the same id as in related command
	*/			
    unsigned char id;	
	union 
	{
        unsigned char data[BOOT_CMD_SIZE-2];
		
		/*
		* READ_CODE - read code memory
		*/
		struct
		{
			unsigned char addr_lo;      /* address must be 2 aligned */ 
			unsigned char addr_hi;	
			unsigned char reserved[1];
			unsigned char size8;		/* size must be 8 divisible */	
		}read_code;
		
		/*
		* ERASE_CODE - erase code memory
		*/
		struct
		{
			unsigned char addr_lo;      /* address must be 64 aligned */ 
			unsigned char addr_hi;	
			unsigned char reserved[1];
			unsigned char size_x64;		/* size in 64 byte blocks */	
		}erase_code;

		/*
		* WRITE_CODE - write code memory
		*/
		struct
		{
			unsigned char addr_lo;      /* address must be 2 aligned */ 
			unsigned char addr_hi;	
			unsigned char reserved[1];
			unsigned char size8;		/* size must be 8 divisible */	
			unsigned char code[BOOT_CMD_SIZE - 2 - 4];
		}write_code;

		/*
		* WRITE_ID - write ID location
		*/
		struct
		{
			unsigned char reserved[4];
			unsigned char id[8];
		}read_id;
	}u;
} boot_cmd_st;

typedef struct boot_rep_st
{
	unsigned char cmd;
	unsigned char id;
	union
	{
        unsigned char data[BOOT_REP_SIZE-2];

		/* 
		* GET_FW_VER
		*/
		struct 
		{
			unsigned char major;
			unsigned char minor;
			unsigned char sub_minor;
		}fw_ver;

		/*
		* READ_CODE - read code memory
		*/
		struct
		{
			unsigned char addr_lo;		/* address must be 2 aligned */
			unsigned char addr_hi;	
			unsigned char reserved[1];
			unsigned char size8;		/* size must be 8 divisible */	
			unsigned char code[BOOT_CMD_SIZE - 2 - 4];
		}read_code;
		
		/*
		* ERASE_CODE - erase code memory
		*/

		/*
		* WRITE_CODE - write code memory
		*/

		/*
		* READ_ID - read ID location
		*/
		struct
		{
			unsigned char reserved[4];
			unsigned char id[8];
		}read_id;
	}u;
}boot_rep_st;
	   
#endif /*_H_INCLUDED*/

