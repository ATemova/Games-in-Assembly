; Rock, Paper, Scissors game in x86 Assembly (NASM)

section .data
    msg db 'Rock, Paper, Scissors! ', 0xA
    msg_len equ $-msg
    choice db 'Choose R/P/S: ', 0xA
    choice_len equ $-choice

section .bss
    input resb 1

section .text
    global _start

_start:
    ; Print message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, msg        ; message to write
    mov edx, msg_len    ; message length
    int 0x80            ; call kernel

    ; Print choice prompt
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, choice     ; message to write
    mov edx, choice_len ; message length
    int 0x80            ; call kernel

    ; Read input
    mov eax, 3          ; sys_read
    mov ebx, 0          ; file descriptor (stdin)
    mov ecx, input      ; buffer
    mov edx, 1          ; buffer size
    int 0x80            ; call kernel

    ; Exit system call
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; status 0
    int 0x80            ; call kernel
