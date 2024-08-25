; Hangman game (simplified) in x86 Assembly (NASM)

section .data
    msg db 'Hangman!', 0xA
    msg_len equ $-msg

section .bss
    word resb 20
    guess resb 1

section .text
    global _start

_start:
    ; Print message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, msg        ; message to write
    mov edx, msg_len    ; message length
    int 0x80            ; call kernel

    ; Initialize word (hardcoded)
    mov byte [word], 'H'
    mov byte [word+1], 'A'
    mov byte [word+2], 'N'
    mov byte [word+3], 'G'
    mov byte [word+4], 'M'
    mov byte [word+5], 'A'
    mov byte [word+6], 'N'

    ; Exit system call
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; status 0
    int 0x80            ; call kernel
