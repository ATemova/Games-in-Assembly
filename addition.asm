; Simple Addition Calculator in x86 Assembly (NASM)

section .data
    msg db 'Adding 2 + 3...', 0xA
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

    ; Perform addition
    mov eax, 2          ; first number
    add eax, 3          ; second number
    ; The result is now in EAX register

    ; Exit system call
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; status 0
    int 0x80            ; call kernel
