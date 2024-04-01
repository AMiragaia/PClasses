 	.data
str1:	.asciiz "Introduza.."
str2:	.asciiz "Valor.."
str3:	.asciiz "A soma.."
	.text
	.globl main
	
#Mapa registos
# soma $t0
# value $t1
# i	$t2
main:	li 	$t2,0 #i=0
	li	$t0,0 #soma=0
for:	bge	$t2,5,endf	# while (i < 5){
	la	$a0,str1
	li 	$v0,4
	syscall			#print_str("Introduz....")
	li	$v0,5
	syscall			
	or	$t1,$0,$v0	#value = read_int()
	#move	$t1,$v0
if:	ble	$t1,0,else	#if(value > 0)
	add	$t0,$t0,$t1	#soma+=value
	j	endif
else:	
	la	$a0,str2
	li 	$v0,4
	syscall		
endif:	addi $t2,$t2,1	# i++
	j	for	
		
endf:	la	$a0,str3
	li 	$v0,4
	syscall	
	or $a0,$t0,$0
	li $v0,1
	syscall
	jr $ra
	
