# Mapa de registos
# num: $t0
# p: $t1
# *p: $t2 (Registo temporário para guardar o valor armazenado na posição de memória p)
	.data
	.eqv SIZE,20
str:	.space	21	# SIZE + 1
	.text
	.globl main
	
main:	la	$a0,str	#$a0 = &str[0]
	li	$a1,SIZE
	li	$v0,8	
	syscall		#read_string(str,SIZE)
	li	$t0,0	#num=0
	la 	$t1,str # p = str;
while: # while(*p != '\0')
	lb 	$t2,0($t1) #$t2=*p
	beq 	$t2,0,endw # {
if:	blt 	$t2,'0',endif # if(str[i] >='0' &&
	bgt 	$t2,'9',endif # str[i] <= '9')	
	addi 	$t0,... # num++;
endif:	addiu $t1,$t1,1 # p++;
	j	while # }
endw:   or	$a0,$0,$t0
	ori	$v0,$0,1
	syscall # print_int10(num);
	jr $ra # termina o programa