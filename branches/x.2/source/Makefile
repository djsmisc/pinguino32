# ------------------------------------------------------------------------------
# Makefile / 32-bit Pinguino
# * Regis Blanchot <rblanchot@gmail.com> 
# * [PDEDIR] Marcus Fazzi <anunakin@ieee.org>
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# rules
#.c:
#	$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS)
#.c.o:
#	$(CC) $(CFLAGS) -c $<

#	$@ 	Le nom de la cible
#	$< 	Le nom de la première dépendance
#	$^ 	La liste des dépendances
#	$? 	La liste des dépendances plus récentes que la cible
#	$* 	Le nom du fichier sans suffixe
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# directories
# ------------------------------------------------------------------------------
# HOME, OSDIR, PDEDIR, PROC & BOARD are defined in pinguinobetax.py

SRCDIR		= $(HOME)/source
P32DIR		= $(HOME)/tools/p32
BINDIR		= $(P32DIR)/bin/$(OSDIR)/bin
INCDIR		= $(P32DIR)/include
LKRDIR		= $(P32DIR)/lkr
OBJDIR		= $(P32DIR)/obj/non-free

# ------------------------------------------------------------------------------
# commands
# ------------------------------------------------------------------------------

CC				= $(BINDIR)/mips-elf-g++
OBJC			= $(BINDIR)/mips-elf-objcopy
RM				= @rm -f -v

# ------------------------------------------------------------------------------
# flags
# ------------------------------------------------------------------------------

CFLAGS		=	-Wall -O2\
					-EL -march=24kc -x c++ -c\
					-lstdc++ -lm -lgcc -lc\
					-D__PIC32MX__ -D__$(PROC)__ -D $(BOARD)\
					-I$(INCDIR)/non-free\
					-I$(INCDIR)/pinguino\
					-I$(PDEDIR)\
					-I$(SRCDIR)\
					-I$(OBJDIR)

ELF_FLAGS	=	-O2\
					-EL -march=24kc -msoft-float\
					-lstdc++ -lm -lgcc -lc\
					-Wl,--defsym,_min_heap_size=8192\
					-D__PIC32MX__ -D__$(PROC)__ -D $(BOARD)\
					-I$(INCDIR)/non-free\
					-I$(INCDIR)/pinguino\
					-I$(PDEDIR)\
					-I$(SRCDIR)\
					-I$(OBJDIR)\
					-T$(LKRDIR)/elf32pic32mx.x

#.PHONY: depend clean
.PHONY: clean

all: build link exec correct

clean:
	$(RM) $(SRCDIR)/main32.o
	$(RM) $(SRCDIR)/main32.elf
	$(RM) $(SRCDIR)/main32.hex
	$(RM) $(OBJDIR)/processor.o
	cp $(OBJDIR)/$(PROC).o $(P32DIR)/bin/$(OSDIR)/mips-elf/lib/processor.o

build:
	$(CC) $(CFLAGS) $(SRCDIR)/main32.c -o $(SRCDIR)/main32.o

link:
	$(CC) $(ELF_FLAGS) -o $(SRCDIR)/main32.elf $(SRCDIR)/main32.o $(OBJDIR)/crt0.S $(INCDIR)/non-free/p32xxxx.h $(P32DIR)/bin/$(OSDIR)/mips-elf/lib/processor.o

exec:
	$(OBJC) -O ihex $(SRCDIR)/main32.elf $(SRCDIR)/main32.hex

correct:
	#This remove wrong routine
	@grep --binary --invert-match '^:040000059D006000FA' $(SRCDIR)/main32.hex > $(SRCDIR)/temp
	@mv $(SRCDIR)/temp $(SRCDIR)/main32.hex      

