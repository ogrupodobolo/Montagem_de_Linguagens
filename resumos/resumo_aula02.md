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
v1: db 0x55                ; 1 byte com o valor hexadecimal 0x55 (decimal 85)

v2: db 0x55,0x56,0x57      ; 3 bytes: 0x55 ('U'), 0x56 ('V'), 0x57 ('W')

v3: db 'a',0x55            ; 2 bytes: caractere 'a' (0x61) seguido de 0x55

v4: db 'hello',13,10,'$'   ; String "hello" seguida de CR (13), LF (10) e terminador '$' (formato de string usada por DOS, ex: em `int 21h` função 09h)

v5: dw 0x1234              ; 2 bytes (word) com valor 0x1234 (armazenado como 0x34 0x12 em little-endian)

v6: dw 'a'                 ; 2 bytes: caractere 'a' (0x0061) como uma word (char expandido para 16 bits)

v7: dw 'ab'                ; 2 bytes: os dois caracteres 'a' e 'b' juntos como uma word
                          ; 'a' = 0x61, 'b' = 0x62 → 'ab' = 0x6261 (armazenado como 0x61 0x62 em little-endian)

v8: dw 'abc'               ; 2 bytes com os dois primeiros caracteres 'a' e 'b' (o 'c' é ignorado porque `dw` só armazena 2 bytes)

v9: dd 0x12345678          ; 4 bytes (double word) com o valor 0x12345678 (armazenado como 0x78 0x56 0x34 0x12 em little-endian)

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


