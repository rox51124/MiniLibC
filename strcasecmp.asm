bits 64 ;compile en 64 bits
global strcasecmp

section .text
strcasecmp:
    mov rcx, -1

.loop:
    inc rcx ;i++
    mov al, [rdi + rcx] ;rax = [rdi + rcx]
    mov r8b, [rsi + rcx] ;r8b = [rsi + rcx]
    cmp al, 0 ;look if rdi == 0
    je .diff ;if == 0 return diff
    cmp r8b, 0 ;look if rsi == 0
    je .diff ;if == 0 return diff
    jmp .conv ;call conv

.continue:
    cmp al, r8b ;compare rdi and rsi
    jne .diff ;call return diff
    cmp al, 0 ;look if rdi == 0
    je .return ;if == 0 return
    jmp .loop ;loop again

.conv:
    cmp al, 'A' ;compare rdi and A
    jl .conv_2 ;if inf call conv_2
    cmp al, 'Z' ;compare rdi and Z
    jg .conv_2 ;if sup call conv_2
    add al, 32 ;rdi + 32, conv maj in min

.conv_2:
    cmp r8b, 'A' ;compare rsi and A
    jl .continue ;if inf call continue
    cmp r8b, 'Z' ;compare rdi and Z
    jg .continue ;if sup call continue
    add r8b, 32 ;rdi + 32, conv maj in min
    jmp .continue ;call continue

.diff:
    sub al, r8b ;rdi - rsi
    movsx rax, al ;return rdi
	ret

.return:
    mov rax, 0 ;return 0
    ret