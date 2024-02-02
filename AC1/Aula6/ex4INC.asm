#$t0 : i
#$a0 : argc
#$a1 : argv
	.eqv SIZE,3
	.eqv print_string,4
	.eqv print_char,11
	.data
	.text
	.globl main
main:
        move $t0, $a0
     	la $t0,str1 # $t1 = &array[0]
	li $v0,4
	syscall #print_str("nr de ....")	
	
	jr $ra