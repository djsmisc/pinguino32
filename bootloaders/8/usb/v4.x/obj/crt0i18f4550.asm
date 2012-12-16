;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.2.1 #8163 (Oct 23 2012) (Linux)
; This file was generated Sat Dec 15 16:08:57 2012
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f4550
	radix	dec


;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global	___uflags
	global	__entry
	global	__startup
	global	__do_cinit

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern	_stack_end
	extern	_TBLPTRU
	extern	_TBLPTRH
	extern	_TBLPTRL
	extern	_FSR0L
	extern	_FSR0H
	extern	_TABLAT
	extern	_POSTINC0
	extern	_pinguino_main
	extern	_cinit


	idata
___uflags	db	0x00

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; ; Starting pCode block
S_crt0iPinguino___entry	code	0X000C00
__entry:
	goto __startup
	
; I code from now on!
; ; Starting pCode block
S_crt0iPinguino___do_cinit	code
__do_cinit:
	; TBLPTR = &cinit
	movlw low(_cinit)
	movwf _TBLPTRL, 0
	movlw high(_cinit)
	movwf _TBLPTRH, 0
	movlw upper(_cinit)
	movwf _TBLPTRU, 0
	; 0x05 = cinit.num_init
	tblrd*+
	movf _TABLAT, w, 0
	movwf 0x05, 0
	tblrd*+
	movf _TABLAT, w, 0
	movwf 0x05 + 1, 0
	; while (0x05)
	movf 0x05, w, 0
test:
	bnz cont1
	movf 0x05 + 1, w, 0
	bz done
cont1:
	; Count down so we only have to look up the data in _cinit once.
	; At this point we know that TBLPTR points to the top of the current
	; entry in _cinit, so we can just start reading the from, to, and
	; size values.
	; read the source address low
	tblrd*+
	movf _TABLAT, w, 0
	movwf 0x00, 0
	; source address high
	tblrd*+
	movf _TABLAT, w, 0
	movwf 0x00 + 1, 0
	; source address upper
	tblrd*+
	movf _TABLAT, w, 0
	movwf 0x00 + 2, 0
	; skip 0 byte since it is stored as 0 32bit int
	tblrd*+
	; read the destination address directly into FSR0
	; destination address low
	tblrd*+
	movf _TABLAT, w, 0
	movwf _FSR0L, 0
	; destination address high
	tblrd*+
	movf _TABLAT, w, 0
	movwf _FSR0H, 0
	; skip two bytes since it is stored as 0 32bit int
	tblrd*+
	tblrd*+
	; read the size of data to transfer to destination address
	tblrd*+
	movf _TABLAT, w, 0
	movwf 0x03, 0
	tblrd*+
	movf _TABLAT, w, 0
	movwf 0x03 + 1, 0
	; skip two bytes since it is stored as 0 32bit int
	tblrd*+
	tblrd*+
	; 0x00 = 0x07 ->from;
	; FSR0 = 0x07 ->to;
	; 0x03 = (unsigned short) 0x07 ->size;
	; the table pointer now points to the next entry. Save it
	; off since we will be using the table pointer to do the copying
	; for the entry
	; 0x07 = TBLPTR
	movff _TBLPTRL, 0x07
	movff _TBLPTRH, 0x07 + 1
	movff _TBLPTRU, 0x07 + 2
	; now assign the source address to the table pointer
	; TBLPTR = 0x00
	movff 0x00, _TBLPTRL
	movff 0x00 + 1, _TBLPTRH
	movff 0x00 + 2, _TBLPTRU
	; while (0x03)
	movf 0x03, w, 0
copy_loop:
	bnz copy_one_byte
	movf 0x03 + 1, w, 0
	bz done_copying
copy_one_byte:
	tblrd*+
	movf _TABLAT, w, 0
	movwf _POSTINC0, 0
	; decrement byte counter
	decf 0x03, f, 0
	bc copy_loop
	decf 0x03 + 1, f, 0
	bra copy_one_byte
done_copying:
	; restore the table pointer for the next entry
	; TBLPTR = 0x07
	movff 0x07, _TBLPTRL
	movff 0x07 + 1, _TBLPTRH
	movff 0x07 + 2, _TBLPTRU
	; decrement entry counter
	decf 0x05, f, 0
	bc test
	decf 0x05 + 1, f, 0
	bra cont1
	; emit done label
done:
	return
	
; ; Starting pCode block
S_crt0iPinguino___startup	code
__startup:
	; Initialize the stack pointer
	lfsr 1, _stack_end
	lfsr 2, _stack_end
	; 1st silicon does not do this on POR
	clrf _TBLPTRU, 0
	; Initialize the flash memory access configuration.
	; This is harmless for non-flash devices, so we do it on all parts.
	;#if defined(__18f2550) || defined(1) || 
	; defined(__18f25k50) || defined(__18f45k50)
	bsf 0xa6, 7, 0 ; EECON1.EEPGD = 1, Access Flash program memory, not EEPROM memory
	bcf 0xa6, 6, 0 ; EECON1.CFGS = 0, Access Flash program or data EEPROM memory, not Configuration registers
	;#elif defined(__18f26j50) || defined(__18f46j50)
	;bsf 0xa6, 2, 0 ; EECON1.WREN = 1; enable write to memory
	;bsf 0xa6, 1, 0 ; EECON1.WR = 1; Initiates 0 program memory erase cycle or write cycle
	;#endif
	
;	.line	118; obj/crt0iPinguino.c	_do_cinit ();
	CALL	__do_cinit
;	.line	121; obj/crt0iPinguino.c	pinguino_main ();
	CALL	_pinguino_main


; Statistics:
; code size:	  256 (0x0100) bytes ( 0.20%)
;           	  128 (0x0080) words
; udata size:	    0 (0x0000) bytes ( 0.00%)
; access size:	    0 (0x0000) bytes


	end
