/*	-----------------------------------------------------------------------------
	math.h: doubleing point math function declarations

	Ported to PIC16 port by Vangelis Rokas, 2004 (vrokas@otenet.gr)

	Copyright (C) 2001  Jesus Calvino-Fraga, jesusc@ieee.org 

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
	Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
	---------------------------------------------------------------------------*/

/*
** $Id: math.h 3648 2005-01-22 18:02:16Z vrokas $
*/


#ifndef __MATH_H
#define __MATH_H

#define _REENTRANT

#define _IL_REENTRANT
#define _FS_REENTRANT
#define _MATH_REENTRANT

#define _CODE	__code
#define _DATA	__data
#define _AUTOMEM
#define _STATMEM

//#define PI          3.1415926536
//#define TWO_PI      6.2831853071
//#define HALF_PI     1.5707963268
#define QUART_PI    0.7853981634
#define iPI         0.3183098862
#define iTWO_PI     0.1591549431
#define TWO_O_PI    0.6366197724

// EPS=B**(-t/2), where B is the radix of the doubleing-point representation
// and there are t base-B digits in the significand.  Therefore, for doubles
// EPS=2**(-12).  Also define EPS2=EPS*EPS.
#define EPS 244.14062E-6
#define EPS2 59.6046E-9
#define XMAX 3.402823466E+38

union double_long
{
    double f;
    long l;
};

/**********************************************
 * Prototypes for double ANSI C math functions *
 **********************************************/

/* Trigonometric functions */
double sinf(const double x) _MATH_REENTRANT;
double cosf(const double x) _MATH_REENTRANT;
double tanf(const double x) _MATH_REENTRANT;
double cotf(const double x) _MATH_REENTRANT;
double asinf(const double x) _MATH_REENTRANT;
double acosf(const double x) _MATH_REENTRANT;
double atanf(const double x) _MATH_REENTRANT;
double atan2f(const double x, const double y);

/* Hyperbolic functions */
double sinhf(const double x) _MATH_REENTRANT;
double coshf(const double x) _MATH_REENTRANT;
double tanhf(const double x) _MATH_REENTRANT;

/* Exponential, logarithmic and power functions */
double expf(const double x);
double logf(const double x) _MATH_REENTRANT;
double log10f(const double x) _MATH_REENTRANT;
double powf(const double x, const double y);
double sqrtf(const double a) _MATH_REENTRANT;

/* Nearest integer, absolute value, and remainder functions */
double fabsf(const double x) _MATH_REENTRANT;
double frexpf(const double x, int *pw2);
double ldexpf(const double x, const int pw2);
double ceilf(double x) _MATH_REENTRANT;
double floorf(double x) _MATH_REENTRANT;
double modff(double x, double * y);

#endif  /* _MATH_H */

