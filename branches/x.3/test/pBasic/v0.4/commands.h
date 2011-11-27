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


#ifndef __COMMANDS_H__
#define __COMMANDS_H__

#define B_SIZE	10		// blocks of arbitrary length
#define ESC		27		// ASCII code for Escape Key

/*	TODO:

	cls                     clear terminal screen
	cont [line]             continue program from stop

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

//	dir                     list saved programs
void cmd_dir(void);
//	load name               load saved program
void cmd_load(void);
//	save [name]             save code ram to SD card
void cmd_save(void);
//	list ([line][-[line]]|subname) list program lines
void cmd_list(void);
//	run [line]              run program
void cmd_run(void);
// debug on|off				(de)activate debug mode
void cmd_debug(void);
//	memory                  print memory usage
void cmd_memory(void);
//	new                     erase code ram
void cmd_new(void);
//	reset                   reset the MCU!
void cmd_reset(void);
//	edit line               edit program line
void cmd_edit(void);
//	delete ([line][-[line]]|subname) delete program lines
void cmd_delete(void);
//	help [topic]            online help
void cmd_help(void);
/*---------------------------------------------------------------------------*/

#endif /* __COMMANDS_H__ */
