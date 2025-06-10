
# Resumo - Aula 04: Variáveis Não Inicializadas e Estrutura de Programas

## 1. Estrutura de um Programa ELF
A memória de um programa em formato ELF está dividida em diversas seções:
- `.text`: instruções do programa (código)
- `.data`: variáveis com valores pré-definidos (dados inicializados)
- `.bss`: variáveis sem valores atribuídos (dados não inicializados)
- `heap` e `stack`: memória dinâmica e pilha
- O endereço cresce das instruções para a pilha (baixo → alto)

## 2. Dados Inicializados (`.data`)
Variáveis com valores já definidos:
```asm
section .data
v1: db 0x61        ; 1 byte
v2: dd 0x65646362  ; 4 bytes
```

**Pseudo-instruções para tamanhos**:
- `db`: byte (1B)
- `dw`: word (2B)
- `dd`: double word (4B)
- `dq`: quad word (8B)

## 3. Dados Não Inicializados (`.bss`)
Reservam espaço na memória sem atribuir valores:
```asm
section .bss
n1: resb 1 ; 1 byte
n2: resw 1 ; 2 bytes
```

**Pseudo-instruções para reserva**:
- `resb`: byte
- `resw`: word
- `resd`: double word
- `resq`: quad word

## 4. Movimentação de Dados (`MOV`)
Copia valores entre registradores e memória:
```asm
mov al, [v1]
mov [n1], al
```
Usado para dados inicializados e não inicializados.

## 5. Descoberta de Endereços em Tempo de Execução
Uso da instrução `LEA` para obter o endereço de uma variável:
```asm
lea rax, [v1]
```

## 6. Representação Numérica
Valores podem ser declarados em diversas bases:
- Hexadecimal: `0x61`, `61h`
- Decimal: `97d`, `97`
- Octal: `141o`
- Binário: `1100001b`

## 7. Números Negativos
São representados em complemento de dois:
```asm
v1: dq -100d
```

## 8. Extensões de Sinal

### Com sinal (`MOVSX`)
Mantém o valor com sinal:
```asm
movsx rcx, eax
```

### Sem sinal (`MOVZX`)
Preenche com zeros ao expandir:
```asm
movzx rcx, al
```

## 9. Exemplos Práticos
- `a04e01.asm` – Movimentação básica entre variáveis
- `a04e02.asm` – Uso de `LEA` para pegar endereços
- `a04e03.asm` – Representações numéricas em diferentes bases
- `a04e04.asm` – Representação de números negativos
- `a04e05.asm` – Extensão de sinal com `MOVSX`

## 10. Atividade Prática: Cálculo de Volume

### Objetivo:
Calcular o volume de um hexaedro:
```
volume = largura * altura * profundidade
```

### Trecho de código:
```asm
section .data
dimensoes: dw 50, 65, -75

section .bss
volume: resq 1

section .text
global _start

_start:
movsx r8, word [dimensoes]
movsx r9, word [dimensoes + 2]
movsx r10, word [dimensoes + 4]

; cálculo (realizado entre linhas 28 e 35)

mov [volume], rcx

fim:
mov rax, 60
mov rdi, 0
syscall
```

### Validação:
Usar GDB:
```sh
gdb
b fim
r
x /gd &volume
```
Valor esperado: `-243750`

## Próxima Aula
**Aula 05: Operações Aritméticas e Lógicas**
