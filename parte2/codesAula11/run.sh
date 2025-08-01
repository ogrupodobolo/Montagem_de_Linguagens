nasm -f elf64 a11e01.asm
nasm -f elf64 a11e02.asm
nasm -f elf64 a11e03.asm
nasm -f elf64 a11e04.asm
ld a11e01.o -o ex1.x 
ld a11e02.o -o ex2.x 
ld a11e03.o -o ex3.x 
ld a11e04.o -o ex4.x 