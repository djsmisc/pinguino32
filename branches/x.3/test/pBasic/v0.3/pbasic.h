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

#ifndef __PBASIC_H__
#define __PBASIC_H__

#define VERSION 	"0.3"
#define AUTHOR		"Regis Blanchot"

#define YEAR		"2011"
#define DATE		"2011-08-31"
#define HEAP		8192

#define TITRE		"Pinguino BASIC v" VERSION
#define COPYRIGHT	YEAR SP AUTHOR
#define EMAIL		"rblanchot@gmail.com"
#define WEBSITE	"http://www.pinguino.cc"

#define RN			"\r\n"
#define SP			" "

// RB4P = Régis Basic For Pinguino

/*
#define ASCII1		" ___ _ _  ___ "
#define ASCII2		"| _ ) | || _ \\"
#define ASCII3		"| _ \\_  _|  _/"
#define ASCII4		"|___/ |_||_|  "
*/

#define ASCII1		"      ___   _   ___ ___ ___ "
#define ASCII2		" _ __| _ ) /_\\ / __|_ _/ __|"
#define ASCII3		"| '_ \\ _ \\/ _ \\\\__ \\| | (__ "
#define ASCII4		"| .__/___/_/ \\_\\___/___\\___|"
#define ASCII5		"|_|"

#define LINE1		ASCII1 RN
#define LINE2		ASCII2 SP COPYRIGHT RN
#define LINE3		ASCII3 SP EMAIL RN
#define LINE4		ASCII4 SP WEBSITE RN
#define LINE5		ASCII5 SP SP TITRE RN

#define MAX_STRINGLEN 40
#define MAX_VARNUM 26
#define MAX_FOR_STACK_DEPTH 4
#define MAX_GOSUB_STACK_DEPTH 10

#define ESC				27
#define DEL				51
#define ARROWUP		65
#define ARROWDOWN		66
#define ARROWLEFT		67
#define ARROWRIGHT	68
#define ARROWRIGHT	68

#include <stdarg.h>

void pbasic_init(void);
void pbasic(void);
void pbasic_get_key(void);
void pbasic_get_command(char *);
char * pbasic_get_line(char *);
char * pbasic_get_line_number(char *);
void pbasic_printf(const char *, va_list);
void pbasic_error(const char *, ...);
void pbasic_debug(const char *, ...);
void pbasic_exit(int num);
int pbasic_finished(void);
int pbasic_get_variable(int);
void pbasic_set_variable(int, int);
void pbasic_free(char *);
void pbasic_autorun(void);

void pbasic_accept(int);
int pbasic_varfactor(void);
int pbasic_factor(void);
int pbasic_term(void);
int pbasic_expr(void);
int pbasic_relation(void);
void pbasic_jump_linenum(int);
void pbasic_statement(void);
void pbasic_line_statement(void);

#endif /* __PBASIC_H__ */
