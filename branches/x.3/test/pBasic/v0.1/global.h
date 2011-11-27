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

//#ifndef __GLOBAL_H__
//#define __GLOBAL_H__

extern int debug;

extern char *program;
extern char *program_ptr;

//#define MAX_STRINGLEN 40
extern char string[MAX_STRINGLEN];

//#define MAX_VARNUM 26
extern char variables[MAX_VARNUM];

/*
extern struct for_state
{
  int line_after_for;
  int for_variable;
  int to;
};
*/

//#define MAX_FOR_STACK_DEPTH 4
extern int for_stack_ptr;
extern struct for_state for_stack[MAX_FOR_STACK_DEPTH];

//#define MAX_GOSUB_STACK_DEPTH 10
extern int gosub_stack[MAX_GOSUB_STACK_DEPTH];
extern int gosub_stack_ptr;

extern int ended;

//#endif /* __GLOBAL_H__ */
