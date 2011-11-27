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

#ifndef __PBASIC_H__
#define __PBASIC_H__

#define VERSION 	"0.1"
#define YEAR		"2011"

#define TITRE		"Pinguino BASIC v" VERSION "\r\n"
#define COPYRIGHT	YEAR " Regis Blanchot\r\n"
#define EMAIL		"<rblanchot@gmail.com>\r\n"
#define WEBSITE	"http://www.pinguino.cc\r\n"

#define MAX_STRINGLEN 40
#define MAX_VARNUM 26
#define MAX_FOR_STACK_DEPTH 4
#define MAX_GOSUB_STACK_DEPTH 10

#include <stdarg.h>

void pbasic_init(void);
void pbasic(void);
void pbasic_get_command(char *);
void pbasic_printf(const char *, va_list);
void pbasic_error(const char *, ...);
void pbasic_debug(const char *, ...);
void pbasic_exit(int num);
int pbasic_finished(void);
int pbasic_get_variable(int);
void pbasic_set_variable(int, int);

void accept(int);
int varfactor(void);
int factor(void);
int term(void);
int expr(void);
int relation(void);
void jump_linenum(int);
void statement(void);
void line_statement(void);

#endif /* __PBASIC_H__ */
