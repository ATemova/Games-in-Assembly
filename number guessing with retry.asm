; Number Guessing with Retry in x86 Assembly (NASM)

section .data
    msg db 'Guess the number (1-10): ', 0xA
    msg_len equ $-msg
    retry_msg db 'Try again!', 0xA
    retry_len equ $-retry_msg

section .bss
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

    ; Read input
    mov eax, 3          ; sys_read
    mov ebx, 0          ; file descriptor (stdin)
    mov ecx, guess      ; buffer
    mov edx, 1          ; buffer size
    int 0x80            ; call kernel

    ; Check if guess is '7'
    cmp byte [guess], '7'
    jne not_correct
    ; Exit system call
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; status 0
    int 0x80            ; call kernel

not_correct:
    ; Print retry message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, retry_msg  ; message to write
    mov edx, retry_len  ; message length
    int 0x80            ; call kernel

    ; Exit system call
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; status 0
    int 0x80            ; call kernel
