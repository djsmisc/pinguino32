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
#                                                                      #
#   18f2455		18f2550		18f25k50	18f26j50                       #
#	18f4455		18f4550		18f45k50	18f46j50                       #
#                                                                      #
########################################################################
#	Work in progress                                                   #
########################################################################
#                                                                      #
#	16f1455	18f14k50	                                               #
#                                                                      #
########################################################################

LOW_SPEED	= 1
HIGH_SPEED	= 0

########################################################################
#	CONFIGURATION OPTIONS                                              #
########################################################################

CPU			= 18f4550

# speed (MHz) of the external or internal crystal
#CRYSTAL		= INTOSC
#CRYSTAL		= 8
CRYSTAL		= 20

# usb speed (HIGH_SPEED or LOW_SPEED)
USBSPEED	= $(HIGH_SPEED)

# SDCC's toolchain directory
SDCCDIR		= /dvpt/sdcc
# Pinguino directory
PINGUINODIR = /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.4

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

#FAM			= $(shell echo $(CPU) | cut -c 1-3)
FAM			= $(findstring 18f, $(CPU))

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

# crt0.o	minimal initialisation routine
# crt0i.o	initialisation of variables
# crt0iz.o	RAM cleanup and initialisation of variables

#CRTB		= crt0iBoot4
CRTP		= crt0iPinguino
SRCS		= $(wildcard src/*.c)
OBJS		= $(SRCS:src/%.c=obj/%.o)

BINDIR		= $(SDCCDIR)/bin
#INCLUDEDIR	= $(SDCCDIR)/share/sdcc/non-free/include/$(ARCH)
#LIBDIR		= $(SDCCDIR)/share/sdcc/lib/$(ARCH)

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

# default startup is used if no other option is defined
# startup files are in sdcc/sources/sdcc/device/lib/pic16/startup
LDFLAGS		= -Wl,"--map -w -s lkr/boot4.$(CPU).lkr" --no-crt

# Main target
all: start clean $(CRTP).o $(PRJ).hex size

# Start message
start:
	@echo Building $(PRJ) ...
	
# Deleting all the debug files generated
clean:
	@echo Cleaning ...
	@rm -f obj/*.o  obj/*.asm obj/*.lst
	@rm -f hex/*.cod hex/*.map hex/*.lst

# make obj/crt0Boot4.o
#$(CRTB).o:	%.o: %.c
#	@$(CC) $(CFLAGS) -c $< -o obj/$@

# make obj/crt0iPinguino.o
$(CRTP).o:
	@echo Compiling $(CRTP).o ...
	@$(CC) $(CFLAGS) --ivt-loc=$(ENTRY) -c obj/$(CRTP).c -o obj/crt0i$(CPU).o
	@cp obj/crt0i$(CPU).o $(PINGUINODIR)/p8/obj/

# Compiling and assembling all the src/.c in obj/.o
obj/%.o: src/%.c
	@echo Compiling ...
	@$(CC) $(CFLAGS) -c $< -o $@

# Linking the modules all together
$(PRJ).hex: $(OBJS)
	@echo Linking ...
	@$(CC) $(CFLAGS) $(LDFLAGS) -o hex/$@ $^

# Calculating the whole code size
size:
	@tools/codesize.py hex/$(PRJ)
	
# Programming the Chip
burn:
	tools/picpgm -pic PIC$(CPU) hex/$(PRJ).hex
