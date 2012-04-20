/*	----------------------------------------------------------------------------
	typedef.c
	Régis Blanchot
	----------------------------------------------------------------------------
 	SDCC types:
	char (8 bits, 1 byte)
	short (16 bits, 2 bytes)
	int (16 bits, 2 bytes)
	long (32 bits, 4 bytes)
	long long (64 bits, 8 bytes)
 	--------------------------------------------------------------------------*/

#ifndef __TYPEDEF_H
#define __TYPEDEF_H

/*	----------------------------------------------------------------------------
	pinguino types
	--------------------------------------------------------------------------*/

	typedef signed char			s8;
	typedef signed int			s16;
	typedef signed long			s32;
	//typedef signed long long 	s64;

	typedef unsigned char		u8;
	typedef unsigned int		u16;
	typedef unsigned long		u32;
	//typedef unsigned long long 	u64;
	
/*	----------------------------------------------------------------------------
	avr-gcc types
	--------------------------------------------------------------------------*/

	typedef unsigned char		byte;
	typedef unsigned char		BOOL;//bool;					// not compatible with c++
	typedef unsigned char		boolean;	
	typedef signed char 		int8_t;
	typedef unsigned char 		uint8_t;

	typedef unsigned int		word;	
	typedef int 				int16_t;
	typedef unsigned int 		uint16_t;

	typedef unsigned long 		dword;
	typedef long 				int32_t;
	typedef unsigned long 		uint32_t;

	//typedef long long 			int64_t;
	//typedef unsigned long long 	uint64_t;

#endif
