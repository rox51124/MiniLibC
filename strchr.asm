bits 64 ;compile en 64 bits
global strchr

section .text
strchr:
    mov rax, 0 ;defini valeur retour a 0

.loop:
    cmp byte [rdi], sil ;if rsi == rdi
    je .found ;if found
    cmp [rdi], byte 0 ;if rdi == 0
    je .return ;end of program
    inc rdi ;i++
    jmp .loop ;loop again

.found:
    mov rax, rdi ;return rdi

.return:
    ret ;return