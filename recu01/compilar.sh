nasm -f elf64 pedromiottomujica.asm ; 
ld pedromiottomujica.o -o pedromiottomujica.x
gdb pedromiottomujica.x