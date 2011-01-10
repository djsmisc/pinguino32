PIC32BIN  = $(COMPILER)/bin/
CC        = $(PIC32BIN)mypic32-gcc
OBJC      = $(PIC32BIN)mypic32-objcopy
UBW32     = $(PIC32BIN)ubw32
MODEL     = 32MX460F512L
FLAGS     = -mprocessor=$(MODEL) -x c -c -v
ELF_FLAGS = -nostdlib -mprocessor=32MX460F512L

RM        = rm -f

all: clean build

build: dummy
	cd $(SOURCE)/source/; $(MAKE) COMPILER=$(COMPILER) SOURCE=$(SOURCE) compile; $(MAKE) correct

compile:
	#$(CC) $(FLAGS) -I "$(COMPILER)/pic32mx/include/pinguino/" "main32.c" -o "main32.o"
	$(CC) $(ELF_FLAGS) -I "$(COMPILER)/pic32mx/include/pinguino/" -o main32.elf main32.o "$(SOURCE)/obj/non-free/crt0.S" "$(SOURCE)/obj/non-free/processor.o"
	$(OBJC) -O ihex main32.elf main32.hex

clean:
	$(RM) main32.elf
	$(RM) main32.hex
	$(RM) main32.o

correct:
	#This remove wrong routine
	grep --binary --invert-match '^:040000059D006000FA' main32.hex > temp
	mv temp main32.hex

write: all
	#write hex file to UBW32
	#sudo ubw32 -w test.hex -r
	# ubw32 has been moved to PIC32/compiler/bin
	$(UBW32) -w main32.hex -r

dummy:
	true
