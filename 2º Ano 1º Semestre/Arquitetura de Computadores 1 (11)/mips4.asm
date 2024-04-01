		.data
SIZE:      .word 20
str:       .space 21
prompt:    .asciiz "Introduza uma string: "

		.text
		.globl main
main:
    la $a0, str


    li $v0, 4
    la $a0, prompt
    syscall

  
    li $v0, 8
    la $a0, str
    li $a1, 21
    syscall
while:
    lb $t0, 0($a0)      
    beq $t0, $zero, end 

   
    li $t1, 'a'
    blt $t0, $t1, endw
    li $t1, 'z'
    bgt $t0, $t1, endw

  
    
    li $t1,0x20
    sub $t0, $t0, $t1
    sb $t0, 0($a0)     

endw:
    addi $a0, $a0, 1    
    j while

end:
    
    li $v0, 4
    la $a0, str
    syscall
    jr $ra
