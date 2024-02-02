#Mapa de registos:
#   soma: $t0
#   value: $t1
#   i: $t2
    .data
str1:   .asciiz "Introduza um numero: "
str2:   .asciiz "Valor ignorado\n"
str3:   .asciiz "A soma dos positivos é: "
    .eqv print_string,4
    .eqv read_int,5
    .eqv print_int10,1
    .text
    .globl main
main: li $t0,0 #soma = 0
      li $t2,0 # i = 0
while: bge $t2,5,endw # while(i<5=)
       la $a0,str1 
       li $v0,print_string
       syscall		#print_string("Introduza um numero"
       li $v0,read_int
       syscall	
       or $t1,$0,$v0 #value = read_int()
       ble $t1,0,else 
       add $t0,$t0,$t1
       addi $t2,$t2,1
       j while
       
else:  la $a0,str2  
       li $v0,print_string 
       syscall
       addi $t2,$t2,1
       j while
endw:  la $a0,str3
       li $v0,print_string
       syscall
       or $a0,$t0,$0
       li $v0,print_int10
       syscall
