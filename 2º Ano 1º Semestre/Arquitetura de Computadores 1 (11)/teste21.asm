#Mapa de registos
#cc : $t0
#ms : $t1

.text
.data
str: .asciiz "Teste-Pratico-1"
.globl main
la $t1,str
lb $t2,0($t1)
li $t3,'\0'
while: beq $t2,'\0', endw
	ori $t0,$t2,0
if:	ble $t0,'0',else


else: blt  $t0,'a',endif
      bgt  $t0,'z',endif 
      sub  $t2,$t2,0x20
      addi $t1,$t1,1
endif: j while

endw:jr $ra
