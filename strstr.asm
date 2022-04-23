bits 64 ;compile en 64 bits
global strstr

section .text
strstr:
	mov	rcx, 0

.loop:
    mov	al, [rdi + rcx] ;rax = [rdi + rcx]
	mov	r8b, [rsi + rcx] ;r8b = [rsi + rcx]
	cmp	r8b, 0 ;look if rsi == 0
	je	.found ;if == 0 return rdi
	cmp	al, r8b ;compare rdi and rsi
	jne	.check ;call check if diff
	inc	rcx ;i++
	jmp	.loop ;loop again

.check:
	cmp	al, 0 ;look if rdi == 0
	je	.not_found ;if == 0 return 0
    inc rdi ;i++
	mov	rcx, 0 ;rcx = 0
	jmp	.loop ;loop again

.not_found:
	mov	rax, 0 ;return 0
	ret

.found:
	mov rax, rdi ;return rdi
	ret