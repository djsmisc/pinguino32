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

#ifndef __COMMANDS_C__
#define __COMMANDS_C__

#include <stdlib.h>
#include <string.h>

#include <delay.c>
#include <digitalw.c>

#include "global.h"
//#include "pbasic.c"
#include "commands.h"
#include "tokenizer.c"

/*	TODO:

	clear [flash]           clear ram [and flash] variables
	cls                     clear terminal screen
	cont [line]             continue program from stop
	dir                     list saved programs
	memory                  print memory usage
	new                     erase code ram and flash memories
	renumber [line]         renumber program lines (and save)
	reset                   reset the MCU!
	save [name]             save code ram to flash memory

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
	accept(TOKENIZER_LOAD);
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
110   print \"blink\",i\n\
120   pin 13,1\n\
130   pause 100\n\
140   pin 13,0\n\
150   pause 100\n\
160 next i\n\
500 end\n\
1000 rem\n\
1001 rem --- setup subroutine\n\
1002 rem\n\
1010 setpin 13,0\n\
1100 return\n";

		// free memory if already allocated
		if (program)
		{
			pbasic_debug("clear memory");
			free(program);
		}
		// allocate memory to stock program
		program = (char *) malloc(1+strlen(myprogram)*sizeof(char));
		if (program != 0)
		{
			pbasic_debug("memory allocation succeed");
			strcpy(program, myprogram);
			//CDCprintf("\r\n%s\r\n", program);
			pbasic_debug("listing...\r\n%s", program);
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
void cmd_list(void)
{
	pbasic_debug("cmd_list()");
	accept(TOKENIZER_LIST);
	CDCprintf("\r\n%s\r\n", program);
}
/*---------------------------------------------------------------------------*/
void cmd_run(void)
{
	pbasic_debug("cmd_run()");
	accept(TOKENIZER_RUN);

	// reset
	for_stack_ptr = 0;
	gosub_stack_ptr = 0;
	ended = 0;
	program_ptr = program;
	tokenizer_init(program);
	
	do
	{
		if(tokenizer_finished())
		{
			pbasic_debug("basic program finished");
			return;
		}
		line_statement();
	} while(!pbasic_finished());
}
/*---------------------------------------------------------------------------*/
void cmd_debug(void)
{
	char buffer[MAX_STRINGLEN];

	pbasic_debug("cmd_debug()");
	accept(TOKENIZER_DEBUG);
	if(tokenizer_token() == TOKENIZER_ON)
	{
		debug = 1;
		pbasic_debug("debug mode activated ...");
	}
	else
	{
		debug = 0;
	}			
}
/*---------------------------------------------------------------------------*/
void cmd_edit(void)
{
	pbasic_debug("cmd_edit()");
	accept(TOKENIZER_EDIT);
}
/*---------------------------------------------------------------------------*/
void cmd_delete(void)
{
	pbasic_debug("cmd_delete()");
	accept(TOKENIZER_DELETE);
}
/*---------------------------------------------------------------------------*/
void cmd_help(void)
{
	pbasic_debug("cmd_help()");
	accept(TOKENIZER_HELP);
	/*
	help
	for more information:
	help about
	help commands
	help modes
	help statements
	help blocks
	help devices
	help expressions
	help strings
	help variables
	help pins
	help zigflea
	*/
}

#endif /* __COMMANDS_C__ */
