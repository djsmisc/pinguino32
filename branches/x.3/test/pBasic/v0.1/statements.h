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


#ifndef __STATEMENTS_H__
#define __STATEMENTS_H__

/*
	Quick Reference
	
	TODO:
	<Ctrl-C>                stop running program
	assert expression                break if expression is false
	data n [, ...]                   read-only data
	dim variable[$][[n]] [as ...], ... dimension variables
	end                              end program
	halt                             loop forever
	input [dec|hex|raw] variable[$], ... input data
	label label                      read/data label
	lcd pos, [dec|hex|raw] expression, ... * display results on lcd
	let variable[$] = expression, ... assign variable
	print [dec|hex|raw] expression, ... print strings/expressions
	read variable [, ...]            read data into variables
	restore [label]                  restore data pointer
	stop                             insert breakpoint in code
	vprint var[$] = [dec|hex|raw] expr, ... print to variable

	digital pin,state / analog pin / pin pin /
*/

//	sleep expression (s|ms|us)       delay program execution
void pause_statement(void);
void setpin_statement(void);
void pin_statement(void);
void toggle_statement(void);
//	rem remark                       remark
void rem_statement(void);
void print_statement(void);
void let_statement(void);
void end_statement(void);

#endif /* __STATEMENTS_H__ */
