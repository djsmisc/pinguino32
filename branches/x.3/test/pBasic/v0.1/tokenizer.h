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

#ifndef __TOKENIZER_H__
#define __TOKENIZER_H__

enum {
	TOKENIZER_ERROR,
	TOKENIZER_ENDOFINPUT,
	TOKENIZER_NUMBER,
	TOKENIZER_STRING,
	TOKENIZER_VARIABLE,
	TOKENIZER_LET,
	TOKENIZER_PRINT,
	TOKENIZER_IF,
	TOKENIZER_THEN,
	TOKENIZER_ELSE,
	TOKENIZER_FOR,
	TOKENIZER_TO,
	TOKENIZER_NEXT,
	TOKENIZER_GOTO,
	TOKENIZER_GOSUB,
	TOKENIZER_RETURN,
	TOKENIZER_CALL,
	TOKENIZER_END,
	TOKENIZER_COMMA,
	TOKENIZER_SEMICOLON,
	TOKENIZER_PLUS,
	TOKENIZER_MINUS,
	TOKENIZER_AND,
	TOKENIZER_OR,
	TOKENIZER_ASTR,
	TOKENIZER_SLASH,
	TOKENIZER_MOD,
	TOKENIZER_LEFTPAREN,
	TOKENIZER_RIGHTPAREN,
	TOKENIZER_LT,
	TOKENIZER_GT,
	TOKENIZER_EQ,
	TOKENIZER_CR,
	TOKENIZER_PAUSE,
	TOKENIZER_SETPIN,
	TOKENIZER_PIN,
	TOKENIZER_TOGGLE,
	TOKENIZER_RUN,
	TOKENIZER_LOAD,
	TOKENIZER_LIST,
	TOKENIZER_DEBUG,
	TOKENIZER_EDIT,
	TOKENIZER_DELETE,
	TOKENIZER_REM,
	TOKENIZER_HELP,
	TOKENIZER_ON,
	TOKENIZER_OFF
};

void tokenizer_init(const char *);
void tokenizer_next(void);
int tokenizer_token(void);
int tokenizer_num(void);
int tokenizer_variable_num(void);
void tokenizer_string(char *, int);
int tokenizer_finished(void);
void tokenizer_error_print(void);

#endif /* __TOKENIZER_H__ */
