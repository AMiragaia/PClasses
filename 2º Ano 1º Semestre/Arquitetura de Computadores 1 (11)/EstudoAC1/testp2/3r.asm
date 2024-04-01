# typedef struct
# { Alignment Size Offset
# char id; 1 1 0
# double av; 8 8 1
# int ns; 4 4 9 -> 12
# char smp[18]; 1 18 16
# int sum; 4 4 34 -> 36
# } t_sample; 8 36 -> 40

#Mapa de registos
# ts : $t0
# nval : $t1
# sum : $f0
# n : $t2
# k : $t3
# acc : $t4
# pu : $t5

	.data
sum: .double 0.0
	.eqv id,0
	.eqv av,1
	.eqv ns,12
	.eqv smp,16
	.eqv sum,36
	.eqv t_sample,40
	.text
	.globl main
	
main: l.d $f0,sum #sum = 0.0
	  li $t4,0 # acc = 0
	  add $t5,$t0,$t1 
	  li $t3,0 #k = 0
for: bge $t0,$t5,endfor
	 lb $t0,ns($t0) # ts ->ns
	 add $t0,$t0,$t3 
for2: bge $t3,$t0,endfor2
	 add $t4,$t4,$t0
	 addi $t3,$t3,1
		j for2
endfor2: sb $t4,sum($t0)
		 mtc1 $t4,$f2
		 cvt.w.d $f0,$f2
		 lb $t0,ns($t0)
		 mtc1 $t0,$f4
		 cvt.w.d $f2,$f4
		 div.d $f2,$f2,$f4
		 s.d $f0,av($t0)
		 l.d $f4,av($t0)
		 add.d $f0,$f0,$f4
		 addi $t0,$t0,t_sample

endfor:	cvt.s.d $f0,$f0
		mfc1 $f0,$v0
		
		jr $ra