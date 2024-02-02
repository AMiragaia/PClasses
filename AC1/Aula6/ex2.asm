#p : $t1
#pultimo: $t2
	.eqv SIZE,3
	.eqv print_string,4
	.eqv print_char,11
	.data
str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "ponteiros"
array:  .word str1,str2,str3
	.text
	.globl main
main:
     la $t1,array # $t1 = p = &array[0] = array
     li $t0,SIZE
     sll $t0,$t0,2
     aduu $t2,$t1,$t0 #$t2 = pultimo = array + SIZE

for:	bgeu $t1,$t2,endfor
	lw $a0,0($t1)
	li $v0,4
	syscall
	
	li $a0,'\n'
	li $v0,print_char
	syscall
	
	addiu $t1,$t1,4 #i++
	j for
endfor:
	jr $ra