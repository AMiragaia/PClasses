#Mapa de registos:
# $t0-soma
# $t1-value
# $t2-i
	.data
str1:	.asciiz "Introduza um numero:"
str2:	.asciiz "Valor ignorado\n"
str3:	.asciiz "A soma dos positivos e:"
	.eqv	print_string,4
	.eqv	read_int,5
	.text
	.globl main
main: li $t0,0	# soma = 0;
      li $t2,0  # i = 0;
for:  bge $t2,5,endf #while(i<5){
      la $a0,str1	#load no endereço $a0 da label str1
      li $v0,print_string 
      syscall		#print_string(str1)
      li $v0,read_int	#read_int()
      syscall
      or $t1,$0,$v0 	#$t1 = read_int()
if:   ble $t1,0,else    #if (value >0)
      add $t0,$t0,$t1	#soma += value
      j endif
else:
      la $a0,str2
      li $v0,print_string
      syscall
endif:addi $t2,$t2,1
      j for 
endf:
     la $a0,str3
     li $v0,print_string
     syscall
     or $a0,$t0,$0
     li $v0,1
     syscall
     jr $ra

