/*
 * Pinguino Basic Version 0.1
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

#ifndef __PBASIC_C__
#define __PBASIC_C__

#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>

#include <__cdc.c>
#include <delay.c>
#include <printf.c>

#include "pbasic.h"
#include "global.c"
#include "tokenizer.c"
#include "commands.c"
#include "blocks.c"
#include "statements.c"

/*---------------------------------------------------------------------------*/
void pbasic_init(void)
{
	debug = 0;
	while (CDCgetkey() != '\r');
	// TODO: clear screen
	pbasic_printf("\r\n", NULL);
	CDCprintf(TITRE);
	CDCprintf(COPYRIGHT);
	//CDCprintf(EMAIL);
	//CDCprintf(WEBSITE);
}
/*---------------------------------------------------------------------------*/
void pbasic(void)
{
	char cmd[MAX_STRINGLEN];
	
	pbasic_get_command(cmd);
	tokenizer_init(cmd);
	statement();
}
/*---------------------------------------------------------------------------*/
void pbasic_get_command(char *buffer)
{
	u8 i=0;
	char c;
	
	CDCprintf(">");
	do {
		c = CDCgetkey();
		CDCprintf("%c", c);
		buffer[i++] = c;
	} while (c != '\r');		// until RETURN is hit
	CDCprintf("\r\n");

	buffer[i-1]   = '\0';
	pbasic_debug("pbasic_get_command():\t%s", buffer);
	buffer[i-1]   = '\n';
	buffer[i] = '\0';
}
/*---------------------------------------------------------------------------*/
void pbasic_printf(const char *format, va_list args)
{
	char buffer[80];
	char length;

	length = psprintf(buffer, format, args);
	CDCputs(buffer,length);
	//va_end(args);
}
/*---------------------------------------------------------------------------*/
void pbasic_error(const char *format, ...)
{
	va_list args;

	CDCprintf("error: ");
	va_start(args, format);
	pbasic_printf(format, args);
	va_end(args);
	CDCprintf("\r\n");
}
/*---------------------------------------------------------------------------*/
void pbasic_debug(const char *format, ...)
{
	va_list args;

	va_start(args, format);
	if (debug==1)
	{
		CDCprintf("debug: ");
		pbasic_printf(format, args);
		CDCprintf("\r\n");
	}
	va_end(args);
}
/*---------------------------------------------------------------------------*/
void pbasic_exit(int num)
{
	if (num==1)
	{
		pbasic_error("sorry, you must reset your board");
		while(1);
	}
}
/*---------------------------------------------------------------------------*/
void accept(int token)
{
	if(token != tokenizer_token())
	{
		pbasic_error("token not expected (expected token %d, got %d)", token, tokenizer_token());
		tokenizer_error_print();
		pbasic_exit(1);
	}
	pbasic_debug("accept(): expected token %d, got it", token);
	tokenizer_next();
}
/*---------------------------------------------------------------------------*/
int varfactor(void)
{
	int r;
	pbasic_debug("varfactor(): obtaining %d from variable %d", variables[tokenizer_variable_num()], tokenizer_variable_num());
	r = pbasic_get_variable(tokenizer_variable_num());
	accept(TOKENIZER_VARIABLE);
	return r;
}
/*---------------------------------------------------------------------------*/
int factor(void)
{
	int r;

	pbasic_debug("factor(): token %d", tokenizer_token());
	switch(tokenizer_token())
	{
		case TOKENIZER_NUMBER:
			r = tokenizer_num();
			pbasic_debug("factor(): number %d", r);
			accept(TOKENIZER_NUMBER);
			break;
		case TOKENIZER_LEFTPAREN:
			accept(TOKENIZER_LEFTPAREN);
			r = expr();
			accept(TOKENIZER_RIGHTPAREN);
			break;
		default:
			r = varfactor();
			break;
  }
  return r;
}
/*---------------------------------------------------------------------------*/
int term(void)
{
	int f1, f2;
	int op;

	f1 = factor();
	op = tokenizer_token();
	pbasic_debug("term(): token %d", op);
	while(op == TOKENIZER_ASTR ||	op == TOKENIZER_SLASH || op == TOKENIZER_MOD)
	{
		tokenizer_next();
		f2 = factor();
		pbasic_debug("term(): %d %d %d", f1, op, f2);
		switch(op)
		{
			case TOKENIZER_ASTR:
				f1 = f1 * f2;
				break;
			case TOKENIZER_SLASH:
				f1 = f1 / f2;
				break;
			case TOKENIZER_MOD:
				f1 = f1 % f2;
				break;
		}
	op = tokenizer_token();
	}
	pbasic_debug("term(): %d", f1);
	return f1;
}
/*---------------------------------------------------------------------------*/
int expr(void)
{
	int t1, t2;
	int op;

	t1 = term();
	op = tokenizer_token();
	pbasic_debug("expr(): token %d", op);
	while(op == TOKENIZER_PLUS || op == TOKENIZER_MINUS || op == TOKENIZER_AND || op == TOKENIZER_OR)
	{
		tokenizer_next();
		t2 = term();
		pbasic_debug("expr(): %d %d %d", t1, op, t2);
		switch(op)
		{
			case TOKENIZER_PLUS:
				t1 = t1 + t2;
				break;
			case TOKENIZER_MINUS:
				t1 = t1 - t2;
				break;
			case TOKENIZER_AND:
				t1 = t1 & t2;
				break;
			case TOKENIZER_OR:
				t1 = t1 | t2;
				break;
		}
		op = tokenizer_token();
	}
	pbasic_debug("expr(): %d", t1);
	return t1;
}
/*---------------------------------------------------------------------------*/
int relation(void)
{
	int r1, r2;
	int op;

	r1 = expr();
	op = tokenizer_token();
	pbasic_debug("relation(): token %d", op);
	while(op == TOKENIZER_LT || op == TOKENIZER_GT || op == TOKENIZER_EQ)
	{
		tokenizer_next();
		r2 = expr();
		pbasic_debug("relation(): %d %d %d", r1, op, r2);
		switch(op)
		{
			case TOKENIZER_LT:
				r1 = r1 < r2;
				break;
			case TOKENIZER_GT:
				r1 = r1 > r2;
				break;
			case TOKENIZER_EQ:
				r1 = r1 == r2;
				break;
		}
		op = tokenizer_token();
	}
	return r1;
}
/*---------------------------------------------------------------------------*/
void jump_linenum(int linenum)
{
	tokenizer_init(program_ptr);
	while(tokenizer_num() != linenum)
	{
		do
		{
			do
			{
				tokenizer_next();
			} while(tokenizer_token() != TOKENIZER_CR &&	tokenizer_token() != TOKENIZER_ENDOFINPUT);
			if(tokenizer_token() == TOKENIZER_CR)
			{
				tokenizer_next();
			}
		} while(tokenizer_token() != TOKENIZER_NUMBER);
		pbasic_debug("jump_linenum(): Found line %d", tokenizer_num());
	}
}
/*---------------------------------------------------------------------------*/
void statement(void)
{
	int token;

	token = tokenizer_token();

	switch(token)
	{
		case TOKENIZER_PRINT:
			print_statement();
			break;
		case TOKENIZER_IF:
			if_statement();
			break;
		case TOKENIZER_GOTO:
			goto_statement();
			break;
		case TOKENIZER_GOSUB:
			gosub_statement();
			break;
		case TOKENIZER_RETURN:
			return_statement();
			break;
		case TOKENIZER_FOR:
			for_statement();
			break;
		case TOKENIZER_NEXT:
			next_statement();
			break;
		case TOKENIZER_END:
			end_statement();
			break;
		case TOKENIZER_LET:
			accept(TOKENIZER_LET);
			/* Fall through. */
		case TOKENIZER_VARIABLE:
			let_statement();
			break;
		case TOKENIZER_RUN:
			cmd_run();
			break;
		case TOKENIZER_LOAD:
			cmd_load();
			break;
		case TOKENIZER_DEBUG:
			cmd_debug();
			break;
		case TOKENIZER_LIST:
			cmd_list();
			break;
		case TOKENIZER_EDIT:
			cmd_edit();
			break;
		case TOKENIZER_DELETE:
			cmd_delete();
			break;
		case TOKENIZER_HELP:
			cmd_help();
			break;
		case TOKENIZER_PAUSE:
			pause_statement();
			break;
		case TOKENIZER_SETPIN:
			setpin_statement();
			break;
		case TOKENIZER_PIN:
			pin_statement();
			break;
		case TOKENIZER_TOGGLE:
			toggle_statement();
			break;
		case TOKENIZER_REM:
			rem_statement();
			break;
		default:
			pbasic_error("line %d, token %d not implemented", tokenizer_num(), token);
			//pbasic_exit(1);
	}
}
/*---------------------------------------------------------------------------*/
void line_statement(void)
{
	pbasic_debug("----------- Line number %d -----------", tokenizer_num());
	/*    current_linenum = tokenizer_num();*/
	accept(TOKENIZER_NUMBER);
	statement();
	return;
}
/*---------------------------------------------------------------------------*/
int pbasic_finished(void)
{
	return ended || tokenizer_finished();
}
/*---------------------------------------------------------------------------*/
void pbasic_set_variable(int varnum, int value)
{
	if(varnum > 0 && varnum <= MAX_VARNUM)
	{
		variables[varnum] = value;
	}
}
/*---------------------------------------------------------------------------*/
int pbasic_get_variable(int varnum)
{
	if(varnum > 0 && varnum <= MAX_VARNUM)
	{
		return variables[varnum];
	}
	return 0;
}
/*---------------------------------------------------------------------------*/

#endif /* __PBASIC_C__ */
