# 📚 Aula 01 – Introdução às Linguagens de Montagem

## 👾 1. Níveis de Linguagem

- **Linguagem de Máquina**: é binária e executada diretamente pelo hardware.
- **Linguagem de Montagem (Assembly)**: representação textual próxima da máquina (1 instrução Assembly → 1 instrução de máquina).
- **Linguagens de Alto Nível (ex: C, Python)**: mais abstratas, fáceis para humanos, mas requerem compiladores para serem convertidas à máquina.

---

## 🧩 2. Exemplo Comparativo

### Código C:
```c
int main() {
    puts("Ola");
    return 0;
}
```

### Código Assembly:
```asm
section .data
strOla : db "Ola", 10
strOlaL: equ $ - strOla

section .text
global _start

_start:
    mov rax, 1
    mov rdi, 1
    lea rsi, [strOla]
    mov edx, strOlaL
    syscall

    mov rax, 60
    mov rdi, 0
    syscall
```

---

## 💡 3. Por que estudar Assembly?

- Entender a execução das instruções na CPU.
- Compreender como dados são representados na memória.
- Melhorar a compreensão e desempenho ao programar em linguagens de alto nível.
- Entender a interação com o sistema operacional.
- Conhecer a arquitetura do computador (ex: x86_64).

---

## 🏛️ 4. Arquitetura de Computadores (Von Neumann)

### Componentes principais:
- **Memória (Armazenamento)**: guarda programas, dados e SO; cada posição tem 1 byte e endereço único.
- **Unidade de Processamento (CPU)**:
  - Program Counter (PC)
  - Instruction Decoder (ID)
  - Registradores (GP, MAR, MBR)
  - Unidade Lógica e Aritmética (ULA)
- **Barras de comunicação (barramento)**: movem os dados internamente.

---

## 🔧 5. Montador NASM

- **NASM (Netwide Assembler)**:
  - Sintaxe Intel (mais legível).
  - Compatível com Windows/Linux.
  - Suporte a 32 e 64 bits.
  - Site oficial: [nasm.us](https://www.nasm.us)

---

## 🛠️ 7. Compilação e Execução em Assembly

```bash
nasm -f elf64 hello.asm
ld hello.o -o helloS.x
./helloS.x
```

- O prefixo `./` indica execução no diretório atual.
- `echo $?` mostra o código de saída do programa.

---
