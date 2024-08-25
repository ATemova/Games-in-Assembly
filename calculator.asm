; Simple Calculator in x86 Assembly
section .data
    prompt db 'Enter a number: ', 0
    result db 'Result is: ', 0
    newline db 10, 0

section .bss
    num1 resb 4
    num2 resb 4
    result_num resb 4

section .text
    global _start

_start:
    ; Print prompt
    mov eax, 4
    mov ebx, 1
    lea ecx, [prompt]
    mov edx, 16
    int 0x80

    ; Read first number
    mov eax, 3
    mov ebx, 0
    lea ecx, [num1]
    mov edx, 4
    int 0x80

    ; Read second number
    mov eax, 4
    mov ebx, 1
    lea ecx, [prompt]
    mov edx, 16
    int 0x80

    ; Perform addition
    mov al, [num1]
    sub al, '0'
    mov bl, [num2]
    sub bl, '0'
    add al, bl
    add al, '0'

    ; Print result
    mov eax, 4
    mov ebx, 1
    lea ecx, [result]
    mov edx, 12
    int 0x80

    mov eax, 4
    mov ebx, 1
    lea ecx, [result_num]
    mov edx, 2
    int 0x80

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80
