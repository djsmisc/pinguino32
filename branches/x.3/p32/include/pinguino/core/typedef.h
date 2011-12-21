/*	----------------------------------------------------------------------------
	typedef.c
	Régis Blanchot
	--------------------------------------------------------------------------*/

#ifndef __TYPEDEF_H
#define __TYPEDEF_H

/*	----------------------------------------------------------------------------
	pinguino types
	--------------------------------------------------------------------------*/

	typedef signed char				s8;
	typedef signed short			s16;
	typedef signed long				s32;
	typedef signed long long 		s64;

	typedef unsigned char			u8;
	typedef unsigned short			u16;
	typedef unsigned long			u32;
	typedef unsigned long long 		u64;
	
/*	----------------------------------------------------------------------------
	avr-gcc types
	--------------------------------------------------------------------------*/

	typedef unsigned char			byte;
	typedef unsigned char			BYTE;

	typedef unsigned char			BOOL;//bool;					// not compatible with c++
	typedef unsigned char			boolean;	

	typedef signed char 			int8_t;
	typedef short					int16_t;
	typedef long 					int32_t;
	typedef long long 				int64_t;

	typedef unsigned char 			uint8_t;
	typedef unsigned short			uint16_t;
	typedef unsigned long 			uint32_t;
	typedef unsigned long long 		uint64_t;

	/* 8 bits */
	typedef unsigned char			uchar;
	typedef signed char				schar;
	typedef unsigned char			UCHAR;
	typedef signed char				CHAR;

	/* 16 bits */
	typedef short					INT;
	typedef unsigned short			UINT;
	typedef unsigned short			uint;
	typedef signed short			sint;
	typedef unsigned short			word;
	typedef short					SHORT;
	typedef unsigned short			USHORT;
	typedef unsigned short			WORD;
	typedef unsigned short			WCHAR;

	/* 32 bits */
	typedef unsigned long			ulong;
	typedef unsigned long			ULONG;
	typedef signed long				slong;
	typedef unsigned long			dword; 
	typedef unsigned long			DWORD;
	typedef long					LONG;

#endif	/* __TYPEDEF_H */
