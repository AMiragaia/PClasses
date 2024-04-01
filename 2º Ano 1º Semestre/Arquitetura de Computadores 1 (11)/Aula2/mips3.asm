.data
.text
.globl main
main:   li $t0,6 # instrução virtual (decomposta
	# em duas instruções nativas)
	srl $t2,$t0,1 #
	xor $t1,$t0,$t2
jr $ra #fim do programa