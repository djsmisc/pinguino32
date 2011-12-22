/*	----------------------------------------------------------------------------
	FILE:			stdio.c
	PROJECT:		pinguino - http://www.pinguino.cc/
	PURPOSE:		alternative printf and sprintf functions
	PROGRAMER:		regis blanchot <rblanchot@gmail.com>
	FIRST RELEASE:	10 nov. 2010
	LAST RELEASE:	26 nov. 2011
	----------------------------------------------------------------------------
	TODO : floating point support + vsprintf
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

#ifndef __STDIO_C
#define __STDIO_C

#include <stdarg.h>

typedef void (*stdout) (unsigned char);	// type of :	void foo(char x)
static stdout pputchar;					// then : 		void pputchar(char x)

/*	----------------------------------------------------------------------------
	print char
	--------------------------------------------------------------------------*/

static void pprintc(char **str, char c)
{
	if (str)
	{
		**str = c;
		++(*str);
	}
	else
	{
		pputchar(c);
	}
}

#define PAD_RIGHT	1
#define PAD_ZERO	2

/*	----------------------------------------------------------------------------
	print string
	--------------------------------------------------------------------------*/

static int pprints(char **out, const char *string, int width, int pad)
{
	register int pc = 0;
	int padchar = ' ';
	int len = 0;
	const char *ptr;

	if (width > 0)
	{
		for (ptr = string; *ptr; ++ptr)
			++len;
		if (len >= width)
			width = 0;
		else
			width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT))
	{
		for ( ; width > 0; --width)
		{
			pprintc(out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string)
	{
		pprintc(out, *string);
		++pc;
	}
	for ( ; width > 0; --width)
	{
		pprintc(out, padchar);
		++pc;
	}

	return pc;
}

/* the following should be enough for 32 bit int */
#define PRINT_BUF_LEN 12

/*	----------------------------------------------------------------------------
	print 32 bit int
	--------------------------------------------------------------------------*/

static int pprinti(char **out, long i, int base, int sign, int width, int pad, int letterbase)
{
	char buffer[PRINT_BUF_LEN];
	char *string;
	int neg = 0, pc = 0;
	long t;
	unsigned long unslng = i;

	if (i == 0)
	{
		buffer[0] = '0';
		buffer[1] = '\0';
		return pprints(out, buffer, width, pad);
	}

	if (sign && base == 10 && i < 0)
	{
		neg = 1;
		unslng += -i;
	}

	string = buffer + PRINT_BUF_LEN-1;
	*string = '\0';

	while (unslng)
	{
		t = unslng % base;
		if( t >= 10 )
			t += letterbase - '0' - 10;
		*--string = t + '0';
		unslng /= base;
	}

	if (neg)
	{
		if (width && (pad & PAD_ZERO))
		{
			pprintc(out, '-');
			++pc;
			--width;
		}
		else
		{
			*--string = '-';
		}
	}

	return pc + pprints(out, string, width, pad);
}

/*	----------------------------------------------------------------------------
	print float (based on Matthias Watkins work)

	This is a simple implemetation with rigid parameters:
 	- 3 digits precision max
 	- absolute range is -524,287 to 524,287 
 	- resolution is 0.125 and always rounds down
	--------------------------------------------------------------------------*/

static int pprintfl(char **out, float value, int width, int pad)
{
	union
	{
		float f;
	    struct							// 32 bits
	    {
		   unsigned mantissa_lo	: 8;	//  8 bits
		   unsigned mantissa_hi	: 8;	//  8 bits
		   unsigned mantissa_up	: 7;	//  7 bits
		   unsigned exponent	: 8;	//  8 bits
		   unsigned sign		: 1;	//  1 bits
	    };
	} helper;
	
	unsigned long mantissa;				// 23 bits
	signed char exponent;				//  8 bits
	unsigned int int_part;
	char buffer[PRINT_BUF_LEN];
	char *string;
	int count = 0;
	long t;
	
	helper.f = value;
	//mantissa is LS 23 bits
	mantissa = helper.mantissa_lo;
	mantissa += ((unsigned long) helper.mantissa_hi << 8);
	mantissa += ((unsigned long) helper.mantissa_up << 8);
	//add the 24th bit to get 1.mmmm^eeee format
	mantissa += 0x00800000;
	//exponent is biased by 127
	exponent = (signed char) helper.exponent - 127;
	
	//too big to shove into 8 chars
	/*
	if (exponent > 18)
	{
	    buffer[0] = 'T';
	    buffer[1] = 'o';
	    buffer[2] = 'o';
	    buffer[3] = ' ';
	    buffer[4] = 'b';
	    buffer[5] = 'i';
	    buffer[6] = 'g';
	    buffer[7] = '\0';
		return pprints(out, buffer, width, pad);
	}
	*/
	
	//too small to resolve (resolution of 1/8)
	if (exponent < -3)
	{
		buffer[0] = '0';
		buffer[1] = '\0';
		return pprints(out, buffer, width, pad);
	}
	
	// begin at the end of the string
	string = buffer + PRINT_BUF_LEN - 1;
	*string = '\0';

	// fractional part
	switch (0x7 & (mantissa  >> (20 - exponent)))
	{
	    case 0://000
			*--string = '0';
			*--string = '0';
			*--string = '0';
			break;
	    case 1://125
			*--string = '5';		  
			*--string = '2';
			*--string = '1';
			break;
	    case 2://250
			*--string = '0';		  
			*--string = '5';
			*--string = '2';
			break;
	    case 3://375
			*--string = '5';		  
			*--string = '7';
			*--string = '3';
			break;
	    case 4://500
			*--string = '0';
			*--string = '0';		  
			*--string = '5';
			break;
	    case 5://625
			*--string = '5';		  
			*--string = '2';
			*--string = '6';
			break;
	    case 6://750
			*--string = '0';		  
			*--string = '5';
			*--string = '7';
			break;
	    case 7://875
			*--string = '5';				
			*--string = '7';
			*--string = '8';
			break;
	}

	//add the decimal point    
	*--string = '.';

	// integer part
	int_part = mantissa >> (23 - exponent);    

	//convert to string
	while (int_part)
	{
		t = int_part % 10;
		*--string = '0' + t;
		int_part /= 10;
	}

	//add negative sign (if applicable)
	if (helper.sign)
	{
		if (width && (pad & PAD_ZERO))
		{
			pprintc(out, '-');
			++count;
			--width;
		}
		else
		{
			*--string = '-';
		}
	}

	return count + pprints(out, string, width, pad);
}

/*	----------------------------------------------------------------------------
	print
	--------------------------------------------------------------------------*/

static int pprint(char **out, const char *format, va_list args)
{
	int lng, width, pad;
	register int pc = 0;
	char scr[2];

	for (; *format != 0; ++format)
	{
		lng = 0; // int by default
		if (*format == '%')
		{
			++format;
			width = pad = 0;
			if (*format == '\0')	// end of line
				break;
			if (*format == '%')		// error
				goto abort;
			if (*format == '-')		// right justify
			{
				++format;
				pad = PAD_RIGHT;
			}
			while (*format == '0')	// 0-padded
			{
				++format;
				pad |= PAD_ZERO;
			}
			for ( ; *format >= '0' && *format <= '9'; ++format)
			{
				width *= 10;
				width += *format - '0';
			}
			if (*format == 's')		// string
			{
				char *s = va_arg(args, char*);
				pc += pprints(out, s?s:"(null)", width, pad);
				continue;
			}
			if (*format == 'l')		// long support
			{
				++format;
				lng = 1;
			}
			if (*format == 'u')		// unsigned decimal
			{
				if (lng)
					pc += pprinti(out, va_arg(args, unsigned long), 10, 0, width, pad, 'a');
				else
					pc += pprinti(out, va_arg(args, unsigned int), 10, 0, width, pad, 'a');
				continue;
			}
			if (*format == 'd')		// signed decimal
			{
				if (lng)
					pc += pprinti(out, va_arg(args, long), 10, 1, width, pad, 'a');
				else
					pc += pprinti(out, va_arg(args, int), 10, 1, width, pad, 'a');
				continue;
			}
			if (*format == 'x' || *format == 'p')	// lower hexa or pointer
			{
				if (lng)
					pc += pprinti(out, va_arg(args, unsigned long), 16, 0, width, pad, 'a');
				else
					pc += pprinti(out, va_arg(args, unsigned int), 16, 0, width, pad, 'a');
				continue;
			}
			if (*format == 'X' || *format == 'P')	// upper hexa or pointer
			{
				if (lng)
					pc += pprinti(out, va_arg(args, unsigned long), 16, 0, width, pad, 'A');
				else
					pc += pprinti(out, va_arg(args, unsigned int), 16, 0, width, pad, 'A');
				continue;
			}
			if (*format == 'b')		// binary
			{
				if (lng)
					pc += pprinti(out, va_arg(args, unsigned long), 2, 0, width, pad, 'a');
				else
					pc += pprinti(out, va_arg(args, unsigned int), 2, 0, width, pad, 'a');
				continue;
			}
			if (*format == 'o')		// octal
			{
				if (lng)
					pc += pprinti(out, va_arg(args, unsigned long), 8, 0, width, pad, 'a');
				else
					pc += pprinti(out, va_arg(args, unsigned int), 8, 0, width, pad, 'a');
				continue;
			}
			if (*format == 'c') 	// ascii
			{
				/* char are converted to int then pushed on the stack */
				scr[0] = (char)va_arg(args, long);
				//scr[0] = va_arg(args, char);
				scr[1] = '\0';
				pc += pprints(out, scr, width, pad);
				continue;
			}
			if (*format == 'f') 	// float
			{
				//pc += pprints(out, "not yet implemented\0", width, pad);
				pc += pprintfl(out, va_arg(args, float), width, pad);
				continue;
			}
		}
		else
		{
		abort:
			pprintc(out, *format);
			++pc;
		}
	}
	if (out) **out = '\0';
	//va_end( args );
	return pc;
}

/*	----------------------------------------------------------------------------
	printf
	--------------------------------------------------------------------------*/

//int pprintf(stdout func, const char *format, ...)
int pprintf(stdout func, const char *format, va_list args)
{
	//va_list args;
    
	pputchar = func;
	//va_start( args, format );
    return pprint(0, format, args);
}

/*	----------------------------------------------------------------------------
	sprintf
	--------------------------------------------------------------------------*/

//int psprintf(char *out, const char *format, va_list args)
int psprintf(char *out, const char *format, ...)
{
	va_list args;

	va_start(args, format);
	return pprint(&out, format, args);
}

#endif /* __STDIO_C */
