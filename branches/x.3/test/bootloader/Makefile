###############################################################################
# Config
###############################################################################

# By default Optimization enabled
# Shell command 'export OPTIMIZE=0' will disable optimization 
ifndef OPTIMIZE
 	OPTIMIZE:=1
endif

# By default extended instruction set enabled
# Shell command 'export EXTENDED=0' will disable extended instruction set
ifndef EXTENDED
 	EXTENDED:=1
endif

PROG    := ../../utils/picp.exe

### XTEA KEY
ifndef XTEA_KEY
	XTEA_KEY := "0123456789ABCDEF"
endif	


###############################################################################
# Microchip CPU Type
###############################################################################
MCU     := 18F4455
ifeq ($(EXTENDED),1)
	CMDFILE := 18f4455_e.lkr
else
	CMDFILE := 18f4455.lkr 
endif	


###############################################################################
# Compiler
###############################################################################

# Ccmpiler Package Directory
ifndef COMPILER_DIR
 COMPILER_DIR    := c:/mcc18/bin
endif
ifndef PIC_ASM_DIR
 PIC_ASM_DIR 	:= 'c:/Program Files/Microchip/MPASM Suite'
endif 

# C Compiler and Linker Executable
CC      := $(COMPILER_DIR)/mcc18.exe
ASM	:= $(PIC_ASM_DIR)/mpasmwin.exe
LINKER  := $(COMPILER_DIR)/mplink.exe


###############################################################################
# Inc && Lib 
###############################################################################
INC_DIR     := -I=$(COMPILER_DIR)/../h
LIB_DIR     := $(COMPILER_DIR)/../lib
LIB         := 


###############################################################################
# Compiler Flags 
###############################################################################

# without optimization
CFLAGS  := -p=$(MCU) $(INC_DIR)  
ASMFLAGS := /q+ /c+ /p$(MCU)

ifeq ($(OPTIMIZE),1)
	CFLAGS+= 
else
	CFLAGS+= -Ou- -Ot- -Ob- -On- -Ow- -Os- -Op- -Or- -Od- -Opa-
endif	


ifeq ($(EXTENDED),1)
	CFLAGS+= --extended
	ASMFLAGS+= /y+
endif

### Add more compiler flags here
#CFLAGS+= 


###############################################################################
# Linker Flags 
###############################################################################
LFLAGS  := $(CMDFILE) /l$(LIB_DIR) 

### Add more linker flags here
#LFLAGS+= 


###############################################################################
# Common rules
###############################################################################
OBJ_DIR := _output

$(OBJ_DIR)/%.o:	%.c  
	mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -fo=$@ $<

$(OBJ_DIR)/%.o:	%.asm asm.inc xtea_key.inc	
ifeq ($(findstring sh, $(SHELL)),sh)
	if ! $(ASM) $(ASMFLAGS) /l$(OBJ_DIR)/$*.lst /e$(OBJ_DIR)/$*.err /o$@ $<;then\
		cat $(OBJ_DIR)/$*.err | sed -n 's/\(Error\[[0-9]\+]\) \+//p';\
	exit 1 ; fi 
else
	$(ASM) $(ASMFLAGS) /l$(OBJ_DIR)/$*.lst /e$(OBJ_DIR)/$*.err /o$@ $< 
endif

%.hex:
	$(LINKER) $(LFLAGS) $^ /m$(@:.hex=.map) /o$@
	@ cat $(@:.hex=.map) | grep --after-context=5 'Program Memory Usage'


###############################################################################
# Target Builds
# 
###############################################################################

# Target boot
BOOT_OBJ := boot.o usb_desc.o xtea.o vectors.o boot_asm.o
$(OBJ_DIR)/boot.hex: $(BOOT_OBJ:%.o=$(OBJ_DIR)/%.o)


###############################################################################
# Main Targets
# 
###############################################################################
all: $(OBJ_DIR)/boot.hex

asm.inc:
	perl asm_inc.pl *.[ch] > asm.inc
	
xtea_key.inc:
	echo -e "XTEA_KEY db \"$(XTEA_KEY)\"\r" > xtea_key.inc	 

# Generate ctags file for VI
ctags:
	find -iname "*.[ch]" | xargs ctags -dt --members --globals
	ctags -a -dt --members --globals $(COMPILER_DIR)/../h/p18f4455.h

clean:
	rm -f *.o *.hex *.map *.cod *.lst *.out *.err asm.inc xtea_key.inc
	rm -rf $(OBJ_DIR)

prog:
	$(PROG) /dev/ttyS0 $(MCU) -wc \
            0x0e20 0x1e38 0x8300 0x0080 0xc00f 0xe00f 0x400f


