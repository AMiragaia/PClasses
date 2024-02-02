#Mapa de registos
# array = $t0
# low = $t1
# high = $t2
# i = $s0
# p = $t3
# npr = $t4

	.data
	.text
	.globl main


main:
	addiu $sp,$sp,-8
	sw $ra,0($sp)
	sw $s0,4($sp)
	move $t2,$a2
	move $t1,$a1
	move $t0,$a0
	move $t5,$s0
	
	li $t4,0
	addi $t5,$t1,1
for: bge $t5,$t2,endfor
	move $a0,$t5
	jal checkp
if: bne $v0,1,endif
	sw $t5,0($t0)
	addi $t0,$t0,4
	addi $t4,$t4,1
endif: addi $t5,$t5,1
	j for
endfor:
	add $t6,$t3,$t4
	sw $t4,0($t6)
	move $v0,$t4
	
	lw $ra,0($sp)
	lw $s0,4($sp)
	addiu $sp,$sp,8
	jr $ra