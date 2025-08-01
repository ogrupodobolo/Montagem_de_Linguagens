# Linguagens de Montagem – Aula 12  
## Instruções Vetoriais SSE  
**Professora: Gabriela Stein**  
**Ano letivo: 2024**

---

## Introdução
- Continuação da aula de ponto flutuante.
- SSE é evolução de MMX.
- Trabalha com instruções vetoriais SIMD (Single Instruction, Multiple Data).
- Tipos empacotados:
  - 1 int 64b
  - 2 int 32b
  - 4 int 16b
  - 8 int 8b

---

## SSE e AVX
- SSE:
  - Packed Single (4 floats - 128b)
  - Packed Double (2 doubles - 128b)
  - Vários tipos de inteiros empacotados
- AVX:
  - Os mesmos tipos do SSE, mas em 256b ou 512b
  - Operações otimizadas

---

## Registradores
- SSE (xmm0–xmm15): 128 bits
- AVX (ymm0–ymm15): 256 bits
- Em 64 bits: 16 registradores

---

## Instruções de Transferência

### MOVD / MOVQ
- Copia 1 ou 2 inteiros entre registradores ou memória.

### MOVDQA / MOVDQU
- `MOVDQA`: alinhado (requere alinhamento 16b)
- `MOVDQU`: desalinhado (sem alinhamento, mas menos eficiente)

### VMOVDQA / VMOVDQU
- Versões AVX de 256 bits

---

## Transferência de FP

### MOVLPS / MOVAPS / MOVUPS
- MOVLPS: 2 floats (64 bits)
- MOVAPS: 4 floats alinhado
- MOVUPS: 4 floats desalinhado

### VMOVAPS / VMOVUPS
- Versões AVX com 8 floats (256 bits)

### MOVAPD / MOVUPD / VMOVAPD / VMOVUPD
- Equivalentes para double precision

---

## Instruções de Conversão

### Inteiros para FP
- `CVTPI2PS`, `VCVTDQ2PS`: para float
- `CVTPI2PD`: para double

### FP para Inteiros
- `CVTPS2DQ`, `VCVTPS2DQ`: float → int
- `CVTPD2DQ`, `VCVTPD2DQ`: double → int

### FP para FP
- `CVTPS2PD`, `VCVTPS2PD`: float → double
- `CVTPD2PS`, `VCVTPD2PS`: double → float

---

## Instruções Aritméticas

### Inteiros
- `PADDB`, `PADDW`, `PADDD`, `PADDQ`: adição
- `PSUBB`, `PSUBW`, `PSUBD`, `PSUBQ`: subtração
- `PMULDQ`, `PMULUDQ`: multiplicação (atenção aos caveats)

### FP Single (SP)
- `ADDPS`, `VADDPS`
- `SUBPS`, `VSUBPS`
- `MULPS`, `VMULPS`
- `DIVPS`, `VDIVPS`

### FP Double (DP)
- `ADDPD`, `VADDPD`
- `SUBPD`, `VSUBPD`
- `MULPD`, `VMULPD`
- `DIVPD`, `VDIVPD`

---

## Outras Instruções

### VZEROALL / VZEROUPPER (AVX)
- Zera registradores

### HADDPS / HADDPD (SSE3)
- Soma horizontal de elementos empacotados

---

## Exemplos
- `a12e01.asm` – Inteiros empacotados
- `a12e02.asm` – Ponto flutuante SP/DP
- `a12e03.asm` – Conversões
- `a12e04.asm` – Aritmética de inteiros
- `a12e05.asm` – Aritmética de ponto flutuante

---

*Fim da Aula 12 – Instruções Vetoriais SSE*
