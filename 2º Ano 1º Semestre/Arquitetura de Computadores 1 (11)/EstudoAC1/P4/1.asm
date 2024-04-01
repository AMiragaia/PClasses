#Mapa de registos
#num:	$t0
#i:		$t1
#str:	$t2
#str+i:	$t3
#str[i]: $t4
	.data
	.eqv SIZE,20
	.eqv read_string,8
	.eqv print_int10,1
str:	.space 20
	.text
	.globl main

main: 
