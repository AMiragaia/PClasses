#Mapa de registos
#n_even: $t0
#n_odd: $t1
#p1:	$t2
#p2:	$t3

	.data
	.eqv N,5
	.eqv print_int,1
	.eqv read_int,5
array1: .space 20
array2: .space 20
	.text

	.globl main
main:
	la $t2,array1 #p1 = a
	li $t4,N
	sll $t4,$t4,2
	addu $t4,$t2,$t4 # $t4 = (a+N) 
while:
	bge $t2,$t4,endw
	li $v0,read_int
	syscall
	sw $v0,0($t2)
	addiu $t2,$t2,4
	j while

endw:   la $t3,array2
	la $t2,array1

while1: bge $t2,$t4,endw1
	
if:	lw $t5,0($t2)
	rem $t5,$t5,2
	beq  $t5,0,else
	lw $t5,0($t2)
	sw $t5,0($t3)
	addiu $t3,$t1,4
	addi $t1,$t1,1
	j endif
else:
	addi $t0,$t0,1
	j endif
	
endif:
	addiu $t2,$t2, 4
	j while1
endw1:	la $t3,array2
	sll $t1,$t1,2
	addu $t4,$t3,$t1

while2: bge $t3,$t4,endw2
	lw $a0, 0($t3)
	li $v0,print_int
	syscall
	addiu $t3,$t3,4
	j while2
endw2:	jr $ra
