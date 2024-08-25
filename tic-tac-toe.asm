; Tic-Tac-Toe game in x86 Assembly (NASM)

section .data
    msg db 'Tic-Tac-Toe!', 0xA
    msg_len equ $-msg

section .bss
    board resb 9
    player resb 1

section .text
    global _start

_start:
    ; Print message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, msg        ; message to write
    mov edx, msg_len    ; message length
    int 0x80            ; call kernel

    ; Initialize board
    mov byte [board], ' '
    mov byte [board+1], ' '
    mov byte [board+2], ' '
    mov byte [board+3], ' '
    mov byte [board+4], ' '
    mov byte [board+5], ' '
    mov byte [board+6], ' '
    mov byte [board+7], ' '
    mov byte [board+8], ' '

    ; Game loop (very basic)
game_loop:
    ; Exit system call
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; status 0
    int 0x80            ; call kernel
