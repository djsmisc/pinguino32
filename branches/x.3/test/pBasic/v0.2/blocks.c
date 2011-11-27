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

#ifndef __BLOCKS_C__
#define __BLOCKS_C__

#include "global.h"
//#include "pbasic.c"
#include "blocks.h"
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
	rem remark                       remark
	restore [label]                  restore data pointer
	sleep expression (s|ms|us)       delay program execution
	stop                             insert breakpoint in code
	vprint var[$] = [dec|hex|raw] expr, ... print to variable

	digital pin,state / analog pin / pin pin /
*/

/*---------------------------------------------------------------------------*/
void goto_statement(void)
{
	pbasic_accept(TOKENIZER_GOTO);
	pbasic_jump_linenum(tokenizer_num());
}
/*---------------------------------------------------------------------------*/
void if_statement(void)
{
	int r;

	pbasic_accept(TOKENIZER_IF);

	r = pbasic_relation();
	pbasic_debug("if_statement(): relation %d", r);
	pbasic_accept(TOKENIZER_THEN);
	if(r)
	{
		pbasic_statement();
	}
	else
	{
		do
		{
			tokenizer_next();
		} while(tokenizer_token() != TOKENIZER_ELSE && tokenizer_token() != TOKENIZER_CR && tokenizer_token() != TOKENIZER_ENDOFINPUT);
		if(tokenizer_token() == TOKENIZER_ELSE)
		{
			tokenizer_next();
			pbasic_statement();
		}
		else if(tokenizer_token() == TOKENIZER_CR)
		{
			tokenizer_next();
		}
	}
}
/*---------------------------------------------------------------------------*/
void gosub_statement(void)
{
	int linenum;
	pbasic_accept(TOKENIZER_GOSUB);
	linenum = tokenizer_num();
	pbasic_accept(TOKENIZER_NUMBER);
	pbasic_accept(TOKENIZER_CR);
	if(gosub_stack_ptr < MAX_GOSUB_STACK_DEPTH)
	{
		gosub_stack[gosub_stack_ptr] = tokenizer_num();
		gosub_stack_ptr++;
		pbasic_jump_linenum(linenum);
	}
	else
	{
		pbasic_debug("gosub_statement(): gosub stack exhausted");
	}
}
/*---------------------------------------------------------------------------*/
void return_statement(void)
{
	pbasic_accept(TOKENIZER_RETURN);
	if(gosub_stack_ptr > 0)
	{
		gosub_stack_ptr--;
		pbasic_jump_linenum(gosub_stack[gosub_stack_ptr]);
	}
	else
	{
		pbasic_error("non-matching return");
	}
}
/*---------------------------------------------------------------------------*/
void next_statement(void)
{
	int var;

	pbasic_accept(TOKENIZER_NEXT);
	var = tokenizer_variable_num();
	pbasic_accept(TOKENIZER_VARIABLE);
	if(for_stack_ptr > 0 &&	var == for_stack[for_stack_ptr - 1].for_variable)
	{
		pbasic_set_variable(var, pbasic_get_variable(var) + 1);
		if(pbasic_get_variable(var) <= for_stack[for_stack_ptr - 1].to)
		{
			pbasic_jump_linenum(for_stack[for_stack_ptr - 1].line_after_for);
		}
		else
		{
			for_stack_ptr--;
			pbasic_accept(TOKENIZER_CR);
		}
	}
	else
	{
		pbasic_error("non-matching next (expected %d, found %d)", for_stack[for_stack_ptr - 1].for_variable, var);
		pbasic_accept(TOKENIZER_CR);
	}
}
/*---------------------------------------------------------------------------*/
void for_statement(void)
{
	int for_variable, to;

	pbasic_accept(TOKENIZER_FOR);
	for_variable = tokenizer_variable_num();
	pbasic_accept(TOKENIZER_VARIABLE);
	pbasic_accept(TOKENIZER_EQ);
	pbasic_set_variable(for_variable, pbasic_expr());
	pbasic_accept(TOKENIZER_TO);
	to = pbasic_expr();
	pbasic_accept(TOKENIZER_CR);

	if(for_stack_ptr < MAX_FOR_STACK_DEPTH)
	{
		for_stack[for_stack_ptr].line_after_for = tokenizer_num();
		for_stack[for_stack_ptr].for_variable = for_variable;
		for_stack[for_stack_ptr].to = to;
		pbasic_debug("for_statement(): new for, var %d to %d", for_stack[for_stack_ptr].for_variable, for_stack[for_stack_ptr].to);
		for_stack_ptr++;
	}
	else
	{
		pbasic_debug("for_statement(): for stack depth exceeded");
	}
}

#endif /* __BLOCKS_C__ */
