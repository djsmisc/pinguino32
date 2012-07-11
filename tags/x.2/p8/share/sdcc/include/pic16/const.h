/*	----------------------------------------------------------------------------
	---------- const.h
	---------- rblanchot@gmail.com
	--------------------------------------------------------------------------**/

#ifndef __CONST_H
#define __CONST_H

	// already defined in math.h
	//#define PI				3.1415926535897932384626433832795
	//#define HALF_PI		1.5707963267948966192313216916398
	//#define TWO_PI			6.283185307179586476925286766559
	#define DEG_TO_RAD	0.017453292519943295769236907684886
	#define RAD_TO_DEG	57.295779513082320876798154814105

	// already defined in common_types.h
	//#define FALSE			0 
	//#define TRUE			!FALSE
	#define false			0 
	#define true			!false

	#define INPUT			1
	#define OUTPUT			0

	#define HIGH			1
	#define LOW				0

	#define ON				1
	#define OFF				0

	#define BYTE			0
	#define BIN				2
	#define OCT				8 
	#define DEC				10
	#define HEX				16

	/// pins

	#define B0 0
	#define RB0 0
	#define AN12 0
	#define INT0 0
	#define FLT0 0
	#define SDI 0
	#define SDA 0

	#define B1 1
	#define RB1 1
	#define AN10 1
	#define INT1 1
	#define SCK 1
	#define SCL 1

	#define B2 2
	#define RB2 2
	#define AN8 2
	#define INT2 2
	#define VMO 2

	#define B3 3
	#define RB3 3
	#define AN9 3
	#define VPO 3

	#define B4 4
	#define RB4 4
	#define AN11 4
	#define KBI0 4

	#define B5 5
	#define RB5 5
	#define KBI1 5
	#define PGM 5

	#define B6 6
	#define RB6 6
	#define KBI2 6
	#define PGC 6

	#define B7 7
	#define RB7 7
	#define KBI3 7
	#define PGD 7

	#define C6 8
	#define RC6 8
	#define TX 8
	#define CK 8

	#define C7 9
	#define RC7 9
	#define RX 9
	#define DT 9
	#define SDO 9

	#define C0 10
	#define RC0 10
	#define T1OSO 10
	#define T13CK 10

	#define C1 11
	#define RC1 11
	#define T1OSI 11
	#define CCP2 11
	#define UOE 11

	#define C2 12
	#define RC2 12
	#define CCP1 12

	#define A0 13
	#define RA0 13
	#define AN0 13

	#define A1 14
	#define RA1 14
	#define AN1 14

	#define A2 15
	#define RA2 15
	#define AN2 15

	#define A3 16
	#define RA3 16
	#define AN3 16

	// run led pin
	#define A4 18
	#define RA4 18
	#define RUNLED		PORTAbits.RA4
	#define LED1		PORTAbits.RA4
	#define USERLED	PORTAbits.RA4

	#define A5 17
	#define RA5 17
	#define AN4 17
	#define SS 17
	#define HLVDIN 17
	#define C2OU 17

#endif

