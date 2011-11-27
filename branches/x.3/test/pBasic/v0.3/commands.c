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
#include <ctype.h>      // tolower ...

#include <system.c>
#include <digitalw.c>
#include <delay.c>
#include <sd/fileio.c>

#include "global.h"
//#include "pbasic.c"
#include "commands.h"
#include "tokenizer.c"

/*	TODO:

	cls                     clear terminal screen
	cont [line]             continue program from stop
	renumber [line]         renumber program lines (and save)

*/

/*---------------------------------------------------------------------------*/
char * pbasic_tolower(char *s)
{
	char index;

	for (index= 0; s[index] != '\0'; index++) 
		s[index] = tolower(s[index]);
/*
	while (*s)
	{
		*s = tolower(*s);
		*s++;
	}
*/
	return s;
}
/*---------------------------------------------------------------------------*/
void cmd_dir(void)
{
	#define MAXFILE 32

	char i, found;
	const char ext[]="BAS";
	DIRTABLE list[MAXFILE];

	//char listname[MAXFILE*8];
	//long listsize[MAXFILE];

	pbasic_debug("cmd_dir()");
	pbasic_accept(TOKENIZER_DIR);

	if (mount(PB_SDCS)) // to access the FAT16 file system on the card
	{
		pbasic_debug("cmd_dir(): SD successfully mounted");
		//found = listTYPE(listname, listsize, MAXFILE, ext);
		found = listTYPE(list, MAXFILE, ext);
		if (found == 0)
		{
			switch (FError)
			{
				case FE_MEDIA_NOT_MNTD:
					pbasic_error("mount failed!");
					break;
				case FE_MALLOC_FAILED:
					pbasic_error("memory allocation failed!");
					break;
				case FE_FIND_ERROR:
					pbasic_error("failure during file search!");
					break;
				default:// no error
					CDCprintf("no file found\r\n");
					break;
			}
		}
		else
		{
			CDCprintf("%-8s %-8s %-8s \r\n", "name", "ext", "bytes");
			CDCprintf("-----------------------\r\n");
			for (i=0; i<found; i++)
				CDCprintf("%-8s %-8s %-8d \r\n", pbasic_tolower(list[i].filename),\
														 	pbasic_tolower(list[i].ext),\
														 	list[i].size);
/*
				CDCprintf("%-8s %-8s %-8d \r\n", pbasic_tolower(&list[i]->filename),\
														 	pbasic_tolower(&list[i]->ext),\
														 	list[i]->size);
				CDCprintf("%d\r\n", list[i].size);
				CDCprintf("%-8s %-3s %d \r\n", pbasic_tolower(&listname[i*8]),
														 pbasic_tolower(ext),
														 listsize[i]);
*/
			if (found == 1)
				CDCprintf("found 1 file\r\n");
			else
				CDCprintf("found %d files\r\n", found);
		}
		unmount();
	}
	else
	{
		pbasic_error("mount failed!");
		pbasic_debug("cmd_dir(): error %d", FError);
	}
}
/*---------------------------------------------------------------------------*/
void cmd_load(void)
{
	MFILE *fs;
	char data[B_SIZE];
	unsigned r;
	int i, b, l;

	pbasic_debug("cmd_load()");
	pbasic_accept(TOKENIZER_LOAD);

	if(tokenizer_token() == TOKENIZER_STRING)
	{
		tokenizer_string(filename, sizeof(filename));
		pbasic_debug("cmd_load(): file name is %s", filename);
		if (mount(PB_SDCS))
		{
			pbasic_debug("cmd_load(): SD successfully mounted");

			// *** 1st pass : read program and allocate memory

			pbasic_debug("cmd_load(): reading (1st pass) ...");
			if (( fs = fopenM(filename, "r") ))
			{
				b = 0; // byte 
				do {
					r = freadM(fs, data, B_SIZE);
					b += r;
				} while(r == B_SIZE);
				mem = b;
				pbasic_debug("cmd_load(): %d bytes read", mem);
				fcloseM(fs);

				// free memory if already allocated
				pbasic_free(program);

				// allocate memory to stock program
				program = (char *) malloc(1 + mem * sizeof(char));
				if (program != 0)
				{
					pbasic_debug("cmd_load(): memory allocation succeed");
				}
				else
				{
					pbasic_error("out of memory");
					return;
				}

				// *** 2nd pass : copy program in memory

				pbasic_debug("cmd_load(): reading (2nd pass) ...");
				fs = fopenM(filename, "r");
				b = 0; // byte counter 
				l = 0; // line counter
				do {
					r = freadM(fs, data, B_SIZE);
					for(i = 0; i < r; i++)
					{
						if (data[i] == '\n')
							l++;
						program[b] = data[i];
						b++;
					}
				} while(r == B_SIZE);
				program[b-1] = '\0';
				program[b+0] = '\0';
				program[b+1] = '\0';
				fcloseM(fs);
				CDCprintf("read %d lines, %d bytes\r\n", l, b);
				pbasic_debug("cmd_load(): file closed");
			}
			else
			{
				pbasic_error("file not found!");
			}
			unmount();
		} // mounted
		else
		{
			pbasic_error("mount failed!");
			pbasic_debug("cmd_load(): error %d", FError);
		}
	}
	else
	{
		pbasic_error("syntax is 'load \"filename.bas\"'");
	}
}
/*---------------------------------------------------------------------------*/
void cmd_save(void)
{
	MFILE *fd;
	unsigned c, i, p, r;
	
	pbasic_debug("cmd_save()");
	pbasic_accept(TOKENIZER_SAVE);

	// check if there is a program in memory
	if (program == 0)
	{
		pbasic_error("no program to save.");
		return;
	}
		
	// check if filename has been given
	//	else it will use the name of the loaded program 

	if(tokenizer_token() == TOKENIZER_STRING)
		tokenizer_string(filename, sizeof(filename));
		
	pbasic_debug("cmd_save(): file name is %s\n\r", filename);

	if (mount(PB_SDCS))
	{
		if ((fd = fopenM(string, "w")))
		{
			c = 0;              // init byte counter
			p = 0;              // init progress index
			i = fd->size/16;    // progress bar increment
			CDCprintf("writing");
			do {
				r = fwriteM(fd, program, B_SIZE);
				// update progress bar
				c += r;
				while (p < c/i)
				{
					p++;
					CDCprintf(".");  // add one bar
				}
			} while (r == B_SIZE);
			r = fcloseM(fd);
			if (r == TRUE)
				CDCprintf("copied %d bytes\r\n", c);
			else
				pbasic_error("closing file");
		} // open file
		else
			pbasic_error("creating file.");
	} // mount
	else
	{
		pbasic_error("SD mount failed.");
	}
	unmount();
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
