# typedef struct
# { Alignment Size Offset
# char smp[10]; 1 10 0
# double av; 8 8 10 -> 16
# int ns; 4 4 24
# char id; 1 1 28
# int sum; 4 4 29 -> 32
# } t_cell; 8 36 -> 40

#Mapa de registos
#size = $a1
#t_cell = $a0
#res = $f0
#aux = $f2
#i = $t0

	.data
k1: .double 0.0
k2: .double 3.597
	.eqv smp,0
	.eqv av,16
	.eqv ns,24
	.eqv id,28
	.eqv sum,32
	.eqv t_cell,40
	.text
	.globl main

main:
    # res = 0.0
    l.d $f0, k1
	
    # i = 0
    li $t0, 0
	# $f4 = 3.597
	l.d $f4,k2
    # Loop through the array of cells
loop:
    beq $t0, $a1, endloop # If i >= size, exit loop
    mul $t1, $t0, 40 # Multiply i by 40 (sizeof(t_cell))
	add $t0,$t0,a0 # tc[i]
    lw $t2,ns($t0) #tc[i].ns
    mtc1 $t2,$f6	
    cvt.d.w $f6,$f6	# (double)tc[i].ns
	div.d $f2,$f6,$f4 #(double)tc[i].ns / 3.597
	add.d $f0,$f0,$f2 # res = res + aux
	l.d $f8,av($t0) #tc[i].av
	mov.d $f8,$f2 # tc[i].av = aux
	lw $t3,sum($t0) #tc[i].sum 
	cvt.w.d $f10,$f0
	mfc1 $t4,$f10 # (int)res
	move $t3,$t4 #tc[i].sum = (int)res
		
	addi $t0,$t0,1
	add $a1,$a1,$t1
		j loop
endloop:
	jr $ra
