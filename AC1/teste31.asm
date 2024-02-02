#Mapa de registos
#i = $t0
#max1 = $t1
#max2 = $t2

	.data
	.text
array:	.space 20
	.eqv SIZE,5
.globl main
	li $t0,0
	li $t1,1
	sll $t1,$t1,31 #
	ori $t2,$t1,0 # max2 = max1
	la $t3,array
	li $t4,SIZE
	mul $t4,$t4,4
for: bge $t0,$t4,endf
     addi $t3,$t3,$t0 #$t3 = &array[i]
     lw $t5,0($t3)	#$t5 = array[i]

if:  blt $t5,$t1,else
     ori $t2,$t1,0
     ori $t1,$t5,0
     addi $t0,$t0,4
endif:	j for

else1:
	ble $t5,$t2,for
	bge $t5,$t1,for
	ori $t2,$t5,0
	addi $t0,$t0,4
	j for
endf: jr $ra

