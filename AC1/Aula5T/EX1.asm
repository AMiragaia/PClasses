#Mapa de Registos
#i = $t0
#lista = $t1
#lista+i = $t2
	.data
	.eqv SIZE,5
str:	.asciiz "\nIntroduza um numero: "
	.align 2
lista:  .space 20
	.eqv read_int,5
	.eqv print_str,4
	.text
	.globl main
main:	li $t0,0 #i = 0

while:	bge $t0,SIZE,endw #
	lw $a0,str
	li $v0,print_str
	syscall
	li $v0,read_int
	syscall
	la $t1,lista #$t1 = lista (ou &lista[0])
	addu $t2,$t2,$t1 # $t2 = &lista[i]
	sw $v0,0($t2)# lista[i] = read_int();
	addi $t0,$t0,1
	j while

endw:jr $ra
