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

#ifndef __COMMANDS_C__
#define __COMMANDS_C__

#include <stdlib.h>
#include <string.h>

#include <system.c>
#include <digitalw.c>
#include <delay.c>

#include "global.h"
//#include "pbasic.c"
#include "commands.h"
#include "tokenizer.c"

/*	TODO:

	cls                     clear terminal screen
	cont [line]             continue program from stop
	dir                     list saved programs
	new                     erase code ram and flash memories
	reset                   reset the MCU!
	save [name]             save code ram to flash memory

	OPTIONAL :
	clear [flash]           clear ram [and flash] variables
	renumber [line]         renumber program lines (and save)
	auto [line]             automatically number program lines
	profile ([line][-[line]]|subname) display profile info
	purge name              purge saved program
	undo                    undo code changes since last save
	upgrade                 upgrade pbasic firmware!
	uptime                  print time since last reset
*/

/*---------------------------------------------------------------------------*/
void cmd_load(void)
{
	pbasic_debug("cmd_load()");
	pbasic_accept(TOKENIZER_LOAD);
/*
	if(tokenizer_token() == TOKENIZER_STRING)
	{
		tokenizer_string(string, sizeof(string));
		cmd_debug("filename is %s\n\r", string);
		handle = SD.open(string);
		myprogram= SD.read(handle);
*/

const char myprogram[] = 
"10 gosub 1010\n\
100 for i = 1 to 10\n\
110 print \"blink\",i\n\
120 pin 13,1\n\
130 pause 50 ms\n\
140 pin 13,0\n\
150 sleep 50 ms\n\
160 next i\n\
500 end\n\
1000 rem\n\
1001 rem --- setup subroutine\n\
1002 rem\n\
1010 setpin 13,0\n\
1100 return\n";

		mem = strlen(myprogram);
		// free memory if already allocated
		pbasic_free(program);
		// allocate memory to stock program
		program = (char *) malloc(1 + mem * sizeof(char));
		if (program != 0)
		{
			pbasic_debug("memory allocation succeed");
			strcpy(program, myprogram);
		}
		else
		{
			pbasic_error("Out of memory");
		}

/*
	}
	else
	{
		pbasic_error("syntax is load program);
	}
*/
}
/*---------------------------------------------------------------------------*/
void cmd_reset(void)
{
	pbasic_debug("cmd_reset()");
	pbasic_accept(TOKENIZER_RESET);
	Reset();
}
/*---------------------------------------------------------------------------*/
void cmd_new(void)
{
	pbasic_debug("cmd_new()");
	pbasic_accept(TOKENIZER_NEW);
	pbasic_free(program);
	for_stack_ptr = 0;
	gosub_stack_ptr = 0;
	ended = 0;
}

/*	-----------------------------------------------------------------------------
	list			All lines
	list 10     Only the line 10 of this programm is listing on screen.
	list -10    All lines until line 10 of this programm are listing on screen.
	list 10-    All lines beginning with line 10 of this programm are listing on screen.
	list 10-100 All lines beginning with line 10 and ending with line 100 are listing.
	---------------------------------------------------------------------------*/

void cmd_list(void)
{
	char *list;
	char *buffer;
	int cline, line1=0, line2=0xffff;

	pbasic_debug("cmd_list()");
	pbasic_accept(TOKENIZER_LIST);
/*
	line1 = tokenizer_num();
	pbasic_debug("cmd_list(): from line1=%d", line1);
	pbasic_accept(TOKENIZER_NUMBER);
	line2 = tokenizer_num();
	pbasic_debug("cmd_list(): to line2=%d", line1);
	pbasic_accept(TOKENIZER_NUMBER);
*/
	list = program;
	if (program !=0)
	{
		while(*list != '\0')
		{
			buffer = pbasic_get_line_number(list);
			//cline = atoi(buffer);
			//pbasic_debug("cmd_list(): %d", cline);
			//if (cline > line1 && cline < line2) 			
				CDCprintf("%5s ", buffer);
			list = list + strlen(buffer) + 1;
			buffer = pbasic_get_line(list);
			//if (cline > line1 && cline < line2) 			
				CDCprintf("%s\r\n", buffer);
			list = list + strlen(buffer) + 1;
		}
	}
}
/*---------------------------------------------------------------------------*/
void cmd_run(void)
{
	pbasic_debug("cmd_run()");
	pbasic_accept(TOKENIZER_RUN);

	// reset
	for_stack_ptr = 0;
	gosub_stack_ptr = 0;
	ended = 0;

	if (program != 0)
	{
		program_ptr = program;
		tokenizer_init(program);
	
		do
		{
			if(tokenizer_finished())
			{
				pbasic_debug("basic program finished");
				return;
			}
			pbasic_line_statement();
		} while(!pbasic_finished());
	}
}
/*---------------------------------------------------------------------------*/
void cmd_debug(void)
{
	pbasic_debug("cmd_debug()");
	pbasic_accept(TOKENIZER_DEBUG);
	switch(tokenizer_token())
	{
		case TOKENIZER_ON:
			pbasic_accept(TOKENIZER_ON);
			debug = 1;
			pbasic_debug("debug mode activated ...");
			break;
		case TOKENIZER_OFF:
			debug = 0;
			pbasic_accept(TOKENIZER_OFF);
			break;
		default:
			pbasic_error("syntax is 'debug on|off'");
	}
}
/*---------------------------------------------------------------------------*/
void cmd_memory(void)
{
	pbasic_debug("cmd_memory()");
	pbasic_accept(TOKENIZER_MEMORY);
	CDCprintf("%d bytes free.\r\n", HEAP - mem);
}
/*---------------------------------------------------------------------------*/
void cmd_edit(void)
{
	int line;

	pbasic_debug("cmd_edit()");
	pbasic_accept(TOKENIZER_EDIT);
	line = tokenizer_num();
	pbasic_accept(TOKENIZER_NUMBER);
}
/*---------------------------------------------------------------------------*/
void cmd_delete(void)
{
	pbasic_debug("cmd_delete()");
	pbasic_accept(TOKENIZER_DELETE);
}
/*---------------------------------------------------------------------------*/
void cmd_help(void)
{
	int t;
	struct keyword_token const *kt;

	pbasic_accept(TOKENIZER_HELP);
	t = tokenizer_token();
	for(kt = keywords; kt->token != t && kt->token != TOKENIZER_ERROR; kt++)
	{
		pbasic_debug("cmd_help(): %s\r\n", kt->desc);
	}
	if (kt->token == t)
	{
		CDCprintf("%s\r\n", kt->desc);
	}
	else
	{
		//pbasic_error("keyword not implemented.");
		for(kt = keywords; kt->token != TOKENIZER_ERROR; kt++)
		{
			CDCprintf("%s\t\t%s\r\n", kt->keyword, kt->desc);
		}
	}
}

#endif /* __COMMANDS_C__ */
