bits 64 ;compile en 64 bits
global memcpy

section .text
memcpy:
    mov rcx, 0
    mov rax, rdi ;rax = rdi

.loop:
    cmp rdx, rcx ;if rcx == 3 arg(rdx)
    je .return ;end of program
    mov r8b, [rsi + rcx] ;stock str2(rsi) in r8b
	mov [rdi + rcx], r8b ;replace str1(rdi) by str2(rsi)
	inc rcx	;i++
    jmp .loop ;loop again

.return:
    ret ;return