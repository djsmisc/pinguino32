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

SRCDIR		=	$(HOME)/source
P32DIR		=	$(HOME)/p32
P32CORE		=	$(HOME)/$(OSDIR)/p32
BINDIR		=	$(P32CORE)/bin
INCDIR		=	$(P32DIR)/include
LKRDIR		=	$(P32DIR)/lkr
OBJDIR		=	$(P32DIR)/obj/non-free

INCLUDEDIRS	=	-I$(INCDIR)/non-free\
					-I$(INCDIR)/pinguino/basics\
					-I$(INCDIR)/pinguino/libc\
					-I$(INCDIR)/pinguino/libraries\
					-I$(PDEDIR)\
					-I$(OBJDIR)
#					-I$(P32DIR)/bin/$(OSDIR)/mips-elf/include\
#					-I$(SRCDIR)\
#					-I$(OBJDIR)/usb

LIBDIRS		=	-L$(OBJDIR)/usb/libcdc.a

# ------------------------------------------------------------------------------
# commands
# ------------------------------------------------------------------------------

CC				=	$(BINDIR)/mips-elf-gcc
LIBS			=	-lm -lgcc -lc
#CC				=	$(BINDIR)/mips-elf-g++
#LIBS			=	-lstdc++ -lm -lgcc -lc
OBJC			=	$(BINDIR)/mips-elf-objcopy
RM				=	rm -f -v

# ------------------------------------------------------------------------------
# flags
# ------------------------------------------------------------------------------

#					-O2 -EL -march=24kc\
#					-c\
#					-x c++
#					-x c
#					-pedantic -Wall\
#					-std=c99 

CFLAGS		=	$(INCLUDEDIRS)

LDFLAGS		=	$(LIBDIRS) $(LIBS)

ELF_FLAGS	=	-O2 -EL -march=24kc\
					-msoft-float\
					-Wl,--defsym,_min_heap_size=8192\
					-Wl,-Map=output.map\
					-D __PIC32MX__ -D __$(PROC)__ -D $(BOARD)\
					-T$(LKRDIR)/elf32pic32mx.x

#-------------------------------------------------------------------------------
#	rules
#-------------------------------------------------------------------------------

all: clean copy link exec correct

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
	cp $(OBJDIR)/$(PROC).o $(P32CORE)/mips-elf/lib/processor.o

link:
	#----------------------------------------------------------------------------
	#	link
	#----------------------------------------------------------------------------
	cd $(SRCDIR);\
	$(CC) $(ELF_FLAGS) $(LDFLAGS) $(CFLAGS) -o main32.elf main32.c\
		$(OBJDIR)/crt0.S\
		$(LKRDIR)/ISRwrapper.S\
		$(P32CORE)/mips-elf/lib/processor.o\
		$(OBJDIR)/usb/libcdc.a\
		$(INCDIR)/non-free/p32xxxx.h

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

