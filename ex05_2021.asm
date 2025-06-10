section .data
	vet : dw 1, -2, 3, 5, 8, 10
	vetS : dd 6
section .bss
	prod : resw 1 ; uma word
section .text
	global _start
_start:
	; produtório
	; ?????????????????????????????????????????????
	; primeira coisa é iterar pelo vetor
	
	; salvar o endereço do primeiro elemento
	mov ax, [vet];
	; ax = &vet = vet[0] = 1

	mov r8w, 1
	; iniciar o laço para iterar e multiplicar
	; compara se chegou ao final do laço
	; mov dword [vetS], 6
laco:
	;compara 0 com 6
	cmp r8w, [vetS]
	jge _fim
	; mutiplicar elemento por elemento
	; o prox elemento em alguma reg
	
	lea r9, [vet + r8*2] ; salvo vet[1] dps vet[2]....
	mov r10w, [r9]
	imul r10w
	inc r8w
	jmp laco
	
_fim:
	mov rax, 60
	mov rdi, 0
	syscall
