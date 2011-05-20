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

#CC				= $(BINDIR)/mips-elf-g++
CC				= $(BINDIR)/mips-elf-gcc
OBJC			= $(BINDIR)/mips-elf-objcopy
RM				= rm -f -v

# ------------------------------------------------------------------------------
# flags
# ------------------------------------------------------------------------------

CFLAGS		=	-x c -c\
					-O2 -EL -march=24kc\
					-lstdc++ -lm -lgcc -lc

ELF_FLAGS	=	-msoft-float\
					-Wl,--defsym,_min_heap_size=8192\
					-T$(LKRDIR)/elf32pic32mx.x

FLAGS			=	-O2 -EL -march=24kc\
					-lstdc++ -lm -lgcc -lc\
					-L$(OBJDIR)/usb/libcdc.a\
					-D__PIC32MX__ -D__$(PROC)__ -D $(BOARD)\
					-I$(INCDIR)/non-free\
					-I$(INCDIR)/pinguino\
					-I$(PDEDIR)\
					-I$(OBJDIR)

#					-I$(P32DIR)/bin/$(OSDIR)/mips-elf/include\
#					-I$(SRCDIR)\
#					-I$(OBJDIR)/usb

#.PHONY: depend clean
#.PHONY: clean

all: clean copy build link exec correct

clean:
	#----------------------------------------------------------------------------
	#	clean
	#----------------------------------------------------------------------------
	$(RM) $(SRCDIR)/main32.o
	$(RM) $(SRCDIR)/main32.elf
	$(RM) $(SRCDIR)/main32.hex
	$(RM) $(OBJDIR)/processor.o

copy:
	#----------------------------------------------------------------------------
	#	copy
	#----------------------------------------------------------------------------
	cp $(OBJDIR)/$(PROC).o $(P32DIR)/bin/$(OSDIR)/mips-elf/lib/processor.o

build:
	#----------------------------------------------------------------------------
	#	build
	#----------------------------------------------------------------------------
	cd $(SRCDIR);\
	$(CC) $(CFLAGS) $(FLAGS) main32.c -o main32.o

link:
	#----------------------------------------------------------------------------
	#	link
	#----------------------------------------------------------------------------
	cd $(SRCDIR);\
	$(CC) $(ELF_FLAGS) $(FLAGS) -o main32.elf main32.o\
		$(OBJDIR)/usb/libcdc.a\
		$(OBJDIR)/crt0.S\
		ISRwrapper.S\
		$(INCDIR)/non-free/p32xxxx.h\
		$(P32DIR)/bin/$(OSDIR)/mips-elf/lib/processor.o

exec:
	#----------------------------------------------------------------------------
	#	exec
	#----------------------------------------------------------------------------
	$(OBJC) -O ihex $(SRCDIR)/main32.elf $(SRCDIR)/main32.hex

correct:
	#----------------------------------------------------------------------------
	#	correct
	#----------------------------------------------------------------------------
	grep --binary --invert-match '^:040000059D006000FA' $(SRCDIR)/main32.hex > $(SRCDIR)/temp
	mv $(SRCDIR)/temp $(SRCDIR)/main32.hex      

