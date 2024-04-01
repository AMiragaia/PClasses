 .equ resetCoreTimer, 12
.equ readCoreTimer, 11
.equ putChar, 3
.equ printInt, 6

.data
newline: .asciiz "\r"
space:   .asciiz " "

.text
.globl main
main:
    li $t0, 0  # cnt1 = 0
    li $t1, 0  # cnt5 = 0
    li $t2, 0  # cnt10 = 0

loop:
    li $a0, 1  # 1ms
    jal delay

    li $v0, putChar
    la $a0, newline
    syscall

    addiu $t0, $t0, 1  # cnt1++

    li $t3, 5
    mul $t4, $t0, $t3
    rem $t5, $t4, $t3
    bne $t5, $0, skip_cnt5
    addiu $t1, $t1, 1  # cnt5++

skip_cnt5:
    li $t6, 10
    mul $t7, $t1, $t6
    rem $t8, $t7, $t6
    bne $t8, $0, skip_cnt10
    addiu $t2, $t2, 1  # cnt10++

skip_cnt10:
    li $v0, printInt
    move $a0, $t2
    li $a1, 10
    li $a2, 5
    jal print_format

    li $v0, putChar
    la $a0, space
    syscall

    li $v0, printInt
    move $a0, $t1
    li $a1, 10
    li $a2, 5
    jal print_format

    li $v0, putChar
    la $a0, space
    syscall

    li $v0, printInt
    move $a0, $t0
    li $a1, 10
    li $a2, 5
    jal print_format

    li $v0, putChar
    la $a0, space
    syscall

    j loop

delay:
    li $v0, resetCoreTimer
    syscall
    move $t9, $v0

delay_loop:
    li $v0, readCoreTimer
    syscall
    mul $a1, $a0, 20000
    blt $v0, $a1, delay_loop
    jr $ra

print_format:
    # ... Implemente a função print_format para imprimir os números no formato desejado ...
    # $a0: número, $a1: base, $a2: número de dígitos
    jr $ra