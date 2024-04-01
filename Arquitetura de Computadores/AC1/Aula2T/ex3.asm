	.data
str1:.asciiz "Introduza 2 numeros \n"
str2: .asciiz "A soma dos dois numeros e:"
	.eqv print_string,4
	.eqv read_int,5
	.eqv print_int10,1

	.text
	.globl main
main: 	la $a0,str1
	ori $v0,$0,print_string
	syscall #print_string(str1);
	or  $v0,$0,$t0
	ori $v0,$0,read_int
	syscall
	or $v0,$0,$t1 #$t0 = read_int()
	ori $v0,$0,read_int 
	syscall
	add $t2,$t1,$t0
	la $a0,str2
	ori $v0,$0,print_string
	syscall #print_string(str1);
	or $a0,$0,$t2
	ori $v0,$0,print_int10
	
	syscall
	jr $ra
	
