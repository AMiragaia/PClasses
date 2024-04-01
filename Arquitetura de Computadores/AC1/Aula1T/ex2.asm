	.data
	
	.text
	.globl	main
main:	ori $t0,$0,6 # $t0 = x (atribui val_x pelo valor de x pretendido visto que o x está no $t0
	
	ori $t2,$0,8	 # #t2 = 8
	add $t1,$t0,$t0  # $t1 = $t0+$t0 = x +x = 2*x
	sub $t1,$t1,$t2 # $t1 = $t1+$t2 == y = 2x-8
	jr  $ra		#fim do progra