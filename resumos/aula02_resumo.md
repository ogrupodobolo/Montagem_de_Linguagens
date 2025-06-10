# 📚 Aula 02 – Estrutura dos Programas (Linguagens de Montagem)

## 🧱 1. Estrutura Básica de um Programa

- O formato utilizado é o **ELF** (Executable and Linkable Format).
- Organização da memória:
  - **Instruções (.text)**
  - **Dados Inicializados (.data)**
  - **Dados Não Inicializados (.bss)**
  - **Heap (memória dinâmica)**
  - **Stack (pilha)**

---

## 📦 2. Formato ELF

### Cabeçalho ELF:
- Assinatura: `0x7F 45 4C 46` (ELF)
- Informa arquitetura (x86/x64), ponto de entrada, tamanho de cabeçalhos etc.

### Cabeçalho de Programa:
- Define como o SO deve carregar o programa na memória.

### Cabeçalho de Seção:
- Detalha o tamanho, deslocamento e nomes das seções do programa.

---

## 🧠 3. Seções Importantes

- **.text**: instruções executáveis (execução ocorre de cima para baixo).
- **.data**: dados inicializados (valores definidos no início, podem ser alterados).
- **.bss**: dados não inicializados (reserva de memória, sem valor inicial).

---

## 🗃️ 4. Dados

- A memória **não possui tipos de dados**.
- É a instrução que determina como interpretar o conteúdo.
- Definições:
  - `db`: define 1 byte
  - `dw`: define 2 bytes (word)
  - `dd`: define 4 bytes (double word)
  - `dq`: define 8 bytes (quadword)

---

## 💾 5. Exemplo de Variáveis Inicializadas (.data)

```asm
section .data
v1: db 0x55
v2: db 0x55,0x56,0x57
v3: db 'a',0x55
v4: db 'hello',13,10,'$'
v5: dw 0x1234
v6: dw 'a'
v7: dw 'ab'
v8: dw 'abc'
v9: dd 0x12345678
```

---

## 🐞 6. Debugger: GDB (GNU Debugger)

- Ferramenta para depuração de programas.
- Lançado com:
  ```bash
  gdb nome_do_programa.x
  ```

### Comandos úteis:
- `quit` ou `q`: sair
- `break` ou `b`: define ponto de parada
- `run` ou `r`: inicia o programa
- `continue` ou `c`: continua após breakpoint
- `print/x var`: imprime 4 bytes em hex
- `print/c var`: imprime 1 byte como caractere
- `print/x &var`: mostra endereço da variável

---

## 🔬 7. GDB - Acessando Memória

```bash
x /b addr  # 1 byte
x /h addr  # 2 bytes
x /w addr  # 4 bytes
x /g addr  # 8 bytes
```

- Sufixos para interpretação:
  - `c`: caractere
  - `d`: inteiro sinalizado
  - `u`: inteiro não sinalizado
  - `x`: hexadecimal
  - `o`: octal
  - `t`: binário

---


