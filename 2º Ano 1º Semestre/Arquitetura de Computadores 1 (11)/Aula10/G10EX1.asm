	.data
k1:	.float 1.0
	.text
	.globl main
#intermedia
# x: $f12 -> $f20           $f20,$f22...
# y: $a0 -> $a0
# i: $t0                    não usado no 'for'
# result: $f0
# resultado:
main:	addiu	$sp,$sp,-4
	sw	$ra,0($sp)
	
	li	$v0,6
	syscall
	mov.s	$f12,$f0	# x = read_float()
	li	$v0,5
	syscall
	move	$a0,$v0		# y = read_int()
	jal	xtoy		# xtoy(x,y)
	
	mov.s	$f12,$f0
	li	$v0,2
	syscall
	
	lw	$ra,0($sp)
	addiu	$sp,$sp,4
	jr	$ra
xtoy:	addiu	$sp,$sp,-12
	sw	$ra,0($sp)
	sw	$s0,4($sp)
	s.s	$f20,8($sp)
	
	mov.s	$f20,$f12
	move	$s0,$a0
	
	jal	abs	
	move	$t1,$v0		# aux = abs(y)
	
	li	$t0,0		# i = 0
	la	$t2,k1
	l.s	$f0,0($t2)	# result = 1.0

xfor:	bge	$t0,$t1,xendf	# while (i < abs(y)){
xif:	ble	$s0,0,xelse	# 	if(y > 0)
	mul.s	$f0,$f0,$f20	# 		result *= x	
	j	xendif

xelse:				# 	else
	div.s	$f0,$f0,$f20	# 		result /= x

xendif:	addi	$t0,$t0,1	# i++
	j	xfor		# }

xendf:		
	lw	$ra,0($sp)
	lw	$s0,4($sp)
	l.s	$f20,8($sp)
	addiu	$sp,$sp,12
	jr	$ra
	
# terminal
# val: $a0
abs:	
aif:	bge	$a0,0,aendif
	sub	$a0,$0,$a0	# val = -val
aendif:	move	$v0,$a0		# return val
	jr	$ra


