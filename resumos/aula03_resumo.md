# 📚 Aula 03 – Registradores e Instrução MOV

## 🧠 1. Registradores

Registradores são áreas de memória **ultrarrápidas** dentro da CPU utilizadas para armazenamento temporário de dados durante o processamento.

### Tipos:
- **Gerais**:
  - 64 bits: RAX, RBX, RCX, RDX, RSI, RDI, RBP, RSP, R8–R15
  - 32 bits: EAX, EBX, ...
  - 16 bits: AX, BX, ...
  - 8 bits: AL, AH, BL, BH, ...

### Convenções:
- **RAX**: Acumulador
- **RBX**: Base
- **RCX**: Contador
- **RDX**: Dados
- **RSI/RDI**: Fonte/Destino de operações
- **RSP/RBP**: Pilha/base da pilha

---

## 💾 2. Hierarquia dos Registradores

Cada registrador de 64 bits pode ser acessado em partes:

| Registrador | 64 bits | 32 bits | 16 bits | 8 bits (alto) | 8 bits (baixo) |
|-------------|---------|---------|---------|---------------|----------------|
| RAX         | rax     | eax     | ax      | ah            | al             |

---

## 🔀 3. Instrução MOV

A instrução `mov` é usada para **copiar valores** entre registradores, memória e valores imediatos.

### Sintaxe:
```asm
mov destino, origem
```

### Exemplos:
```asm
mov rax, rbx        ; rax recebe valor de rbx
mov rax, 123        ; rax recebe valor imediato 123
mov rax, [x]        ; rax recebe valor do endereço de x
mov [x], rax        ; valor de rax vai para o endereço x
```

---

## 📐 4. Observações Importantes

- As operações `mov` **não alteram** o conteúdo de origem.
- Os tamanhos devem ser **compatíveis** (ex: 64 bits com 64 bits).
- Não é permitido:
  ```asm
  mov [mem1], [mem2] ; ERRO: não pode mover direto de memória para memória
  ```

---

## 🏗️ 5. Instruções de Preenchimento

Podemos usar caracteres de preenchimento em memória:

```asm
v1: times 100 db 'a'
```

Cria 100 bytes consecutivos com o valor ASCII de `'a'`.

---

## 🧪 6. Atividade Prática (AT0301)

- Analisar e depurar o código `a03e01.asm`.
- Observar os efeitos das instruções `mov` sobre os registradores.
- Verificar a disposição dos dados na memória usando o **GDB**.

---

## ⏭️ Próxima Aula (Aula 04)

- Operações aritméticas (ADD, SUB, INC, DEC)
- Flags de status
- Comparações e instruções de salto
