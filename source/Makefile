PIC32BIN  = $(COMPILER)/bin/
CC        = $(PIC32BIN)mypic32-gcc
OBJC      = $(PIC32BIN)mypic32-objcopy
UBW32     = $(PIC32BIN)ubw32
MODEL     = 32MX460F512L
FLAGS     = -mprocessor=$(MODEL) -x c -c
ELF_FLAGS = -nostdlib -mprocessor=32MX460F512L

RM        = rm -f

all: clean build

build:
	cd $(SOURCE)/source; $(MAKE) COMPILER=$(COMPILER) link

link:
	$(CC) $(ELF_FLAGS) -I "$(COMPILER)/pic32mx/include/pinguino/" -o main32.elf main32.o "../obj/non-free/crt0.S" "../obj/non-free/processor.o"
	$(OBJC) -O ihex main32.elf main32.hex
	#This remove wrong routine
	grep --binary --invert-match '^:040000059D006000FA' main32.hex > temp
	mv temp main32.hex	

clean:
	$(RM) main32.elf
	$(RM) main32.hex

