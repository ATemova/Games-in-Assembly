; Number Guessing Game in x86 Assembly
section .data
    prompt db 'Guess a number between 1 and 10: ', 0
    correct db 'Correct! You guessed the number.', 0
    wrong db 'Wrong! Try again.', 0
    newline db 10, 0

section .bss
    guess resb 2
    target resb 1

section .text
    global _start

_start:
    ; Generate a random number between 1 and 10
    mov eax, 1        ; syscall number for sys_exit
    int 0x80          ; call kernel
    mov ecx, 10
    xor edx, edx
    div ecx
    mov [target], dl

    ; Print prompt
    mov eax, 4        ; syscall number for sys_write
    mov ebx, 1        ; file descriptor 1 is stdout
    mov edx, 31       ; length of prompt
    lea ecx, [prompt]
    int 0x80

guess_loop:
    ; Read user input
    mov eax, 3        ; syscall number for sys_read
    mov ebx, 0        ; file descriptor 0 is stdin
    lea ecx, [guess]
    mov edx, 2        ; number of bytes to read
    int 0x80

    ; Compare guess with target
    mov al, [guess]
    sub al, '0'
    cmp al, [target]
    je correct_guess
    jne wrong_guess

correct_guess:
    ; Print correct message
    mov eax, 4
    mov ebx, 1
    lea ecx, [correct]
    mov edx, 30
    int 0x80
    jmp end_game

wrong_guess:
    ; Print wrong message
    mov eax, 4
    mov ebx, 1
    lea ecx, [wrong]
    mov edx, 19
    int 0x80
    jmp guess_loop

end_game:
    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80
