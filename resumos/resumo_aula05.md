
# Resumo - Aula 05: Instruções Básicas Aritméticas e Lógicas

## 1. Introdução
Revisão das aulas anteriores:
- Aula 01: Montagem, linkagem e execução (`nasm`, `ld`)
- Aula 02: Estrutura de programas e dados inicializados
- Aula 03: Registradores e instrução MOV
- Aula 04: Dados não inicializados e estrutura de programas

## 2. Instruções Aritméticas
### ADD
```asm
ADD destino, fonte ; destino = destino + fonte
```

### SUB
```asm
SUB destino, fonte ; destino = destino - fonte
```

Ambas alteram **FLAGS** (overflow, carry).

### INC / DEC
```asm
INC reg ; reg = reg + 1
DEC reg ; reg = reg - 1
```

## 3. Registrador FLAGS
- Indica o estado das operações
- Principais:
  - **OF**: overflow (operações sinalizadas)
  - **CF**: carry (operações não sinalizadas)
- Visualização com `gdb`: `info register eflags`

## 4. Instruções Lógicas
### AND, OR, XOR
```asm
AND reg, reg
OR reg, reg
XOR reg, reg
```

### NOT vs NEG
```asm
NOT reg ; inverte bits (não afeta FLAGS)
NEG reg ; complemento de 2 (nega o número)
```

## 5. Deslocamentos
### SHL / SHR (Lógicos)
```asm
SHL dest, n ; shift left lógico
SHR dest, n ; shift right lógico
```
- Usado para inteiros **não sinalizados**

### SAL / SAR (Aritméticos)
```asm
SAL dest, n ; shift left aritmético (equivale a SHL)
SAR dest, n ; shift right aritmético
```
- Usado para inteiros **sinalizados**

### Outros
- `ROL`, `ROR` – rotações
- `RCL`, `RCR` – rotações com carry
- `SARX`, `SHLX`, `SHRX` – deslocamentos sem alterar FLAGS

## 6. Operações Aritméticas de Inteiros
### Multiplicação
```asm
MUL r/m    ; não sinalizada
IMUL r/m   ; sinalizada
IMUL reg, r/m ; resultado em reg
```
- Resultado em RDX:RAX (ou EDX:EAX)

### Divisão
```asm
DIV r/m    ; não sinalizada
IDIV r/m   ; sinalizada
```
- Operação: RAX = (RDX:RAX) ÷ divisor
- Resto em RDX

### Extensão de sinal
- `CWD`, `CDQ`, `CQO`: convertem para dobro do tamanho antes da divisão

## 7. Atividades

### a05at01 - Conversão de Letras
```asm
maiuscula: db 'A'
minuscula: db 'b'
lowercase: resb 1
uppercase: resb 1
```
- Usar `ADD`/`SUB` para converter letras usando tabela ASCII.

### a05at02 - Correção com Lógicas
- Reescrever o código da atividade anterior com `AND`, `OR`, `XOR`
- Elimina bugs quando letras não estão corretamente inicializadas

### a05at03 - Somatório de Vetor
```asm
triangularNum : dd 0, 1, 3, 6, 10, 15, 21, 28
somatorio : resd 1
```
- Somar um a um os elementos
- Usar `LEA` com indexador para calcular endereço

### a05at04 - Número Triangular n-ésimo
```asm
n : dd 40
enessimotrinumero : resd 1
```
- Calcular `Tn = n*(n+1)/2` e armazenar o resultado

## Próxima Aula: Aula 06
- Chamadas de Sistema:
  - Escrita no terminal
  - Leitura do teclado
  - Encerramento do programa
  - Manipulação de arquivos
