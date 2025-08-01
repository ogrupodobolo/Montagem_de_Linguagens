# Linguagens de Montagem – Aula 11  
## Ponto-Flutuante  
**Professora: Gabriela Stein**  
**Ano letivo: 2024**

---

## Introdução
- **Ponto-Flutuante (Floating-Point - FP)**: formato binário para números reais.
- Notação científica: ±v ∗ B±e  
  - `v`: significando (mantissa é termo depreciado)  
  - `B`: base numérica, geralmente 2  
  - `e`: expoente  
  - `±`: sinal  

---

## Padrões IEEE-754
- **Precisão simples (float)**  
  Exemplo:  
  `3.1415d ≈ 0 10000000 10010010000111001010110`

- **Precisão dupla (double)**  
  Exemplo:  
  `-3.1415d ≈ 1 10000000000 100100100001110010101100...`

Ferramentas:  
- https://www.h-schmidt.net/FloatConverter/IEEE754.html  
- https://baseconvert.com/ieee-754-floating-point  
- http://weitz.de/ieee/

---

## Hardware x86_64 – Gerações

### 1ª Geração – FPU
- Década de 1980, RPN (notação polonesa reversa)
- Registradores FPU (st[0-7])
- Instruções unárias, destino implícito

### 2ª Geração – SSE
- Final da década de 1990
- SIMD (Single Instruction, Multiple Data)
- 16 registradores `xmm0` a `xmm15` de 128 bits
- Instruções escalares e vetoriais

### 3ª Geração – AVX
- Início de 2010
- Registradores `ymm0` a `ymm15` de 256 bits (até 512 com AVX-512)
- Instruções ternárias e vetoriais

---

## Conceitos da Aula
- Operações em ponto-flutuante:
  - Escalares: Conversão, Transferência, Aritmética, Comparação
- Foco: SSE escalar
- Verificar suporte: `lshw -c cpu` (SSE/AVX)

---

## Registradores de FP
- `xmm0` até `xmm15`
  - `xmm0` a `xmm7`: parâmetros
  - `xmm8` a `xmm15`: temporários
  - `xmm0`: retorno de função
- Tamanho definido por instrução:
  - `s` = 32 bits (single)
  - `d` = 64 bits (double)

---

## Instruções de Conversão

### Inteiro → FP
- `CVTSI2SS`: int → float  
- `CVTSI2SD`: int → double

### FP → Inteiro
- `CVTSS2SI`: float → int  
- `CVTSD2SI`: double → int

### FP Single ↔ FP Double
- `CVTSS2SD`: float → double  
- `CVTSD2SS`: double → float

---

## Instruções de Transferência

### Float (32 bits)
- `MOVSS xmmi, xmmj|mem32`
- `MOVSS mem32, xmmi`

### Double (64 bits)
- `MOVSD xmmi, xmmj|mem64`
- `MOVSD mem64, xmmi`

---

## Instruções Aritméticas

### Adição
- `ADDSS`, `ADDSD`, `VADDSS`, `VADDSD`

### Subtração
- `SUBSS`, `SUBSD`, `VSUBSS`, `VSUBSD`

### Multiplicação
- `MULSS`, `MULSD`, `VMULSS`, `VMULSD`

### Divisão
- `DIVSS`, `DIVSD`, `VDIVSS`, `VDIVSD`

### Raiz Quadrada
- `SQRTSS`, `SQRTSD`

---

## Instruções Lógicas (Vetoriais)

### AND
- `ANDPS`, `ANDPD`, `VANDPS`, `VANDPD`

### OR
- `ORPS`, `ORPD`, `VORPS`, `VORPD`

### XOR
- `XORPS`, `XORPD`, `VXORPS`, `VXORPD`

---

## Instruções Comparativas

### Máximo
- `MAXSS`, `MAXSD`, `VMAXSS`, `VMAXSD`

### Mínimo
- `MINSS`, `MINSD`, `VMINSS`, `VMINSD`

### Comparação Escalar
- `COMISS`, `COMISD` (ajusta EFLAGS)

### Tabela de Comparação

| Ordem | CMP Op1, Op2 | ZF | PF | CF | Jcc | Descrição           |
|-------|--------------|----|----|----|-----|----------------------|
| 1     | UNORDERED    | 1  | 1  | 1  | JP  | Op1 é NaN            |
| 2     | EQUAL        | 1  | 0  | 0  | JE  | Op1 == Op2           |
| 3     | GREATER      | 0  | 0  | 0  | JA  | Op1 > Op2            |
| 4     | LESS         | 0  | 0  | 1  | JB  | Op1 < Op2            |

---

## Atividades

### AT1101 – Função `dis3Dlm`
```c
double dis3Dlm(int p1[], int p2[]);
```
- Cálculo da distância entre dois pontos 3D.
- Baseado em `a11e02.asm`

### AT1102 – Função `powlm`
```c
float powlm(float base, int exp);
```
- Leitura de float e int.
- Retorno em `xmm0`.
- `printf` imprime apenas `double`.

---

*Fim da Aula 11 – Ponto-Flutuante*
