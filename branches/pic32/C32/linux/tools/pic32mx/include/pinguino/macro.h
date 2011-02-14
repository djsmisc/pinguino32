/*	----------------------------------------------------------------------------
	macro.h
	Régis Blanchot
	--------------------------------------------------------------------------*/

#ifndef __MACRO_H
	#define __MACRO_H

	/// BYTES

	#define high8(x)			(unsigned char) (x >> 8)
	#define low8(x)				(unsigned char) (x & 0xFF)

	/// BITWISE OPERATION

	// Lire le bit n de octet
	#define BitRead(byte, n) \
		(byte = byte >> n & 1)

	// Met le bit n à 1 dans octet
	#define BitSet(byte, n) \
		(byte |= (1 << n))

	// Met le bit n à 0 dans octet
	#define BitClear(byte, n) \
		(byte = byte & !(1 << n))

#endif
