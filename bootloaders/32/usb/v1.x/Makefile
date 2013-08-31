# ----------------------------------------------------------------------

########################################################################
#                                                                      #
#	Pinguino Bootloader v1.x                                           #
#	32-bit USB Bootloader                                              #
#	Author:	Régis Blanchot <rblanchot@gmail.com>                       #
#	First release : 01 Mar. 2013                                       #
#	Last update :   11 Mar. 2013                                       #
#	This file is part of Pinguino Project (http://www.pinguino.cc)     #
#	Released under the LGPL license (www.gnu.org/licenses/lgpl.html)   #
#                                                                      #
########################################################################

########################################################################
#                                                                      #
#	$@ 	Le nom de la cible                                             #
#	$< 	Le nom de la première dépendance                               #
#	$^ 	La liste des dépendances                                       #
#	$? 	La liste des dépendances plus récentes que la cible            #
#	$* 	Le nom du fichier sans suffixe                                 #
#                                                                      #
########################################################################

########################################################################
#                                                                      #
#  VERSION (cf. changelog.txt)                                         #
#                                                                      #
########################################################################

MAJ_VER		= 1
MIN_VER		= 0
CRYSTAL		= 8
ENTRY		= 0x0C00

########################################################################
#                                                                      #
#	CONFIGURATION OPTIONS                                              #
#                                                                      #
########################################################################

CPU			= 32MX220F032D
#CPU			= 32MX250F128B
HEAP_SIZE	= 512

# gcc-mips-elf's toolchain directory
GCCDIR		= /dvpt/gcc/mips/linux64

# MIPS16 option drastically reduce code size 
__MIPS16_ENABLE__	= false

########################################################################
#                                                                      #
#	DO NOT CHANGE FOLLOWINGS WITHOUT CARE                              #
#                                                                      #
########################################################################

ARCH		=	4kec
#ARCH		=	24kc
#ARCH		=	m4k

ifeq ($(__MIPS16_ENABLE__), true)
	# to generate MIPS16 code
	MIPS16_OPT   = -mips16
	# to permit interlinking of MIPS16 and non-MIPS16 functions
	MIPS16_INTER = -minterlink-mips16
endif

# ----------------------------------------------------------------------
# directories
# ----------------------------------------------------------------------

BOOTDIR		= $(shell pwd)
BINDIR		= $(GCCDIR)/bin
INCDIR		= $(BOOTDIR)/include
LIBDIR		= $(GCCDIR)/lib
LKRDIR		= $(BOOTDIR)/lkr/$(BOARD)
OBJDIR		= $(BOOTDIR)/obj
SRCDIR		= $(BOOTDIR)/src
HEXDIR		= $(BOOTDIR)/hex
BUILD_DIR	= $(BOOTDIR)/build

# ----------------------------------------------------------------------
# misc
# ----------------------------------------------------------------------

PRJ			= Bootloader_v$(MAJ_VER).$(MIN_VER)_$(CPU)
#SRCS		= $(wildcard src/*.c)
SRCS		= $(wildcard ${BUILD_DIR}/*.c)
#OBJS		= $(SRCS:src/%.c=hex/%.elf)
OBJS		= $(SRCS:.c=.o)
#OBJS		= $(SRCS:%.c=%.elf)
BOARD		= PINGUINO$(CPU)

# ----------------------------------------------------------------------
# commands
# ----------------------------------------------------------------------

CC			= $(BINDIR)/mips-elf-gcc
OBJCOPY		= $(BINDIR)/mips-elf-objcopy
RM			= rm -f -v
CP			= cp
MV			= mv
MKDIR		= mkdir -p

# ----------------------------------------------------------------------
# flags
# ----------------------------------------------------------------------

# compiler options
CFLAGS		=	-EL \
				-Os \
				-Wall \
				-march=$(ARCH) \
				$(MIPS16_OPT) \
				$(MIPS16_INTER) \
				-msoft-float \
				-fdollars-in-identifiers \
				-ffunction-sections \
				-freorder-functions \
				-fdata-sections

# linker options
LDFLAGS	=		-Wl,--gc-sections \
				-Wl,--defsym,_min_heap_size=$(HEAP_SIZE) \
				-Wl,-Map=$(BOOTDIR)/output.map \
				-Wl,-L$(OBJDIR)/non-free \
				-T$(LKRDIR)/procdefs.ld \
				-T$(LKRDIR)/elf32pic32mx.x \
				-I$(INCDIR)/non-free \
				-I$(LKRDIR) \
				-I$(OBJDIR)/non-free

# preprocessor options
CPPFLAGS	=	-D __PIC32MX__ \
				-D __$(CPU)__ \
				-D $(BOARD) \
				-D MAJOR_VERSION=$(MAJ_VER) \
				-D MINOR_VERSION=$(MIN_VER)

ELFFLAGS	=	

LIBS		=	-lm -lgcc -lc


#				-fno-optimize-sibling-calls \
#				-T$(LKRDIR)/bootloader.ld\

HEXFLAGS	=	-O ihex

# ----------------------------------------------------------------------
# unsupported record in hex file / Jean-pierre Mandon 2012
# ----------------------------------------------------------------------

BADRECORD='^:040000059D006000FA'
ifeq ($(CPU),32MX250F128B)
	BADRECORD = '^:040000059D0040001A'
endif
ifeq ($(CPU),32MX220F032B)
	BADRECORD = '^:040000059D0040001A'
endif

REMOVE = @grep --binary --invert-match $(BADRECORD) ${HEXDIR}/$(PRJ).hex > temp.hex

# ----------------------------------------------------------------------
#	rules
# ----------------------------------------------------------------------

all: clean copy $(PRJ).elf exec correct size

clean:
	#-------------------------------------------------------------------
	#	clean
	#-------------------------------------------------------------------
	$(RM) $(OBJDIR)/non-free/processor.o
	$(RM) -r ${BUILD_DIR}
	$(MKDIR) ${BUILD_DIR}

copy:
	#-------------------------------------------------------------------
	#	copy
	#-------------------------------------------------------------------
	cp $(SRCDIR)/* ${BUILD_DIR}/
	cp $(OBJDIR)/non-free/$(CPU).o $(OBJDIR)/non-free/processor.o

#${BUILD_DIR}/%.o: ${BUILD_DIR}/%.c
#	${CC} ${CFLAGS} $(LDFLAGS) $(CPPFLAGS) $(INCDIR)/non-free/p32xxxx.h -o $@ -c $<
  

#$(PRJ).elf: $(OBJS)
$(PRJ).elf: $(SRCS)
	#-------------------------------------------------------------------
	#	link
	#-------------------------------------------------------------------
	${CC} $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o ${BUILD_DIR}/$@ $^ \
		$(INCDIR)/non-free/p32xxxx.h \
		$(INCDIR)/non-free/crt0.S \
		$(OBJDIR)/non-free/processor.o

exec:
	#-------------------------------------------------------------------
	#	exec
	#-------------------------------------------------------------------
	$(OBJCOPY) ${HEXFLAGS} ${BUILD_DIR}/$(PRJ).elf ${HEXDIR}/$(PRJ).hex

correct:
	#-------------------------------------------------------------------
	#	correct bad record
	#-------------------------------------------------------------------
	@echo $(BADRECORD)
	${REMOVE}
	@${MV} temp.hex ${HEXDIR}/$(PRJ).hex      

size:
	#-------------------------------------------------------------------
	#	calculate the whole code size
	#-------------------------------------------------------------------
	@tools/codesize.py ${HEXDIR}/$(PRJ)
