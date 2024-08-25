; Simple Text Adventure Game in x86 Assembly
section .data
    prompt db 'You are in a room. Go north or south? (n/s): ', 0
    north_msg db 'You go north. You find a treasure!', 0
    south_msg db 'You go south. You encounter a monster!', 0
    newline db 10, 0

section .bss
    choice resb 1

section .text
    global _start

_start:
game_loop:
    ; Print prompt
    mov eax, 4
    mov ebx, 1
    lea ecx, [prompt]
    mov edx, 35
    int 0x80

    ; Read choice
    mov eax, 3
    mov ebx, 0
    lea ecx, [choice]
    mov edx, 1
    int 0x80

    ; Process choice
    cmp byte [choice], 'n'
    je north_path
    cmp byte [choice], 's'
    je south_path

    ; Invalid choice
    jmp game_loop

north_path:
    ; Print north message
    mov eax, 4
    mov ebx, 1
    lea ecx, [north_msg]
    mov edx, 30
    int 0x80
    jmp end_game

south_path:
    ; Print south message
    mov eax, 4
    mov ebx, 1
    lea ecx, [south_msg]
    mov edx, 35
    int 0x80
    jmp end_game

end_game:
    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80
