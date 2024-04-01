#Mapa de registos
#val : $t0
#n   : $t1
#min : $t2
#max : $t3
.data
str1: .asciiz"Digite ate 20 inteiros (zero para terminar):"
str2: .asciiz"Máximo/mínimo são :"
.eqv read_int,5
.eqv print_string,4
.eqv print_char,11
.eqv print_int10,1
.text
.globl main
li $t1,0	#n = 0
li $t2,0x7FFFFFFF #min = 0x7FFFFFFF
li $t3,0x80000000 #max = 0x80000000
do: li $v0,read_int #do{
    syscall	#read_int()
    move $t0,$v0 #val = read_int()
if: beqz $t0,endif #if (val != 0) {
if2: blt $v0,$t3,else # if (val > max)
     move $t3,$t0 # max = val
else: bgt $t0,$t2,endif #if (val < min)
      move $t2,$t0 #min = val
endif:addi $t1,$t1,1 #n++
while: bgt $t1,20,endw
       beqz $t1,0,endw
       j do
endw: la $a0,str2
      li $v0,printstring
      syscall
      move $a0,$t3
      li $v0,print_int10
      syscall
      li $a0,":"
      li $v0,print_char
      syscall
      move $a0,$t2
      li $v0,print_int10
      syscall
      jr $ra