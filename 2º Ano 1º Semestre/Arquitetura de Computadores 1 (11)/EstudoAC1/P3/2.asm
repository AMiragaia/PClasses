# Mapa de registos:
# value:    $t0
# bit:      $t1
# i:        $t2
    .data
str1:   .asciiz "Introduza um numero: "
str2:   .asciiz "\nO valor em binário é:"
    .eqv print_string,4
    .eqv read_int,5
    .eqv print_char,11
    .text
    .globl main
main: 
      la $a0,str1
      li $v0,print_string
      syscall
      
      li $v0,read_int
      syscall
      
      or $t0,$0,$v0
      li $v0,print_string
      la $a0,str2
      syscall
      
      li $t2,0
while: bge $t2,32,endw
       li $t3,0x80000000
       and $t1,$t0,$t3
if: beq $t1,$0,else
    ori  $a0,$0,'1'
    li $v0,print_char
    syscall
    j endif

else:
    ori $a0,$0,'0'
    li $v0,print_char
    syscall

endif: sll $t0,$t0,1
       addi $t2,$t2,1
       j while
endw: jr $ra

