/*******************************************************************************
	Title:	USB Pinguino Bootloader
	File:	vectors.c
	Descr.: move interrupt vectors
	Author:	Régis Blanchot <rblanchot@gmail.com>

	This file is part of Pinguino (http://www.pinguino.cc)
	Released under the LGPL license (http://www.gnu.org/licenses/lgpl.html)
*******************************************************************************/

// Never use --ivt-loc=$(ENTRY) to do the job
// as it will also move the Reset vector from 0 to ENTRY

/*
extern void main(void);

// 0x0000
void reset_isr(void) __naked __interrupt 0
{
    main();
}
*/

// 0x0008
void high_priority_isr(void) __naked __interrupt 1
{
    __asm
    goto	ENTRY + 0x08
    __endasm;
}

// 0x0018
void low_priority_isr(void) __naked __interrupt 2
{
    __asm
    goto	ENTRY + 0x18
    __endasm;
}
