; Guess the Number Game in x86 Assembly
section .data
    prompt db 'Guess a number between 1 and 100: ', 0
    correct db 'Correct! You guessed the number.', 0
    wrong db 'Wrong! Try again.', 0
    newline db 10, 0

section .bss
    guess resb 3
    target resb 1

section .text
    global _start

_start:
    ; Generate a random number between 1 and 100
    mov eax, 1
    int 0x80
    mov ecx, 100
    xor edx, edx
    div ecx
    mov [target], dl

    ; Print prompt
    mov eax, 4
    mov ebx, 1
    lea ecx, [prompt]
    mov edx, 36
    int 0x80

    ; Guess loop
guess_loop:
    ; Read user input
    mov eax, 3
    mov ebx, 0
    lea ecx, [guess]
    mov edx, 3
    int 0x80

    ; Convert guess to integer
    mov al, [guess]
    sub al, '0'
    mov bl, al
    mov al, [guess + 1]
    sub al, '0'
    imul bl, 10
    add bl, al

    ; Compare guess with target
    mov al, [target]
    cmp bl, al
    je correct_guess

    ; Print wrong message
    mov eax, 4
    mov ebx, 1
    lea ecx, [wrong]
    mov edx, 19
    int 0x80
    jmp guess_loop

correct_guess:
    ; Print correct message
    mov eax, 4
    mov ebx, 1
    lea ecx, [correct]
    mov edx, 30
    int 0x80

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80
