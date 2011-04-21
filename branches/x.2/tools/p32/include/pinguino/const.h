/*	----------------------------------------------------------------------------
	const.h
	Régis Blanchot
	--------------------------------------------------------------------------*/

#ifndef __CONST_H
	#define __CONST_H

	#ifndef PI
		#define PI				3.1415926535897932384626433832795
	#endif

	#ifndef HALF_PI
		#define HALF_PI		1.5707963267948966192313216916398
	#endif

	#ifndef TWO_PI
		#define TWO_PI			6.283185307179586476925286766559
	#endif

	#ifndef DEG_TO_RAD
		#define DEG_TO_RAD	0.017453292519943295769236907684886
	#endif

	#ifndef RAD_TO_DEG
		#define RAD_TO_DEG	57.295779513082320876798154814105
	#endif

	#ifndef NULL
		#define NULL	0
	#endif

	#ifndef ON
		#define ON		1
	#endif

	#ifndef OFF
		#define OFF		0
	#endif

	#ifndef FALSE
		#define FALSE	0 
	#endif

	#ifndef TRUE
		#define TRUE	!FALSE
	#endif

	//lower case

	#ifndef false
		#define false	0
	#endif

	#ifndef true 
		#define true	!false
	#endif

	#ifndef INPUT
		#define INPUT	1
	#endif

	#ifndef OUTPUT
		#define OUTPUT	0
	#endif

	#ifndef HIGH
		#define HIGH	1
	#endif

	#ifndef LOW
		#define LOW		0
	#endif
	
	//Booleans

	#ifndef AND
		#define AND		&&
	#endif

	#ifndef OR 
		#define OR		||
	#endif

		//lower case (not compatoble with c++)
		//#define and		&&
		//#define or		||	

#endif
