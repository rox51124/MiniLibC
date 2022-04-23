bits 64 ;compile en 64 bits
global memset

section .text
memset:
    mov rax, rdi ;set valeur retour
    mov rcx, -1

.loop:
    inc rcx ;i++
    cmp rdx, rcx ;if rcx == 3 arg(rdx)
    je .return ;end of program
    mov [rdi + rcx], sil ;[rdi + rcx] = rsi
    jmp .loop ;loop again

.return:
    ret ;return