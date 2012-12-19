;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.2.1 #8163 (Oct 23 2012) (Linux)
; This file was generated Tue Dec 18 18:50:52 2012
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f25k50
	radix	dec


;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global	_high_priority_isr
	global	_low_priority_isr

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; ; Starting pCode block
S_vectors__high_priority_isr	code	0X000008
_high_priority_isr:
	goto 0x0C00 + 0x08
	
; ; Starting pCode block
S_vectors__low_priority_isr	code	0X000018
_low_priority_isr:
	goto 0x0C00 + 0x18
	
; I code from now on!


; Statistics:
; code size:	    8 (0x0008) bytes ( 0.01%)
;           	    4 (0x0004) words
; udata size:	    0 (0x0000) bytes ( 0.00%)
; access size:	    0 (0x0000) bytes


	end
