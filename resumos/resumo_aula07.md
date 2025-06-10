
# 📘 Resumo Aula 07: Controle de Fluxo de Execução - Linguagens de Montagem

## 🚀 1. Introdução
O **fluxo de execução** define a ordem em que as instruções do programa são executadas.

🟢 Por padrão: execução **TOP → DOWN** (de cima para baixo).

🔁 Pode ser alterado com **desvios (jumps)**:
- Incondicionais: sempre ocorrem.
- Condicionais: dependem do resultado de operações anteriores.

---

## 🏷️ 2. Labels e Fluxo
- **Labels** são "apelidos" para trechos do código ou posições na memória:
  ```asm
  _start:
  leitura:
  fim:
  ```

- Usados para indicar destinos em instruções de desvio (`JMP`, `JNZ`, etc).

---

## 🪂 3. Desvios Incondicionais (`JMP`)
Pulam para outro ponto no código, **sem verificar condição**.

🧠 Exemplo:
```asm
jmp _start  ; volta ao início infinitamente (loop infinito)
```

🔁 Utilizado para loops manuais ou pular blocos de código.

---

## 🧪 4. Desvios Condicionais
Dependem de **flags** alteradas por operações anteriores.

⚙️ Flags comuns:
- `ZF` (Zero Flag): resultado foi zero
- `SF` (Sign Flag): resultado negativo
- `OF` (Overflow Flag): estouro de capacidade
- `CF` (Carry Flag): houve carry/borrow em operação

🧠 Exemplo:
```asm
dec r8         ; decrementa r8
jnz repete     ; se r8 != 0, volta para "repete"
```

---

## 🧾 5. Tabela de Desvios Condicionais Comuns

| Instrução | Significado                      |
|-----------|----------------------------------|
| `JZ` / `JE`  | Pula se zero / igual             |
| `JNZ` / `JNE`| Pula se diferente de zero        |
| `JG` / `JNLE`| Maior que                       |
| `JL` / `JNGE`| Menor que                       |
| `JC` / `JNC` | Carry / Sem Carry               |

---

## 🆚 6. Instrução `CMP`
Compara dois valores (subtrai sem salvar resultado), **ajustando as flags**.

🧠 Exemplo:
```asm
cmp eax, ebx
jg maior   ; se eax > ebx, vai para "maior"
```

---

## 🔄 7. Estruturas de Repetição (Laços)

### 🔁 Laço FOR manual:
```asm
mov ecx, 5
loop:
  ; comandos
  dec ecx
  jnz loop
```

### ✖️ Comparando strings:
```asm
mov al, [v1]
cmp al, [v2]
je iguais
jl menor
jg maior
```

---

## 🧠 8. Exemplos de Uso

### ✅ Comparações
```c
if (v1 == v2) → je
if (v1 < v2)  → jl
if (v1 > v2)  → jg
```

### 🔢 Loop FOR com índice:
```asm
mov ecx, 0
cmp ecx, limite
jge fim
; comandos
inc ecx
jmp loop
```

---

## 🛠️ 9. Atividades

### 🦜 a07at01 - Corrigir Parrot Code
- Eliminar bugs:
  - Impressão de quebras de linha extras
  - Buffer de teclado não esvaziado

### 🔁 a07at02 - Parrot com Parada
- Continuar repetindo entrada do usuário até digitar `"quit"`

### 💾 a07at03 - Parrot Persistente
- Registra entradas em arquivo
- Ignora entradas vazias
- Substitui repetições consecutivas por `"*"`
- Adiciona marcador `====` entre sessões

---

## ✅ Conclusão

- Controle de fluxo é **fundamental** para lógica de programação em Assembly.
- Instruções como `JMP`, `JZ`, `JNZ` e `CMP` são a base de laços e condições.
- Flags controlam o comportamento lógico do processador.
- Programas interativos precisam gerenciar entrada, saída e estados cuidadosamente.

📚 Próximas aulas:
- Tira-dúvidas
- Avaliação da Etapa 01
