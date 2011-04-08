# ------------------------------------------------------------------------------
# Makefile / 32-bit Pinguino
# * Regis Blanchot <rblanchot@gmail.com> 
# * Marcus Fazzi <anunakin@ieee.org>
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# directories
# ------------------------------------------------------------------------------

SRCDIR		= $(HOME)/source
P32DIR		= $(HOME)/tools/p32
BINDIR		= $(P32DIR)/bin
INCDIR		= $(P32DIR)/include
LKRDIR		= $(P32DIR)/lkr
OBJDIR		= $(P32DIR)/obj/non-free

# ------------------------------------------------------------------------------
# commands
# ------------------------------------------------------------------------------

CC				= $(BINDIR)/mips-elf-g++
OBJC			= $(BINDIR)/mips-elf-objcopy
RM				= rm -f -v

# ------------------------------------------------------------------------------
# flags
# ------------------------------------------------------------------------------

CFLAGS		= -EL -march=24kc -x c++ -c\
					-lstdc++ -lm -lgcc -lc\
					-D__PIC32MX__ -D__$(PROC)__ -D $(BOARD)\
					-I$(INCDIR)/non-free\
					-I$(INCDIR)/pinguino\
					-I$(PDEDIR)

ELF_FLAGS	=	-EL -march=24kc -msoft-float\
					-lstdc++ -lm -lgcc -lc\
					-Wl,--defsym,_min_heap_size=8192\
					-D__PIC32MX__ -D__$(PROC)__ -D $(BOARD)\
					-I$(INCDIR)/non-free\
					-I$(INCDIR)/pinguino\
					-I$(PDEDIR)\
					-I$(SRCDIR)\
					-I$(OBJDIR)\
					-T$(LKRDIR)/elf32pic32mx.x

# ------------------------------------------------------------------------------
# rules
# ------------------------------------------------------------------------------

all: clean build link correct

clean:
		$(RM) $(SRCDIR)/main32.o
		$(RM) $(SRCDIR)/main32.elf
		$(RM) $(SRCDIR)/main32.hex
		$(RM) $(OBJDIR)/processor.o
		cp $(OBJDIR)/$(PROC).o $(P32DIR)/mips-elf/lib/processor.o

build:
		$(CC) $(CFLAGS) $(SRCDIR)/main32.c -o $(SRCDIR)/main32.o

link:
		$(CC) $(ELF_FLAGS) -o $(SRCDIR)/main32.elf $(SRCDIR)/main32.o $(OBJDIR)/crt0.S $(INCDIR)/non-free/p32xxxx.h $(P32DIR)/mips-elf/lib/processor.o
		$(OBJC) -O ihex $(SRCDIR)/main32.elf $(SRCDIR)/main32.hex

correct:
		#This remove wrong routine
		grep --binary --invert-match '^:040000059D006000FA' $(SRCDIR)/main32.hex > $(SRCDIR)/temp
		mv $(SRCDIR)/temp $(SRCDIR)/main32.hex      

