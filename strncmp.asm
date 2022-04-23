bits 64 ;compile en 64 bits
global strncmp

section .text
strncmp:
    mov rcx, 0

.loop:
    cmp rdx, rcx ;if rcx == 3 arg(rdx)
    je .return ;end of program
    mov al, [rdi + rcx] ;rax = [rdi + rcx]
    mov r8b, [rsi + rcx] ;r8b = [rsi + rcx]
    cmp al, r8b ;compare rdi and rsi
    jne .diff ;call return diff
    cmp al, 0 ;look if rdi == 0
    je .return ;if == 0 end of program
    cmp r8b, 0 ;look if rsi == 0
    je .return ;if == 0 end of program
    inc rcx ;i++
    jmp .loop ;loop again

.diff:
    sub	al, r8b ;rdi - rsi
	movsx rax, al ;rax = al
	ret

.return:
    mov rax, 0 ;return 0
    ret