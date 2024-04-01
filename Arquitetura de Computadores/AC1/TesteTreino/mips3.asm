#Mapa de registos
# $t0 - n_even
# $t1 - n_odd
# $t2 - p1
# $t3 - p2

 .data
 .eqv N,35
 .eqv read_int,5
 .eqv print_int10,1
 .align 2
 a : .space 140 #n_even=0
 b : .space 140 #n_odd=0
 .text
 .globl main
 main: li $t0,0 #n_even = 0
       li $t1,0 #n_odd = 0
       la $t2,a #p1 = &a[0]
       li $t4,N
       sll $t5,$t4,2
       addu $t5,$t2,$t5
for:	bge	$t2,$t5,endfor	#for(p1=a;p1<(a+N);p1++){
	li	$v0,read_int	
	syscall
	sw	$v0,0($t2)	#*p1=read_int()
	addi	$t2,$t2,4	#p1++
	j	for
endfor:	la	$t2,a		#p1=a
	la	$t3,b		#p2=b
for2: bge $t2,$t5,endfor2
      lw $
      
      rem $t8,$t9,2
if: beq $t8,0,else
    sw $t9,0($t3)
    addi $t3,$t3,4
    addiu $t1,$t1,0
    j endif
else:
     addiu $t0,$t0,1 
     j endif
endif: addi $t2,$t2,4
     j endfor2
endfor2:
      la $t3,c
      sll $t1,$t1,2
      addu $t1,$t1,$t3
for2: bge $t3, $t1,endfor3
      lw $a0,0($t2)
      li $v0,print_int10
      syscall
      addi $t3,$t3,4
      j for3
      
endfor3: jr $ra
      
     
                 