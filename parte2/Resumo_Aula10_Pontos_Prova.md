
# Aula 10 - Sub-rotinas, Funções e Procedimentos (x64)

## 📌 Pontos Importantes para a Prova

---

## 🔁 Conceitos Fundamentais

### O que são Sub-rotinas?
- Também chamadas de **funções ou procedimentos**.
- São **chamadas pelo programa principal** para executar tarefas específicas.
- Utilizam protocolo de chamada e retorno:
  - x86 → uso da **pilha** (não abordado)
  - x64 → uso de **registradores + pilha**

---

## 📥 Instruções: CALL e RET
- `CALL label`:
  - Empilha endereço de retorno e desvia execução.
- `RET`:
  - Desempilha endereço e retorna execução.

> ⚠️ O topo da pilha **deve conter** o endereço de retorno.

---

## 📐 Convenção de Chamadas (x64)

### Chamador (caller)
1. **Salvar registradores temporários** (caller-saved): RAX, RCX, RDX, R8–R11
2. **Passar argumentos**:
   - Até 6 via registradores: RDI, RSI, RDX, RCX, R8, R9
   - Restante via pilha
3. Usar `CALL`
4. **Após retorno**:
   - Remover parâmetros da pilha (se houver)
   - Recuperar caller-saved registers

### Chamado (callee)
1. Criar stack frame (`push rbp`, `mov rbp, rsp`)
2. Alocar variáveis locais na pilha (`sub rsp, ...`)
3. **Salvar registradores preservados**: RBX, RBP, RDI, RSI, R12–R15
4. Colocar retorno em **RAX**
5. Restaurar registradores salvos
6. Desalocar variáveis (`mov rsp, rbp`)
7. Restaurar base (`pop rbp`)
8. Retornar com `RET`

---

## 🧪 Exemplo: Função `strLength`
```asm
mov rdi, strTeste1    ; parâmetro
call strLength        ; chamada
mov [str1L], eax      ; resultado
```

---

## 🧱 Organização em Múltiplos Arquivos
- Criar sub-rotinas em arquivos separados.
- Incluir com:
```asm
%include "arquivo.asm"
```

---

## 🔗 Chamadas a Funções Externas (como C)
- Declarar com `extern nome`
- Usar `CALL nome`
- Protocolo segue convenção da arquitetura (ex: RDI, RSI, ...)

---

## 🧾 Exemplo: `printf` em Assembly x64
```asm
xor rax, rax          ; 0 float args
mov rdi, strCtrl
lea rsi, [str1]
call printf
```
Compilar:
```bash
nasm -f elf64 arquivo.asm
gcc -m64 -no-pie arquivo.o -o executavel.x
```

---

## 🧠 Atividades para Estudo

### 🧩 a10at01
- Chamar `strLength(char*[])` para `strTeste2` e `strTeste3`
- Armazenar em `str2L` e `str3L`

### 🔤 a10at02
- Criar funções:
  - `upperCase(char*[])`
  - `lowerCase(char*[])`
- Verifica se string começa com maiúscula ou minúscula.
- Utiliza `scanf`, `printf` e chamadas condicionais.

### 🧮 a10at03
- Calcular **fatorial recursivo**
- Função: `int fatRec(int i)`
- Entrada via teclado, resultado mostrado no terminal.

---

## ✅ Dicas Gerais
- RAX armazena retorno
- Registradores devem ser restaurados após uso
- Stack frame é obrigatório no x64
- Cuidado com uso correto de `CALL`, `RET`, e ordem de `PUSH/POP`

---

## 📆 Próximos tópicos
- Ponto flutuante, funções com parâmetros flutuantes (XMM0, etc.)
- Funções recursivas mais complexas

