#Mapa de registos
#array : $a0 -> $s0
#low : $a1 
#high : $a2 
#i : $t0
#npr : $s1
#p : $s2

	.text
	.globl primes

primes: addiu $sp,$sp,-16 #meter espaço na stack
	sw $ra, 0($sp) #
	sw $s0, 4($sp) #
	sw $s1, 8($sp) #
	sw $s2, 12($sp) # guardar os registos s na stack

	move $s0,$a0 #s0 = array
	move $s1,$zero #s1 = npr, inicializado com 0
	move $s2, $a0 #s2 = p, inicializa com o endereço do array
	addiu $t0,$a1, 1 #t0 = i = low + 1

while: bge $t0,$a2,endw # for (i = low + 1, npr = 0; i < high; i++)
       move $a0,$t0 #prepara o argumento par a função checkp(i)
       jal checkp #chama a função (checkp(i))
if: bne $v0,1,endif 
    sw $t0,0($s0) # *array = i
    addiu $s0,$s0,4  #array++
    addiu $s1,$s1,1 #npr++

endif:
	addiu $t0,$t0,1 #i++
	j while

endw:   sw $s1, 0($s2) # *(p + npr) = npr
	move $v0, $s1 #return npr
	lw $s2, 12($sp) 
	lw $s1, 8($sp)
	lw $s0, 4($sp)
	lw $ra, 0($sp)
	addiu $sp,$sp,16 # pop da stack
	jr $ra

