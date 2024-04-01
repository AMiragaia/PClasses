	.data
	.text
	.globl main
main:	ori $t0,$0,1 # atribui ao $t0 o valor 1
	ori $t1,$0,0 # atribui ao $t1 o valor 2
	and $t2,$t0,$t1  # $t2 = $t0 & $t1 (and bit a bit)
	or  $t3,$t0,$t1	 # $t3 = $t0 | $t1 (or bit a bit)
	nor $t4,$t0,$t1	 # $t4 = $t0 nor $t1
	xor $t5,$t0,$t1	 # $t5 = $t0 xor $t1
	nor $t6,$t0,$t1
	jr $ra