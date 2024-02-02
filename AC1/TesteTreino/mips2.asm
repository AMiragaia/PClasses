#Mapa de Registos
#i:$t0
#v:$t1
#&(val[0]):$t2


	.data
val:	.word	8,4,15,-1987,327,-9,27,16
	.eqv	SIZE 8
	.eqv	print_int10,1
	.eqv	print_char,11
	.eqv	print_string,4
str1:	.asciiz	"Result is: "
	.text
	.globl	main
main:	li	$t0,0		#i=0
	la	$t2,val		#$t2=&val[0]
do:	sll	$t7,$t0,2	#i*4
	add	$t3,$t2,$t7  	#$t3 = &val[i]
	lw	$t1,0($t3)	#v = val[i]
	li	$t9,SIZE
	srl	$t8,$t9,1	#SIZE/2
	sll	$t4,$t8,2	#SIZE/2 *4
	#addu	$t4,$t0,$t8	#$t3=i+SIZE/2
	add	$t5,$t3,$t4	#$t5 = &val[i+SIZE/2]
	lw	$t6,0($t5)	#$t6 = val[i+SIZE/2]
	sw	$t6,0($t3)	#val[i]=val[i+SIZE/2]
	sw	$t1,0($t5)	#val[i+SIZE/2]=v
	addi	$t0,$t0,1	#++i
while:	bge	$t0,$t8,endwh	#while(++i < (SIZE/2))
	j do
endwh:	la	$a0,str1	
	li	$v0,print_string#print_string("Result is: ")
	syscall
	li	$t0,0
do2:	sll	$t1,$t0,2
	add	$t7,$t2,$t1	#$t7=&val[i++]
	lw	$t4,0($t7)	#$t4=val[i++]
	or	$a0,$0,$t4	
	li	$v0,print_int10	#print_int10(val[i++])
	syscall
	ori	$a0,$0,','
	li	$v0,print_char	#print_char(',')
	syscall
while2:	bge	$t0,$t9,endwh2	#while(i<SIZE)
	addi	$t0,$t0,1	#i++
	j do2	
endwh2:	jr	$ra
	
	
    