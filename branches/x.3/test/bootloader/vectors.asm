;                   - Dimax Israel Confidential and Proprietary -
;
;   Copyright (C) June 2000, Dimax Israel.  ALL RIGHTS RESERVED.
; 
;   Except as specifically permitted herein, no portion of the information,
;   including but not limited to object code and source code, may be reproduced,
;   modified, distributed, republished or otherwise exploited in any form or by
;   any means for any purpose without the prior written permission of Dimax 
;   Israel. Use of software subject to the terms and conditions
;   detailed in the file "LICENSE.txt".
; 
; 

;--------------------------------------------------------------------
;  $Id: vectors.asm,v 1.1.1.1 2006/02/16 17:37:44 mtvs12 Exp $
;--------------------------------------------------------------------
INCLUDE "p18cxxx.inc"
include "asm.inc"       ; Definitions imported from ./*.[ch] files

;-----------------------------------------------------------------------------
; Constants
;-----------------------------------------------------------------------------

;-----------------------------------------------------------------------------
; Externals
;-----------------------------------------------------------------------------
EXTERN  _stack      
EXTERN  main  
EXTERN  _zero
EXTERN bootloader_soft_reset

;-----------------------------------------------------------------------------
; START
;-----------------------------------------------------------------------------
VECTORS CODE 0x0000
        
        ;--- RESET Vector
        org     0x0000
        clrf    TBLPTRU
        clrf    _zero
        bra     _startup
        
        ;--- HIGH Interrupt Vector
        org     0x0008
        goto    APP_HIGH_INTERRUPT_VECTOR
        
_startup:        
        lfsr    FSR1,_stack                    
        lfsr    FSR2,_stack
        bra     main
        
        ;--- BOOTLOADER External Entry Point                         
        org     0x0016
 if USE_EEPROM_MARK 
        bra     bootloader_soft_reset
 endif        
        
        ;--- HIGH Interrupt Vector
        org     0x0018
        goto    APP_LOW_INTERRUPT_VECTOR
         
            
;-----------------------------------------------------------------------------
; APPLICATION STUB
;-----------------------------------------------------------------------------
APPSTRT CODE APP_RESET_VECTOR
        bra     $
                
        end
        
