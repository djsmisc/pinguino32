########################################################################
#                                                                      #
#	Bootloader_v4.x                                                    #
#	8-bit Pinguino USB Bootloader                                      #
#	Régis Blanchot & André Gentric                                     #
#                                                                      #
########################################################################

LOW_SPEED	= 1
HIGH_SPEED	= 0

########################################################################
#  VERSION (cf. changelog.txt)                                         #
########################################################################

MAJ_VER		= 4
MIN_VER		= 3

########################################################################
#  SDCC PATH                                                           #
########################################################################

SDCCDIR		= /dvpt/sdcc

########################################################################
#	CONFIGURATION OPTIONS                                              #
########################################################################

#CPU			= 14k50
#CPU			= 2550
#CPU			= 4550
CPU			= 26j50
ENTRY		= 0x0C00
CRYSTAL		= 8
#CRYSTAL		= 20
USBSPEED	= $(HIGH_SPEED)

########################################################################
#	DO NOT CHANGE FOLLOWINGS WITHOUT CARE                              #
########################################################################

ifeq ($(USBSPEED), $(LOW_SPEED))
	CRYSTAL = 8
endif

FAM			= 18f
PIC			= $(FAM)$(CPU)
ARCH		= pic16
PRJ			= Bootloader_v$(MAJ_VER).$(MIN_VER)_18f$(CPU)_X$(CRYSTAL)MHz
# startup files in sdcc/sources/sdcc/device/lib/pic16/startup
# crt0.o	minimal initialisation routine
# crt0i.o	initialisation of variables
# crt0iz.o	RAM cleanup and initialisation of variables
CRTB		= crt0iBoot4
CRTP		= crt0iPinguino
SRCS		= main.c picUSB.c
OBJS		= $(SRCS:.c=.o)

BINDIR		= $(SDCCDIR)/bin
INCLUDEDIR	= $(SDCCDIR)/share/sdcc/include/pic16
LIBDIR		= $(SDCCDIR)/share/sdcc/lib/pic16

CC			= $(BINDIR)/sdcc

CFLAGS		= -m$(ARCH) \
			  -p$(PIC) \
			  --optimize-df \
			  --optimize-cmp \
			  --obanksel=9 \
			  --fomit-frame-pointer \
			  --denable-peeps \
			  --use-non-free \
			  -D ENTRY=$(ENTRY) \
			  -D SPEED=$(USBSPEED) \
			  -D CRYSTAL=$(CRYSTAL) \
			  -D MAJOR_VERSION=$(MAJ_VER) \
			  -D MINOR_VERSION=$(MIN_VER) \
			  -Wa-w2

#			  --verbose \
#			  --opt-code-size
#			  --optimize-hard \

LFLAGS		= -Wl,"--map -w -s Boot4_$(PIC).lkr" \
			  --use-crt=$(CRTB).o
#			  --no-crt

# Main target
all: start clean $(CRTB).o $(CRTP).o $(PRJ).hex size

# Linking the modules all together
$(PRJ).hex: $(OBJS)
	@$(CC) $(CFLAGS) $(LFLAGS) -I $(INCLUDEDIR) -o $(PRJ).hex $(OBJS)
	
# Compiling and assembling all the modules
%.o: %.c
	@$(CC) -c $(CFLAGS) $<
#-L $(LIBDIR) -I $(INCLUDEDIR) 

# Deleting all the debug files generated
clean:
	@rm -f *.o *.cod *.asm *.lst *.map *.err

# Calculating the whole code size
size:
	@./codesize.py $(PRJ)
	
# make crt0Boot4.o
$(CRTB).o:	%.o: %.c
	@$(CC) $(CFLAGS) -c $< -o $@

# make crt0iPinguino.o
$(CRTP).o:	%.o: %.c
	@$(CC) $(CFLAGS) --ivt-loc=$(ENTRY) -c $< -o crt0i$(PIC).o

start:
	@echo Building $(PRJ) ...
