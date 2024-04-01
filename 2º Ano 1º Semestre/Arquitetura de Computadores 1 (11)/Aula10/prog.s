#Mapa de Registos
#$t0=c
.data
c:.asciiz "c"
.eqv getChar,2
.eqv putChar,1
.text
.globl main
main:
do:
  la $a0, c         # $a0 = c
  li $v0, getChar   
    syscall
  move $t0, $v0     # $t0 = c
  li $v0, putChar   
    syscall     
  li $t1,'\n'       # $t1 = '\n'    
  bne $t0, $t1, do # se c != '\n' volta ao inicio
  li $v0, 0
  jr $ra					# jump to $ra
  