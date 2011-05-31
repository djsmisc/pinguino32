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
P32DIR		= $(HOME)/p32
#BINDIR		= $(P32DIR)/bin/$(OSDIR)/bin
P32CORE		= $(HOME)/$(OSDIR)/p32
BINDIR		= $(P32CORE)/bin
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

CFLAGS		=	-O2 -EL -march=24kc\
					-c\
					-x c
#					-pedantic -Wall\
#					-x c++
#					-std=c99 

ELF_FLAGS	=	-O2 -EL -march=24kc\
					-msoft-float\
					-Wl,--defsym,_min_heap_size=8192\
					-Wl,-Map=output.map\
					-T$(LKRDIR)/elf32pic32mx.x

FLAGS			=	-D __PIC32MX__ -D __$(PROC)__ -D $(BOARD)\
					-I$(INCDIR)/non-free\
					-I$(INCDIR)/pinguino/libc\
					-I$(INCDIR)/pinguino/basics\
					-I$(INCDIR)/pinguino/libraries\
					-I$(PDEDIR)\
					-I$(OBJDIR)\
					-L$(OBJDIR)/usb/libcdc.a\
					-lm -lgcc -lc
#					-lstdc++ -lm -lgcc -lc

#					-I$(P32DIR)/bin/$(OSDIR)/mips-elf/include\
#					-I$(SRCDIR)\
#					-I$(OBJDIR)/usb

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
	#cp $(OBJDIR)/$(PROC).o $(P32DIR)/bin/$(OSDIR)/mips-elf/lib/processor.o
	cp $(OBJDIR)/$(PROC).o $(P32CORE)/mips-elf/lib/processor.o

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
		$(LKRDIR)/ISRwrapper.S\
		$(INCDIR)/non-free/p32xxxx.h\
		$(P32CORE)/mips-elf/lib/processor.o
#		$(P32DIR)/bin/$(OSDIR)/mips-elf/lib/processor.o

exec:
	#----------------------------------------------------------------------------
	#	exec
	#----------------------------------------------------------------------------
	cd $(SRCDIR);\
	$(OBJC) -O ihex main32.elf main32.hex

correct:
	#----------------------------------------------------------------------------
	#	correct
	#----------------------------------------------------------------------------
	grep --binary --invert-match '^:040000059D006000FA' $(SRCDIR)/main32.hex > $(SRCDIR)/temp
	mv $(SRCDIR)/temp $(SRCDIR)/main32.hex      

