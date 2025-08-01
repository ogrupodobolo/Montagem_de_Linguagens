section .bss
    argc : resq 1

section .text
    global _start

_start:

    pop qword [argc]

fim:
    mov rax, 60
    mov rdi, 0
    syscall
