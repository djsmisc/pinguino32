/* Default linker script                                                */
/* for Pinguino 32MX220F032D board and Pinguino bootloader              */
/* 10-04-2013 Régis Blanchot <rblanchot@gmail.com>                      */

/*************************************************************************
 * Processor-specific object file.  Contains SFR definitions.
 *************************************************************************/
INPUT("processor.o")

/*************************************************************************
 * For interrupt vector handling
 *************************************************************************/
PROVIDE(_vector_spacing = 0x00000001);

/* ebase must be on the 4K boundary matching exception_mem definition */
_ebase_address           = 0x9D001000;

/*************************************************************************
 * Memory Address Equates
 * _RESET_ADDR      -- Reset Vector
 * _BEV_EXCPT_ADDR  -- Boot exception Vector
 * _GEN_EXCPT_ADDR  -- General Exception Vector
 *************************************************************************/
_RESET_ADDR              = 0xBFC00000;      /* Boot Flash start in KSEG1 */
_BEV_EXCPT_ADDR          = 0xBFC00380;
_GEN_EXCPT_ADDR          = _ebase_address + 0x180;

/*************************************************************************
 * Memory Regions
 *
 * Memory regions without attributes cannot be used for orphaned sections.
 * Only sections specifically assigned to these regions can be allocated
 * into these regions.
 * Boot Flash is divided into several regions as
    - kseg1_boot_mem containing reset vector, bootstrap exception handler, debug exception handler (non-cacheable) 
    - kseg0_boot_mem containing C startup module (cacheable) 
    - exception_mem containing interrupt vector table starting at ebase (cacheable) 
    - debug_exec_mem containing debug supporting code for running ICD3/RealICE during a debug session (non-cacheable) 
    - configuration words (non-cacheable) 
 *************************************************************************/
MEMORY 
{
    /* RAM */
    kseg0_data_mem        (rw!x): ORIGIN = 0x80000000, LENGTH = 8k

    /* FLASH */
    kseg0_program_mem     (rx)  : ORIGIN = 0x9D003000, LENGTH = 32k-12k

    /* VECTORS */ 
    exception_mem        (rx)  : ORIGIN = 0x9D000000, LENGTH = 0x2000

    /* STARTUP */ 
    kseg0_boot_mem       (rx)  : ORIGIN = 0x9FC00000, LENGTH = 3k-16
    kseg1_boot_mem       (rx)  : ORIGIN = 0xBFC00000, LENGTH = 0x490

    /* RAM in KSEG1 */
    kseg1_data_mem       (w!x) : ORIGIN = 0xA0000000, LENGTH = 8k

    /* SFRs */
    /*sfrs                       : ORIGIN = 0xBF800000, LENGTH = 0x100000*/

    /* Device Configuration Registers */
    configsfrs                 : ORIGIN = 0xBFC00BF0, LENGTH = 0x10
    config3                    : ORIGIN = 0xBFC00BF0, LENGTH = 0x4
    config2                    : ORIGIN = 0xBFC00BF4, LENGTH = 0x4
    config1                    : ORIGIN = 0xBFC00BF8, LENGTH = 0x4
    config0                    : ORIGIN = 0xBFC00BFC, LENGTH = 0x4
}
 
/*************************************************************************
 * Configuration-word sections
 *************************************************************************/
SECTIONS
{
  .config_BFC00BF0 : {
    KEEP(*(.config_BFC00BF0))
  } > config3
  .config_BFC00BF4 : {
    KEEP(*(.config_BFC00BF4))
  } > config2
  .config_BFC00BF8 : {
    KEEP(*(.config_BFC00BF8))
  } > config1
  .config_BFC00BFC : {
    KEEP(*(.config_BFC00BFC))
  } > config0
}
