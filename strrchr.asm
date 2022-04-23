bits 64 ;compile en 64 bits
global strrchr

section .text
strrchr:
    mov rax, 0 ;rax = 0

.loop:
    cmp byte [rdi], sil ;looking for character
    je .found ;if find
    cmp [rdi], byte 0 ;if rdi == 0
    je .return ;end of program
    inc rdi ;i++
    jmp .loop ;loop again

.found:
    mov rax, rdi ;rax = rdi
    inc rdi ;i++
    cmp [rdi], byte 0 ;if rdi == 0
    je .return ;end of program
    jmp .loop ;loop again

.return:
    ret ;return