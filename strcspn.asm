bits 64 ;compile en 64 bits
global strcspn

section .text
strcspn:
	mov rcx, 0

.loop:
    mov	al, [rdi + rcx] ;rax = [rdi + rcx]
    cmp al, 0 ;look if rdi == 0
    je .not_found ;if == 0 return rcx
    inc rcx ;i++
    mov rdx, 0 ;rdx = 0
    jmp .loop_2 ;call loop_2

.loop_2:
    mov r8b, [rsi + rdx] ;r8b = [rsi + rcx]
    cmp r8b, 0 ;look if rsi == 0
    je .loop ;if not find, compare another cara of the string
    cmp al, r8b ;compare rdi and rsi
    je .found ;cara s2 found in s1
    inc rdx ;j++
    jmp .loop_2 ;loop again

.not_found:
	mov	rax, rcx ;return rcx
	ret

.found:
    sub	rcx, 1 ;rcx - 1
	mov	rax, rcx ;return rcx
	ret