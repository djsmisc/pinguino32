########################################################################
#                                                                      #
#	Pinguino Bootloader v4.x                                           #
#	8-bit USB Bootloader                                               #
#	Author:	Régis Blanchot <rblanchot@gmail.com>                       #
#           André Gentric                                              #
#                                                                      #
#	Usage: 'make' or 'make all' (to compile the bootloader)            #
#          'make burn' (to burn the bootloader on the chip)		       #
#                                                                      #
#	This file is part of Pinguino Project (http://www.pinguino.cc)     #
#	Released under the LGPL license (www.gnu.org/licenses/lgpl.html)   #
#                                                                      #
########################################################################
#	Supported CPU's                                                    #
########################################################################
#   18f2455		18f2550		18f25k50	18f26j50                       #
#	18f4455		18f4550		18f45k50	18f46j50                       #
########################################################################
#	Work in progress                                                   #
########################################################################
#	16f1455		18f14k50                                               #
########################################################################

LOW_SPEED	= 1
HIGH_SPEED	= 0

########################################################################
#	CONFIGURATION OPTIONS                                              #
########################################################################

CPU			= 18f46j50

# speed (MHz) of the external or internal crystal
#CRYSTAL		= INTOSC
#CRYSTAL		= 8
CRYSTAL		= 20

# usb speed (HIGH_SPEED or LOW_SPEED)
USBSPEED	= $(HIGH_SPEED)

# sdcc's toolchain directory
SDCCDIR		= /dvpt/sdcc

########################################################################
#       DO NOT CHANGE FOLLOWINGS WITHOUT CARE                          #
########################################################################

# bootloader version (cf. changelog.txt)
MAJ_VER		= 4
MIN_VER		= 7

# end of bootloader / start of pinguino application
ENTRY		= 0x0C00

ifeq ($(USBSPEED), $(LOW_SPEED))
CRYSTAL	 = 8
endif

FAM			= $(shell echo $(CPU) | cut -c 1-3)

ifeq ($(FAM), 18f)
ARCH		= pic16
OPTIMIZ		= --optimize-df --optimize-cmp --obanksel=9 --denable-peeps
else
ARCH		= pic14
endif

ifeq ($(CRYSTAL), INTOSC)
PRJ		= Bootloader_v$(MAJ_VER).$(MIN_VER)_$(CPU)_$(CRYSTAL)
else
PRJ		= Bootloader_v$(MAJ_VER).$(MIN_VER)_$(CPU)_X$(CRYSTAL)MHz
endif

# startup files in sdcc/sources/sdcc/device/lib/pic16/startup
# crt0.o	minimal initialisation routine
# crt0i.o	initialisation of variables
# crt0iz.o	RAM cleanup and initialisation of variables
CRTB		= crt0iBoot4
CRTP		= crt0iPinguino
SRCS		= main.c picUSB.c
OBJS		= $(SRCS:.c=.o)

BINDIR		= $(SDCCDIR)/bin
INCLUDEDIR	= $(SDCCDIR)/share/sdcc/include/$(ARCH)
LIBDIR		= $(SDCCDIR)/share/sdcc/lib/$(ARCH)

CC			= $(BINDIR)/sdcc

CFLAGS		= -m$(ARCH) \
			  -p$(CPU) \
			  $(OPTIMIZ) \
		      --fomit-frame-pointer \
		      --use-non-free \
		      -D ENTRY=$(ENTRY) \
		      -D SPEED=$(USBSPEED) \
		      -D CRYSTAL=$(CRYSTAL) \
		      -D MAJOR_VERSION=$(MAJ_VER) \
		      -D MINOR_VERSION=$(MIN_VER) \
		      -Wa-w2

#		       --verbose \
#		       --opt-code-size
#		       --optimize-hard \

LFLAGS		= -Wl,"--map -w -s Boot4_$(CPU).lkr" \
		      --use-crt=$(CRTB).o
#		       --no-crt

# Main target
all: start clean $(CRTB).o $(CRTP).o $(PRJ).hex size

start:
	@echo Building $(PRJ) ...

# Deleting all the debug files generated
clean:
	@rm -f *.o *.cod *.asm *.lst *.map *.err

# make crt0Boot4.o
$(CRTB).o:	%.o: %.c
	@$(CC) $(CFLAGS) -c $< -o $@

# make crt0iPinguino.o
$(CRTP).o:	%.o: %.c
	@$(CC) $(CFLAGS) --ivt-loc=$(ENTRY) -c $< -o crt0i$(CPU).o

# Linking the modules all together
$(PRJ).hex: $(OBJS)
	@$(CC) $(CFLAGS) $(LFLAGS) -I $(INCLUDEDIR) -o $(PRJ).hex $(OBJS)
	
# Compiling and assembling all the modules
%.o: %.c
	@$(CC) -c $(CFLAGS) $<
#-L $(LIBDIR) -I $(INCLUDEDIR) 

# Calculating the whole code size
size:
	@./codesize.py $(PRJ)
	
# Programming the Chip
burn:
	./picpgm -pic PIC$(CPU) $(PRJ).hex
