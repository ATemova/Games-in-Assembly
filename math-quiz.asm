; Simple Math Quiz in x86 Assembly (NASM)

section .data
    msg db 'What is 5 + 7? ', 0xA
    msg_len equ $-msg
    correct_msg db 'Correct!', 0xA
    correct_len equ $-correct_msg

section .bss
    answer resb 1

section .text
    global _start

_start:
    ; Print question
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, msg        ; message to write
    mov edx, msg_len    ; message length
    int 0x80            ; call kernel

    ; Read input
    mov eax, 3          ; sys_read
    mov ebx, 0          ; file descriptor (stdin)
    mov ecx, answer     ; buffer
    mov edx, 1          ; buffer size
    int 0x80            ; call kernel

    ; Check if input is '12'
    cmp byte [answer], '12'
    jne wrong
    ; Print correct message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, correct_msg ; message to write
    mov edx, correct_len ; message length
    int 0x80            ; call kernel

wrong:
    ; Exit system call
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; status 0
    int 0x80            ; call kernel
