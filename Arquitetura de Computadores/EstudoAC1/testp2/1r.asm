#Mapa de registos
#argc : $s0
#argv : $s1
#i : $s2
#p : $t0

	.data
	.eqv SIZE,20
	.eqv print_float
	.eqv print_string
fla: .space,80
str1: .asciiz "Invalid argc"
	.text
	.globl main
	
main: addi $sp,$sp,-16 #aloca espaço na stack
	  lw $ra,0($sp)
	  lw $s0,4($sp)
	  lw $s1,8($sp)
	  lw $s2,12($sp)
	  
	  li $t1,0 # i = 0
	  move $s2,$t1 #i = $s2
	  move $s0,$a0 #argc = $s0
	  move $s1,$a1 #argv = $s1
	  la $t0,fla 
	  lw $t0,0($t0)# float *p = fla
	  
if: ble $s0,1,else
	bgt $s0,SIZE,else
for: bge $t1,$s0,endfor
	 addi $s1,$s1,$t1 # argv[i] (não se pode alterar os $s supostamente
	 addi $a1,$a1,10 # 10
	 move $a0,$s1 
	 jal tof
	 move $t0,$v0 # *p = tof(argv[i],10)
	 addi $t1,$t1,1 # i++
	 addi $t0,$t0,4 #p++
	 j for
endfor:la $a0,fla
	   move $a1,$s0
	   jal aver
	   move $a0,$v0
	   li $v0,print_float
	   syscall # print_float( aver(fla,argc));
	   j endif
else: la $a0,str1
	  li $v0,print_string
	  syscall # print_string("Invalid argc")
endif: move $v0,$t0 #return fla (?)
		addi $sp,$sp,-16
		sw $ra,0($sp)
		sw $s0,4($sp)
		sw $s1,8($sp)
		sw $s2,12($sp)
	jr $ra