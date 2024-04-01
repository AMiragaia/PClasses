#i : $t0
#j : $t1
#array [i][j]: $t3
.data
str1: .asciiz "Array"
str2: .asciiz "de"
str3: .asciiz "ponteiros" 
array: .word str1,str2,str3
      .eqv SIZE,3
      .text
      .globl main
main: li $t0, 0 #i=0
for: bge $t0,SIZE,endf #while(i < SIZE){
    #...
    li $t1,0 #j=0
while:
     la $t3,array #$t3 = &array[0]
     sll $t2,$t0,2 #
     addu $t3,$t3,$t2 # $t3 = &array[0]
     lw $t3, 0($t3)
     addu $t3,$t3,$t1 #
     lb $t3, 0($t3)
     beq $t3,'\0', endw
     
     j while
endw:
	j for
	
endf:
    jr $ra
