; Simple Snake game in x86 Assembly
section .data
    prompt db 'Move (w/a/s/d): ', 0
    newline db 10, 0

section .bss
    snake_pos resb 20
    food_pos resb 2
    direction resb 1

section .text
    global _start

_start:
    ; Initialize snake and food positions
    ; Omitted for brevity

game_loop:
    ; Read user input
    mov eax, 3
    mov ebx, 0
    lea ecx, [direction]
    mov edx, 1
    int 0x80

    ; Move snake
    ; Omitted for brevity

    ; Check for collision
    ; Omitted for brevity

    ; Print the board
    ; Omitted for brevity

    jmp game_loop

end_game:
    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80
