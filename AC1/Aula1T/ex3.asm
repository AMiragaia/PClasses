	.data
	.text
	.globl	main
main:	ori $v0,$0,5 # chama o read_int() e passa esse valor para o $0
	syscall
	or $t0,$0,$v0
	
	ori $t2,$0,8	 # #t2 = 8
	add $t1,$t0,$t0  # $t1 = $t0+$t0 = x +x = 2*x
	sub $t1,$t1,$t2 # $t1 = $t1+$t2 == y = 2x-8
	
	or $a0,$0,$t1
	ori $v0,$0,1
	syscall		#chama o sycall print_int10()
	
	or $a0,$0,$t1
	ori $v0,$0,34
	syscall		#chama o syscall print_int16()
	
	or $a0,$0,$t1
	ori $v0,$0,36
	syscall		#chama o syscall print_intu10()
	jr  $ra		#fim do progra