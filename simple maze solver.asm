; Simple Maze Solver in x86 Assembly
section .data
    maze db '11111', 0
         db '1   1', 0
         db '1 1 1', 0
         db '1    1', 0
         db '11111', 0
    prompt db 'Move (W=Up, A=Left, S=Down, D=Right): ', 0
    newline db 10, 0

section .bss
    player_x resb 1
    player_y resb 1
    move resb 1

section .text
    global _start

_start:
    ; Initialize player position
    mov byte [player_x], 1
    mov byte [player_y], 1

maze_loop:
    ; Print maze
    ; Omitted for brevity

    ; Print player position
    ; Omitted for brevity

    ; Read player move
    mov eax, 3
    mov ebx, 0
    lea ecx, [move]
    mov edx, 1
    int 0x80

    ; Process move
    cmp byte [move], 'W'
    je move_up
    cmp byte [move], 'S'
    je move_down
    cmp byte [move], 'A'
    je move_left
    cmp byte [move], 'D'
    je move_right

    jmp maze_loop

move_up:
    dec byte [player_y]
    jmp check_move

move_down:
    inc byte [player_y]
    jmp check_move

move_left:
    dec byte [player_x]
    jmp check_move

move_right:
    inc byte [player_x]
    jmp check_move

check_move:
    ; Check if the move is valid
    ; Omitted for brevity

    ; Check for win condition
    cmp byte [player_x], 3
    cmp byte [player_y], 3
    je win

    ; Continue the loop
    jmp maze_loop

win:
    ; Print win message
    ; Omitted for brevity

end_game:
    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80
