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

#ifndef __TOKENIZER_C__
#define __TOKENIZER_C__

#include <string.h>
#include <ctype.h>
//#include <stdlib.h>

#include "global.h"
//#include "pbasic.c"
#include "tokenizer.h"

char const *ptr, *nextptr;

#define MAX_NUMLEN 5

struct keyword_token
{
	char *keyword;
	int token;
	char *desc; 
};

int current_token = TOKENIZER_ERROR;

// description string MUST be shorter than 80 bytes
const struct keyword_token keywords[] = {
	{"ms", TOKENIZER_MS,
"stands for milliseconds, can be used with 'pause' or 'sleep'. ex pause 500 ms"},
	{"us", TOKENIZER_US,
"stands for microseconds, can be used with 'pause' or 'sleep'. ex sleep 100 us"},
	{"sec", TOKENIZER_SEC,
"stands for seconds, can be used with 'pause' or 'sleep'. ex sleep 1 sec"},
	{"on", TOKENIZER_ON,
"is used to activate different mode (cf. debug)"},
	{"off", TOKENIZER_OFF,
"is used to desactivate different mode (cf. debug)"},
	{"let", TOKENIZER_LET,
"is optinnal and used to assign numerical values or chars in a variable."},
	{"print", TOKENIZER_PRINT,
"is used to print data onto the screen, strings must be between quotes."},
	{"?", TOKENIZER_PRINT,
"is an abbreviation of the 'print' command."},
	{"if", TOKENIZER_IF,
"evaluate the following condition (see also 'then' and 'else'."},
	{"then", TOKENIZER_THEN,
"the following command is executed if the if-condition is true."},
	{"else", TOKENIZER_ELSE,
"the following command is executed if the if-condition is false."},
	{"for", TOKENIZER_FOR,
"is the start-command for a for...to...step...next-loop."},
	{"to", TOKENIZER_TO,
"is used as part of a for-next loop."},
	{"next", TOKENIZER_NEXT,
""},
	{"goto", TOKENIZER_GOTO,
"jumps to the indicated line in the program."},
	{"gosub", TOKENIZER_GOSUB,
"jumps to a subroutine at the indicated line number (see also 'return')."},
	{"return", TOKENIZER_RETURN,
"ends a subroutine called with 'gosub' and return to the command following it."},
	{"call", TOKENIZER_CALL,
""},
	{"end", TOKENIZER_END,
"ends the program, any BASIC-Code following will not be processed."},
	{"pause", TOKENIZER_PAUSE,
"wait for a specific amount of time (us, ms or sec.) ex pause 500 ms"},
	{"sleep", TOKENIZER_PAUSE,
"wait for a specific amount of time (us, ms or sec.) ex sleep 500 ms"},
	{"setpin", TOKENIZER_SETPIN,
"set pin number as input (0) or output (1). ex setpin 13,0"},
	{"pin", TOKENIZER_PIN,
"set pin number at low (0) or high (1) level. ex pin 13,0"},
	{"toggle", TOKENIZER_TOGGLE,
"set pin number low if it was high and vice-versa"},
	{"run", TOKENIZER_RUN,
"starts your program at its first line or at specific line."},
	{"load", TOKENIZER_LOAD,
"is used for loading program files from SD-card. ex load \"example/myprogram.bas\""},
	{"list", TOKENIZER_LIST,
"displays all lines from the program. ex list 100 or list -100 or list 100-200"},
	{"debug", TOKENIZER_DEBUG,
"activate (on) or desactivate (off) the debug mode. ex debug on"},
	{"edit", TOKENIZER_EDIT,
"allow to modify a specific line. ex list 100"},
	{"delete", TOKENIZER_DELETE,
"allow to delete a specific line. ex delete 100"},
	{"rem", TOKENIZER_REM,
"put your own remarks after this keyword they will be ignored by the interpreter."},
	{"help", TOKENIZER_HELP,
"to read a simple definition from a specific keywords. ex help print"},
	{"memory", TOKENIZER_MEMORY,
"gives the amount of bytes available for your program."},
	{"new", TOKENIZER_NEW,
"erase program and variables from the memory."},
	{"reset", TOKENIZER_RESET,
"reset your Pinguino board"},
	{NULL, TOKENIZER_ERROR}
};

/*---------------------------------------------------------------------------*/
int singlechar(void)
{
  if(*ptr == '\n') {
    return TOKENIZER_CR;
  } else if(*ptr == ',') {
    return TOKENIZER_COMMA;
  } else if(*ptr == ';') {
    return TOKENIZER_SEMICOLON;
  } else if(*ptr == '+') {
    return TOKENIZER_PLUS;
  } else if(*ptr == '-') {
    return TOKENIZER_MINUS;
  } else if(*ptr == '&') {
    return TOKENIZER_AND;
  } else if(*ptr == '|') {
    return TOKENIZER_OR;
  } else if(*ptr == '*') {
    return TOKENIZER_ASTR;
  } else if(*ptr == '/') {
    return TOKENIZER_SLASH;
  } else if(*ptr == '%') {
    return TOKENIZER_MOD;
  } else if(*ptr == '(') {
    return TOKENIZER_LEFTPAREN;
  } else if(*ptr == ')') {
    return TOKENIZER_RIGHTPAREN;
  } else if(*ptr == '<') {
    return TOKENIZER_LT;
  } else if(*ptr == '>') {
    return TOKENIZER_GT;
  } else if(*ptr == '=') {
    return TOKENIZER_EQ;
  }
  return 0;
}
/*---------------------------------------------------------------------------*/
char * get_name_token(char *dest, char *src)
{
	char i;

	for(i=0 ; src[i] != ' ' && src[i] != '\n' && src[i] != '\0' ; i++)
		dest[i] = src[i];
	dest[i] = '\0';
	return dest;
}
/*---------------------------------------------------------------------------*/
int get_next_token(void)
{
	struct keyword_token const *kt;
	int i;
	char buffer[MAX_STRINGLEN];

	pbasic_debug("get_next_token(): %s", get_name_token(buffer, ptr));

	if(*ptr == 0)
	{
		return TOKENIZER_ENDOFINPUT;
	}

	if(isdigit(*ptr))
	{
		for(i = 0; i < MAX_NUMLEN; ++i)
		{
			if(!isdigit(ptr[i]))
			{
				if(i > 0)
				{
					nextptr = ptr + i;
					return TOKENIZER_NUMBER;
				}
				else
				{
					pbasic_error("too short number");
					return TOKENIZER_ERROR;
				}
			}
			if(!isdigit(ptr[i]))
			{
				pbasic_error("malformed number");
				return TOKENIZER_ERROR;
			}
		}
		pbasic_error("too long number");
		return TOKENIZER_ERROR;
	}
	else if(singlechar())
	{
		nextptr = ptr + 1;
		return singlechar();
	}
	else if(*ptr == '"')
	{
		nextptr = ptr;
		do {
			++nextptr;
		} while(*nextptr != '"');
		++nextptr;
		return TOKENIZER_STRING;
	}
	else
	{
		for(kt = keywords; kt->keyword != NULL; ++kt)
		{
			if(strncmp(ptr, kt->keyword, strlen(kt->keyword)) == 0)
			{
				nextptr = ptr + strlen(kt->keyword);
				return kt->token;
			}
		}
	}

	if(*ptr >= 'a' && *ptr <= 'z')
	{
		nextptr = ptr + 1;
		return TOKENIZER_VARIABLE;
	}

	return TOKENIZER_ERROR;
}
/*---------------------------------------------------------------------------*/
void tokenizer_init(const char *prg)
{
	ptr = prg;
	current_token = get_next_token();
}
/*---------------------------------------------------------------------------*/
int tokenizer_token(void)
{
	return current_token;
}
/*---------------------------------------------------------------------------*/
void tokenizer_next(void)
{
	char buffer[MAX_STRINGLEN];

	if(tokenizer_finished())
	{
		return;
	}

	pbasic_debug("tokenizer_next(): %s", get_name_token(buffer, nextptr));
	ptr = nextptr;
	while(*ptr == ' ')
	{
		++ptr;
	}
	current_token = get_next_token();
	pbasic_debug("tokenizer_next(): %s token %d", get_name_token(buffer, ptr), current_token);
	return;
}
/*---------------------------------------------------------------------------*/
int tokenizer_num(void)
{
	return atoi(ptr);
}
/*---------------------------------------------------------------------------*/
void tokenizer_string(char *dest, int len)
{
	char *string_end;
	int string_len;

	if(tokenizer_token() != TOKENIZER_STRING)
	{
		return;
	}
	string_end = strchr(ptr + 1, '"');
	if(string_end == NULL)
	{
		return;
	}
	string_len = string_end - ptr - 1;
	if(len < string_len)
	{
		string_len = len;
	}
	memcpy(dest, ptr + 1, string_len);
	dest[string_len] = 0;
}
/*---------------------------------------------------------------------------*/
void tokenizer_error_print(void)
{
	char buffer[MAX_STRINGLEN];
	pbasic_error("invalid keyword %s", get_name_token(buffer, ptr));
}
/*---------------------------------------------------------------------------*/
int tokenizer_finished(void)
{
	return *ptr == 0 || current_token == TOKENIZER_ENDOFINPUT;
}
/*---------------------------------------------------------------------------*/
int tokenizer_variable_num(void)
{
	return *ptr - 'a';
}
/*---------------------------------------------------------------------------*/

#endif /* __TOKENIZER_C__ */

