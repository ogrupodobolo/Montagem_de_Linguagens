# 📚 Aula 04 – Tipos, Registradores e Operações

## 🔢 1. Tipos de Dados

### Principais tipos:
- `byte` (8 bits)
- `word` (16 bits)
- `dword` (32 bits)
- `qword` (64 bits)

### Uso em declarações:
```asm
section .data
valor1 db 10
valor2 dw 1000
valor3 dd 100000
valor4 dq 10000000000
```

---

## 🧠 2. Registradores

### Registradores Gerais:
- `RAX`, `RBX`, `RCX`, `RDX`, `RSI`, `RDI`, `RBP`, `RSP`, `R8` a `R15`

### Observações:
- Possuem versões para tamanhos diferentes: `AL` (8 bits), `AX` (16 bits), `EAX` (32 bits), `RAX` (64 bits)

---

## ⚙️ 3. Operações com Registradores

### Movimento:
```asm
mov rax, 10
mov rbx, rax
```

### Aritméticas:
```asm
add rax, 5
sub rbx, rax
mul rbx
```

### Incremento/Decremento:
```asm
inc rcx
dec rcx
```

---

## 🧪 4. Atividade Prática (AT0401)

- Declarar variáveis com diferentes tipos (`db`, `dw`, `dd`, `dq`)
- Realizar operações básicas entre registradores
- Verificar resultados por meio dos registradores

---

## 🧠 5. Dicas Importantes

- Sempre usar tipos compatíveis com os registradores
- Aritmética incorreta pode gerar exceções
- Registradores não armazenam tipos, apenas valores binários

---

## 📚 Conclusão

- Compreender tipos de dados é fundamental
- Registradores são essenciais para manipulação e operações
- Prática com operações básicas é chave para domínio de Assembly

---

## ⏭️ Próxima Aula

- Entrada de dados
- Conversão entre tipos
- Impressão de resultados
