/*
 * Pinguino Basic
 * Copyright (c) 2011, Régis Blanchot
 *
 * Pinguino Basic Engine is originally based on uBasic
 * Copyright (c) 2006, Adam Dunkels
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. Neither the name of the author nor the names of its contributors
 *    may be used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 *
 */

#ifndef __STATEMENTS_C__
#define __STATEMENTS_C__

#include <delay.c>
#include <digitalw.c>

#include "global.h"
//#include "pbasic.c"
#include "statements.h"
#include "tokenizer.c"

/*
	Quick Reference
	
	TODO:
	<Ctrl-C>                stop running program
	assert expression                break if expression is false
	data n [, ...]                   read-only data
	dim variable[$][[n]] [as ...], ... dimension variables
	end                              end program
	halt                             loop forever
	input [dec|hex|raw] variable[$], ... input data
	label label                      read/data label
	lcd pos, [dec|hex|raw] expression, ... * display results on lcd
	let variable[$] = expression, ... assign variable
	print [dec|hex|raw] expression, ... print strings/expressions
	read variable [, ...]            read data into variables
	restore [label]                  restore data pointer
	sleep expression (s|ms|us)       delay program execution
	stop                             insert breakpoint in code
	vprint var[$] = [dec|hex|raw] expr, ... print to variable

	digital pin,state / analog pin / pin pin /
*/

/*---------------------------------------------------------------------------*/
void rem_statement(void)
{
	pbasic_debug("rem_statement()");
	pbasic_accept(TOKENIZER_REM);
	while(*ptr != '\n')
	{
		++ptr;
	}
	//tokenizer_next();
}
/*---------------------------------------------------------------------------*/
void pause_statement(void)
{
	int i, t;
	
	pbasic_debug("pause_statement()");
	pbasic_accept(TOKENIZER_PAUSE);
	t = tokenizer_num();
	pbasic_accept(TOKENIZER_NUMBER);
	switch(tokenizer_token())
	{
		case TOKENIZER_US:
			Delayus(t);
			pbasic_accept(TOKENIZER_US);
			break;
		case TOKENIZER_MS:
			Delayms(t);
			pbasic_accept(TOKENIZER_MS);
			break;
		case TOKENIZER_SEC:
			for (i=0; i<t; i++)
				Delayms(1000);
			pbasic_accept(TOKENIZER_SEC);
			break;
		default:
			Delayms(t);
	}
	pbasic_accept(TOKENIZER_CR);
}
/*---------------------------------------------------------------------------*/
void setpin_statement(void)
{
	char pin, dir;
	
	pbasic_debug("setpin_statement()");
	pbasic_accept(TOKENIZER_SETPIN);
	pin = tokenizer_num();
	pbasic_accept(TOKENIZER_NUMBER);
	pbasic_accept(TOKENIZER_COMMA);
	dir = tokenizer_num();
	if (dir > 1) dir = 1;
	pbasic_accept(TOKENIZER_NUMBER);
	pbasic_debug("setpin_statement(): pin %d, dir %d", pin, dir);
	pbasic_debug("setpin_statement(): pinread %d", pinread(pin));
	pinmode(pin, dir);
	pbasic_debug("setpin_statement(): pinread %d", pinread(pin));
	pbasic_accept(TOKENIZER_CR);
}
/*---------------------------------------------------------------------------*/
void pin_statement(void)
{
	char pin, state;
	
	pbasic_debug("pin_statement()");
	pbasic_accept(TOKENIZER_PIN);
	pin = tokenizer_num();
	pbasic_accept(TOKENIZER_NUMBER);
	pbasic_accept(TOKENIZER_COMMA);
	state = tokenizer_num();
	if (state > 1) state = 1;
	pbasic_accept(TOKENIZER_NUMBER);
	pbasic_debug("pin_statement(): pin %d, state %d", pin, state);
	pbasic_debug("setpin_statement(): digitalread %d", digitalread(pin));
	digitalwrite(pin, state);
	pbasic_debug("setpin_statement(): digitalread %d", digitalread(pin));
	pbasic_accept(TOKENIZER_CR);
}
/*---------------------------------------------------------------------------*/
void toggle_statement(void)
{
	char pin;
	
	pbasic_debug("toggle_statement()");
	pbasic_accept(TOKENIZER_TOGGLE);
	pin = tokenizer_num();
	pbasic_accept(TOKENIZER_NUMBER);
	pbasic_debug("toggle_statement(): pin %d", pin);
	toggle(pin);
	pbasic_accept(TOKENIZER_CR);
}
/*---------------------------------------------------------------------------*/
void print_statement(void)
{
	pbasic_debug("print_statement()");
	pbasic_accept(TOKENIZER_PRINT);
	do
	{
		if(tokenizer_token() == TOKENIZER_STRING)
		{
			tokenizer_string(string, sizeof(string));
			CDCprintf("%s", string);
			tokenizer_next();
		}
		else if(tokenizer_token() == TOKENIZER_COMMA)
		{
			CDCprintf("\t");
			tokenizer_next();
		}
		else if(tokenizer_token() == TOKENIZER_SEMICOLON)
		{
			tokenizer_next();
		}
		else if(tokenizer_token() == TOKENIZER_VARIABLE || tokenizer_token() == TOKENIZER_NUMBER)
		{
			CDCprintf("%d", pbasic_expr());
		}
		else
		{
			break;
		}
	} while(tokenizer_token() != TOKENIZER_CR &&	tokenizer_token() != TOKENIZER_ENDOFINPUT);
	CDCprintf("\r\n");
	pbasic_debug("End of print");
	tokenizer_next();
}
/*---------------------------------------------------------------------------*/
void let_statement(void)
{
	int var;

	var = tokenizer_variable_num();

	pbasic_accept(TOKENIZER_VARIABLE);
	pbasic_accept(TOKENIZER_EQ);
	pbasic_set_variable(var, pbasic_expr());
	pbasic_debug("let_statement(): assign %d to %d", variables[var], var);
	pbasic_accept(TOKENIZER_CR);
}
/*---------------------------------------------------------------------------*/
void end_statement(void)
{
	pbasic_accept(TOKENIZER_END);
	ended = 1;
}

#endif /* __STATEMENTS_C__ */
