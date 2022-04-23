bits 64 ;compile en 64 bits
global memmove

section .text
memmove:
    mov rcx, 0

.loop:
    cmp rdx, rcx ;if rcx == 3 arg(rdx)
    je .loop_2 ;call loop_2
    mov r8b, [rsi + rcx] ;stock str2(rsi) in r8b
	inc rcx	;i++
    push r8 ;savegarde r8
    jmp .loop ;loop again

.loop_2:
    cmp rcx, 0 ;look if rcx == 0
    je .return ;if == 0 return rdi
    dec rcx ;pars de la fin pour afficher les cara
    pop r8 ;affiche r8
    mov [rdi + rcx], r8b ;replace str1(rdi) by str2(rsi)
    jmp .loop_2 ;loop again

.return:
    mov rax, rdi ;rax = rdi
    ret ;return