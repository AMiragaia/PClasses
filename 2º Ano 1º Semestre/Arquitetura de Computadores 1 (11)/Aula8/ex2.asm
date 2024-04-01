









# Mapa de registos
# n: $a0 -> $s0
# b: $a1 -> $s1
# s: $a2 -> $s2
# p: $s3
# digit: $t0
# Sub-rotina intermédia
itoa: 	addiu $sp,$sp,-20 # reserva espaço na stack
	sw $ra,0($sp)
	sw $s0,4($sp) # guarda registos $sx e $ra
	sw $s1,8($sp)
	sw $s2,12($sp)
	sw $s3,16($sp)
	move $s0,$a0 # copia n, b e s para registos
	move $s1,$a1
	move $s2,$a2 # "callee-saved"
	move $s3,$a2 # p = s;
do: # do {
	rem $t0,$s0,$s1
	div $s0,$s0,$s1 #
	jal toascii
	sb $
while:	b?? $s0,... # } while(n > 0);
	sb $0,0($s3) # *p = 0;
	(...) #
	jal strrev # strrev( s );
	(...) # return s;
	lw $ra,0($sp)
	lw $s0,4($sp) # repõe registos $sx e $ra
	lw $s1,8($sp)
	lw $s2,12($sp)
	lw $s3,16($sp)
	addiu $sp,... # liberta espaço na stack
	jr $ra #	