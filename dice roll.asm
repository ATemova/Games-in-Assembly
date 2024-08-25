; Dice Roll Simulator in x86 Assembly (NASM)

section .data
    msg db 'Rolling the dice...', 0xA
    msg_len equ $-msg

section .bss
    roll resb 1

section .text
    global _start

_start:
    ; Print message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, msg        ; message to write
    mov edx, msg_len    ; message length
    int 0x80            ; call kernel

    ; Roll the dice (simulate with a fixed value)
    mov byte [roll], 3  ; example roll

    ; Print roll value (just for simplicity)
    ; Exit system call
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; status 0
    int 0x80            ; call kernel
