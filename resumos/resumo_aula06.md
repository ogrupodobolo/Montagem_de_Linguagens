
# Resumo - Aula 06: Chamadas de Sistemas

## 1. Introdução
- Chamadas de sistema (syscalls) permitem interação direta com o kernel do sistema operacional.
- Exemplos: leitura, escrita, finalização de processos, manipulação de arquivos.

## 2. Hello World em Assembly
```asm
section .data
strOla: db "Ola", 10
strOlaL: equ $ - strOla

section .text
global _start
_start:
  mov rax, 1        ; syscall: write
  mov rdi, 1        ; stdout
  lea rsi, [strOla] ; endereço do texto
  mov edx, strOlaL  ; tamanho do texto
  syscall

  mov rax, 60       ; syscall: exit
  mov rdi, 0
  syscall
```

## 3. Conceitos de syscall
- `syscall` chama uma função do kernel.
- Parâmetros são passados via registradores.
  - `rax`: número da syscall
  - `rdi`, `rsi`, `rdx`: argumentos
- Resultado da syscall geralmente retorna em `rax`.

## 4. Chamadas de Sistema Comuns

### WRITE
```c
ssize_t write(int fd, const void *buf, size_t count);
```
```asm
mov rax, 1        ; syscall write
mov rdi, 1        ; stdout
lea rsi, [msg]    ; buffer
mov edx, msg_len  ; tamanho
syscall
```

### EXIT
```c
void _exit(int status);
```
```asm
mov rax, 60
mov rdi, 0
syscall
```

### READ
```c
ssize_t read(int fd, void *buf, size_t count);
```
```asm
mov rax, 0        ; syscall read
mov rdi, 1        ; stdin
lea rsi, [buf]    ; buffer de leitura
mov edx, buf_size ; tamanho máximo
syscall
```

## 5. Exemplo a06e01.asm
- Programa “papagaio”: lê a entrada do usuário e a repete.
- Define `maxChars` com `%define`.
- Usa buffer para armazenar entrada e saída com `READ` e `WRITE`.

## 6. Syscall OPEN e CLOSE
### OPEN
```c
int open(const char *pathname, int flags, mode_t mode);
```
```asm
mov rax, 2       ; syscall open
lea rdi, [fileName]
mov esi, flags
mov edx, mode
syscall
```

### CLOSE
```c
int close(int fd);
```
```asm
mov rax, 3       ; syscall close
mov edi, fileDescriptor
syscall
```

## 7. Clobbered Registers
- Alguns registradores podem ser sobrescritos por `syscall`.
- Documentação: x86-64 ABI (Seção A.2) e `nolibc.h`.

## 8. Atividades

### a06at01 - Autodestruição
- Use `getpid` e `kill` para encerrar o próprio processo.
- Código deve tentar continuar após `kill` para verificar falha.

### a06at02 - Papagali Persistente
- Baseado no exemplo `a06e01.asm`.
- Deve abrir (ou criar) um arquivo chamado `papagali.txt`.
- Texto digitado é adicionado ao final (modo append).

## 9. Anexo - Flags do Open
- `O_RDONLY` (0), `O_WRONLY` (1), `O_RDWR` (2)
- `O_CREAT` (0100): cria arquivo se não existir (usar com permissões via `EDX`)
- `O_APPEND` (02000): escreve ao final do arquivo
- Valores são expressos em OCTAL.

## Próxima Aula
**Aula 07: Controle de Fluxo de Execução**
- Fluxo, Labels, Laços de Repetições
