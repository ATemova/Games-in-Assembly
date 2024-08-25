; Text-Based RPG Battle Simulation in x86 Assembly
section .data
    prompt db 'Choose action: (a)ttack, (h)eal: ', 0
    attack_msg db 'You attack the enemy!', 0
    heal_msg db 'You heal yourself!', 0
    enemy_hit_msg db 'The enemy takes damage!', 0
    player_heal_msg db 'You heal for 10 HP!', 0
    player_health db 'Your health: ', 0
    enemy_health db 'Enemy health: ', 0
    newline db 10, 0

section .bss
    player_hp resb 1
    enemy_hp resb 1
    choice resb 1

section .text
    global _start

_start:
    ; Initialize player and enemy health
    mov byte [player_hp], 100
    mov byte [enemy_hp], 100

game_loop:
    ; Print player and enemy health
    ; Print player's health
    mov eax, 4
    mov ebx, 1
    lea ecx, [player_health]
    mov edx, 15
    int 0x80

    ; Print player's HP value
    mov al, [player_hp]
    movzx eax, al
    call print_number

    ; Print enemy's health
    mov eax, 4
    mov ebx, 1
    lea ecx, [enemy_health]
    mov edx, 15
    int 0x80

    ; Print enemy's HP value
    mov al, [enemy_hp]
    movzx eax, al
    call print_number

    ; Print action prompt
    mov eax, 4
    mov ebx, 1
    lea ecx, [prompt]
    mov edx, 30
    int 0x80

    ; Read action choice
    mov eax, 3
    mov ebx, 0
    lea ecx, [choice]
    mov edx, 1
    int 0x80

    ; Process action choice
    cmp byte [choice], 'a'
    je attack
    cmp byte [choice], 'h'
    je heal

attack:
    ; Player attacks enemy
    mov eax, 4
    mov ebx, 1
    lea ecx, [attack_msg]
    mov edx, 22
    int 0x80

    ; Enemy takes damage
    dec byte [enemy_hp]
    mov eax, 4
    mov ebx, 1
    lea ecx, [enemy_hit_msg]
    mov edx, 21
    int 0x80
    jmp enemy_turn

heal:
    ; Player heals
    mov eax, 4
    mov ebx, 1
    lea ecx, [heal_msg]
    mov edx, 18
    int 0x80

    ; Increase player health
    add byte [player_hp], 10
    mov eax, 4
    mov ebx, 1
    lea ecx, [player_heal_msg]
    mov edx, 19
    int 0x80
    jmp enemy_turn

enemy_turn:
    ; Enemy attacks player
    ; Simplified: Enemy does fixed damage
    sub byte [player_hp], 5
    ; Print result of enemy's attack
    mov eax, 4
    mov ebx, 1
    lea ecx, [enemy_health]
    mov edx, 16
    int 0x80
    jmp check_game_over

check_game_over:
    ; Check if player or enemy is dead
    cmp byte [player_hp], 0
    jl game_over
    cmp byte [enemy_hp], 0
    jl player_wins
    jmp game_loop

player_wins:
    ; Print win message
    ; Print win message here (not shown for brevity)
    jmp end_game

game_over:
    ; Print game over message
    ; Print game over message here (not shown for brevity)
    jmp end_game

print_number:
    ; Print the number in AL as ASCII
    add al, '0'
    mov [num_str], al
    mov eax, 4
    mov ebx, 1
    lea ecx, [num_str]
    mov edx, 1
    int 0x80
    ret

end_game:
    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80

section .bss
    num_str resb 1
