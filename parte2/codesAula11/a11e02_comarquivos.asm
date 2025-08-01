; Exame - Ponto-Flutuante
; Calculo de distância entre pontos 3D
; nasm -f elf64 a11e02.asm ; gcc -m64 -no-pie a11e02.o -o a11e02.x

%define _exit   60
extern printf
extern scanf
extern fopen
extern fclose
extern fprintf

section .data
    pfstr1 : db "ponto_%d : ", 0
    scstr1 : db "%d %d %d", 0
    pfstr2 : db "distância %f",10,0

section .bss
    scfP1 : resd 3 ; x1,y1,z1 ;aqui é um vetor espaço para os 3 valores
    scfP2 : resd 3 ; x2,y2,z2

section .text
    global main

main:
    ; stack-frame

    xor rax, rax
    mov rdi, pfstr1 ; string de controle para printf
    mov esi, 1
    call printf

    ; leitura dos valores x
    xor rax, rax
    mov rdi, scstr1
    
    call scanf
  
    xor rax, rax
    mov rdi,  ; string de controle para printf
    mov esi, 2
    call printf

    ;leitura dos valores y
    xor rax, rax
    mov rdi, scstr1    ; mesma entrada

    call scanf

    ; conversão para double já em registradores


    ; (x1 - x2)^2  

    ; (y1 - y2)^2  
    
    ; (z1 - z2)^2  

    ; adição das 3 diferenças ao quadrado

    ; raiz quadrada em xmm0

    ; print para resposta (teste!)
    ;
    mov rax,       ; quantidade de double a ser impresso
    mov rdi,  ; string de controle para printf
    call 

    ; cria/abre o arquivo
    mov rdi, 
    mov rsi,  
    xor rax, rax
    call fopen

    ; escrita no arquivo
    mov rax,  
    mov rsi, 
    call fprintf

fim:
    ; "destack-frame!"


    mov rax, _exit
    mov rdi, 0
    syscall

