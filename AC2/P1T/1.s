.data
newline:    .asciiz "\r"
tab:        .asciiz "\t"

.text
.globl main

main:
    li $s0, 0              # state = 0
    li $s1, 0              # cnt = 0
    li $t0, 1              # UP
    li $t1, 0              # DOWN

loop:
    li $v0, 11             # syscall: print_char
    la $a0, newline        # Carriage return character
    syscall

    li $v0, 1              # syscall: print_int
    move $a0, $s1          # printInt(cnt, ...)
    li $a1, 10
    li $a2, 3
    jal print_format

    li $v0, 11             # syscall: print_char
    la $a0, tab            # Tab character
    syscall

    li $v0, 1              # syscall: print_int
    move $a0, $s1          # printInt(cnt, ...)
    li $a1, 2
    li $a2, 8
    jal print_format

    jal wait_5

    jal inkey
    move $t2, $v0

    li $t3, '+'            # c == '+'
    beq $t2, $t3, set_up

    li $t3, '-'            # c == '-'
    beq $t2, $t3, set_down

check_state:
    bne $s0, $t0, update_down
    addiu $s1, $s1, 1      # cnt = (cnt + 1) & 0xFF
    andi $s1, $s1, 0xFF
    j loop

update_down:
    bne $s0, $t1, loop
    addiu $s1, $s1, -1     # cnt = (cnt - 1) & 0xFF
    andi $s1, $s1, 0xFF
    j loop

set_up:
    move $s0, $t0
    j check_state

set_down:
    move $s0, $t1
    j check_state

wait_5:
    li $a0, 5
    jal wait
    jr $ra

wait:
    li $t4, 515000
    mul $t4, $t4, $a0
    li $t5, 0

wait_loop:
    addiu $t5, $t5, 1
    blt $t5, $t4, wait_loop
    jr $ra

print_format:
    # ... Implemente a função print_format para imprimir os números no formato desejado ...
    # $a0: número, $a1: base, $a2: número de dígitos
    jr $ra

inkey:
    # ... Implemente a função inkey para ler um único caractere sem bloquear ...
    # O caractere lido deve ser retornado em $v0
    jr $ra
