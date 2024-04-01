#Mapa de Registos
#num : $t0
#i : $t1
#order : $t2


.data
.text
.eqv read_int,1
.eqv print_int,2
.eqv print_string,3
.ascii str1,"Enter a number: "
.ascii str2,"No set  bits\n"
.globl main
	li $v0,print_string
	lw $a0,str1
	syscall
	li $v0,read_int
	syscall
	mv $a0,$t0	#num = read_int()
	li $t1,0	#i=0
	
while:	bgt $t1,32,endw #while(i <32)
	andi $t0,1,$t3
	benq $t3,1,endif  # if ((num & 1) == 1)
	ori $t3,$t3,$t2 #order = i

endif:
	srl $t0,$t4,1 #num = num >> 1
	ori $t4,$t4,$t0
	addi $t1,1 #i++
	j while
endw:

if: beq $t2,-1,else # if (order != -1)
    li $v0,print_int
    mv $t2,$a0
    syscall #print_int10(order);
else:
   li $v0,print_string #else
   mv $a0,str2
   syscall	#print_string("No set bits\n");

jr $ra
