bits 64 ;compile en 64 bits
global strcmp

section .text
strcmp:
    mov rcx, 0

.loop:
    mov al, [rdi + rcx] ;rax = [rdi + rcx]
    mov r8b, [rsi + rcx] ;r8b = [rsi + rcx]
    cmp al, r8b ;compare rdi and rsi
    jg .sup ;if > return -1
    jl .inf ;if > return 1
    cmp al, 0 ;look if rdi == 0
    je .return ;if == 0 return 0
    cmp r8b, 0 ;look if rsi == 0
    je .return ;if == 0 return 0
    inc rcx ;i++
    jmp .loop ;loop again

.inf:
    mov rax, -1 ;return -1
    ret

.sup:
    mov rax, 1 ;return 1
    ret

.return:
    mov rax, 0 ;return 0
    ret