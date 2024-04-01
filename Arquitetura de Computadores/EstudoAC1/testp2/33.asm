# typedef struct
# { Alignment Size Offset
# char smp[10]; 1 10 0
# double av; 8 8 10 -> 16
# int ns; 4 4 24
# char id; 1 1 28
# int sum; 4 4 29->32
# } t_cell; 8 36->40

#Mapa de registos 
# tc = $t0
# size = $t1
# res = $f0
# aux = $f2
# i = $t2

	.data
res: .double 0.0
k1: .double 3.597
	.eqv	smp, 0
	.eqv	av, 16
	.eqv	ns, 24
	.eqv	id, 28
	.eqv	sum, 32
	
	.text
	.globl main
	
main:move	$t1, $a0
	move	$t2, $a1
	l.d f0,res
	  li $t2,0
	  move $t0,$a0
	  move $t1, $a1
for: bge $t2,$t1,endfor
	 l.d $f4,k1
	 add $t0,$t0,$t2
	 lw $t0,ns($t0)
	 mct1 $t0,$f10
	 cvt.d.w $f10.$f10
	 div.d $f2,$f10,$f4
	 add.d $f0,$f0,$f2
	 s.d $f2,av($t0)
	 cvt.w.d $f0,$f0
	 mfc1 $t4,$f0
	 sw $t4,sum($t0)
	 addi $t2,$t2,t_cell
endfor:

	jr $ra