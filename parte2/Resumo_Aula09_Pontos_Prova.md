
# Aula 09 - Modos de Endereçamento por Pilha e Passagem de Parâmetros via S.O.

## 📌 Pontos Importantes para a Prova

---

## 🔁 Modos de Endereçamento (revisão)
- **Imediato, Direto, Indireto, por Registrador, Indireto por Registrador, por Deslocamento**
- **Por Pilha** (abordado nesta aula)

---

## 🧱 Endereçamento por Pilha
- Utiliza registrador **RSP (64 bits)** ou **ESP (32 bits)** como ponteiro de topo.
- Instruções principais:
  - `PUSH operando64bits`: armazena na pilha (decrementa RSP)
  - `POP operando64bits`: recupera da pilha (incrementa RSP)
- **Operando fonte é implícito**
- Estrutura **FILO (First-In, Last-Out)**

### ❗ Atenção:
- `PUSH` e `POP` não aceitam operandos de 8 bits (`byte`) ou alguns tamanhos fora do permitido dependendo do modo (32/64 bits)

---

## 💻 Exemplo de Instruções por Pilha
```asm
PUSH rax    ; empilha valor de rax
POP rbx     ; retira da pilha e armazena em rbx
```

---

## 🧾 Uso da Pilha em Sistemas Operacionais
- Utilizada para:
  - Comunicação entre **S.O. e programa**
  - **Passagem de parâmetros por linha de comando**
  - Armazenamento temporário de variáveis locais (ver Aula 10)

---

## 🧑‍💻 Passagem de Parâmetros via Linha de Comando

### Em C:
```c
int main(int argc, char *argv[])
```
- `argc`: número de argumentos
- `argv`: ponteiros para strings (NULL-terminated)

### Em Assembly:
- Argumentos são empilhados
- Primeiro argumento (`argv[0]`) é o nome do programa
- Usar `POP` para extrair ponteiros para as strings:
```asm
POP r15
MOV r8b, [r15 + r9]
CMP r8b, 0  ; verifica NULL
```

---

## 📝 Atividade Sugerida: `lmrename`
- Reimplementação simples do comando `mv` para renomear arquivos:
```bash
$ ./a09at01.x nomeVelho.txt nomeNovo.txt
```
- Utiliza **syscall `0x52` (sys_rename)**.
- Argumentos devem ser extraídos da **pilha** e copiados para variáveis não inicializadas.

---

## 📚 Links e Dicas
- Man page syscall rename: [rename(2)](http://man7.org/linux/man-pages/man2/rename.2.html)
- Strings são terminadas por `\0` (null-char)

---

## 📆 Próxima Aula: Aula 10
- Subprogramas (Procedimentos e Funções)
