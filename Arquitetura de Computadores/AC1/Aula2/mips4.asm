.data
.text
.globl main
main:   li $t0,6 # instrução virtual (decomposta
	# em duas instruções nativas)
	or $t1,$0,$t0
	
	srl $t3,$t0,4
	xor $t0,$t0,$t3
	
	srl $t4,$t0,2
	xor $t0,$t0,$t4
	
	srl $t5,$t0,1
	xor $t0,$t0,$t5
	
	
	or $t2,$0,$t0
jr $ra #fim do programa