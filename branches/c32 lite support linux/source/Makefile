CC        = $(COMPILER)
OBJC      = $(O2H)
UBW32     = $(PIC32BIN)ubw32
MODEL     = 32MX460F512L
FLAGS     = -mprocessor=32MX460F512L -x c -c
ELF_FLAGS = -nostdlib -lgcc
LKR = -T $(COMPILER)/lkr/procdefs.ld

RM        = rm -f

all: clean build

build:
	cd $(SOURCE)/source; $(MAKE) COMPILER=$(COMPILER) link

link:
	$(CC) $(ELF_FLAGS) -mprocessor=32MX460F512L -I "../tools/pic32mx/include/" -I "../tools/pic32mx/include/pinguino/" -I "../obj/non-free/" -o main32.elf main32.o "../obj/non-free/crt0.S" "../obj/non-free/processor.o" -lm -lc
	$(OBJC) -O ihex main32.elf main32.hex
	#This remove wrong routine
	grep --binary --invert-match '^:040000059D006000FA' main32.hex > temp
	mv temp main32.hex	

clean:
	$(RM) main32.elf
	$(RM) main32.hex

