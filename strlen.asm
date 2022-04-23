bits 64 ;compile en 64 bits
global strlen

section .text
strlen:
    mov rax, -1

.loop:
    inc rax ; counter++
    cmp byte [rdi + rax], 0 ; check if curr byte == \0
    jne .loop ; return to loop's begining if cmp != true
    ret ; return