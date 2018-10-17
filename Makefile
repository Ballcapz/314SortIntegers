NAME=sortInts

all: sortInts

clean:
	rm -rf sortInts sortInts.o

sortInts: sortInts.asm
	nasm -f elf -F dwarf -g sortInts.asm
	gcc -g -m32 -o sortInts sortInts.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
