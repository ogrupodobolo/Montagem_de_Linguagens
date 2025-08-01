
# Aula 08 - Modos de Endereçamento em Linguagens de Montagem

## 🎯 Objetivo da Aula
Compreender os diferentes **modos de endereçamento** usados em instruções Assembly (x86_64), focando principalmente no operando fonte.

---

## 🧠 Conceitos Iniciais
- **Instrução**: operação específica realizada pelo processador.
  - Ex: `MOV`, `ADD`, `JMP`, `AND`
- **Elementos da instrução**:
  - **Opcode** (código da operação)
  - **Operando A** (destino)
  - **Operando B** (fonte)

---

## 🛠️ Exemplos com Arquivos `.asm`
- Comparação de instruções `MOV eax, ebx` e `ADD eax, ebx` via arquivos `.asm`
- Ferramentas úteis:
  - `diff`, `cmp -l`, `gawk`, script `cmpASM.sh`
  - Editores: [hexed.it](https://hexed.it), [defuse.ca](https://defuse.ca/online-x86-assembler.htm)

---

## 🗂️ Modos de Endereçamento
Todos os exemplos utilizam `EAX` como registrador destino.

### 1. Imediato
- Operando é parte da instrução (constante).
- Ex: `mov eax, 0x42`

### 2. Direto
- Operando está em um endereço fixo de memória.
- Ex: `mov eax, [var]`

### 3. Indireto (não suportado em x86_64)
- Operando está no endereço que está em outro endereço.
- Simulado com ponteiro: `mov eax, [n]`, após `mov [n], var`

### 4. Por Registrador
- Operando está em um registrador.
- Ex: `mov eax, ebx`

### 5. Indireto por Registrador
- Operando está no endereço apontado por um registrador.
- Ex: `mov eax, [r8]`

### 6. Por Deslocamento
- Operando está no endereço base + deslocamento imediato.
- Ex: `mov eax, [var+4]`, `mov eax, [r8+4]`

### 7. Por Deslocamento Indexado
- Endereço base + índice × tamanho da palavra.
- Ex:
  - `mov eax, [var + rcx * 4]`
  - `mov eax, [r8 + rcx * 4]`
- Fator de escala permitido: 1, 2, 4, 8

---

## 🔬 Exemplo com Arquivo `a08e03.asm`
Mostra combinação de modos:
```asm
mov al , [r8]               ; indireto por registrador
mov bl , [v1 + r15d]        ; por deslocamento
mov edx, [v2 + r15d*4]      ; por deslocamento indexado
```

---

## 🧪 Atividades Práticas

### 🔹 a08at01
Investigar o **opcode** (código da instrução) das seguintes operações:
- `SUB r32, r32`
- `OR r32, r32`
- `AND r32, r32`
- `XOR r32, r32`

### 🔹 AP0801-Extra
Descobrir os bits de registradores no segundo byte da instrução `ADD`.

### 🔹 a08at02
Inverter vetor de 10 caracteres digitados pelo usuário (exceto `<enter>`), mostrando a versão original e a invertida.

### 🔹 a08at03
Ordenar vetor de 10 inteiros (sem vetor auxiliar), exibindo o conteúdo ordenado.

---

## 🧩 Próxima Aula (Aula 09)
- Endereçamento por Pilha
- Passagem de parâmetros pela linha de comando (`argc` e `argv`)
