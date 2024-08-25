; Guess the Number game in x86 Assembly (NASM)

section .data
    msg db 'Guess a number between 1 and 10: ', 0xA
    msg_len equ $-msg
    correct db 'Correct!', 0xA
    correct_len equ $-correct

section .bss
    guess resb 1
    answer resb 1

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

    ; Check if guess is '5'
    cmp byte [guess], '5'
    jne not_correct
    ; Print correct message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, correct    ; message to write
    mov edx, correct_len ; message length
    int 0x80            ; call kernel

not_correct:
    ; Exit system call
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; status 0
    int 0x80            ; call kernel
