; Counter that counts from 1 to 5 in x86 Assembly (NASM)

section .data
    msg db 'Counting:', 0xA
    msg_len equ $-msg

section .text
    global _start

_start:
    ; Print message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, msg        ; message to write
    mov edx, msg_len    ; message length
    int 0x80            ; call kernel

    ; Counter loop
    mov ecx, 1          ; start from 1
count_loop:
    ; Print the number (simplified, not really printing numbers)
    inc ecx
    cmp ecx, 6
    jl count_loop

    ; Exit system call
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; status 0
    int 0x80            ; call kernel
