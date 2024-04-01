	.data

	.text
	.global main

main:	ori $t0,$t0,2  #$t0 = 2
		ori $t2,$0,8	#$t2 = 8
		add $t1,$t0,$t0	$t1 = $t0 + $t0
		add $t1,$t1,$t2 $t1 = $t1 + $t2
		jr $ra	#fim do programa
