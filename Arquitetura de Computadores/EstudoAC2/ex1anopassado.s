#xEscreva e teste um programa, em assembl, que faça todas as configurações necessárias e que mostre nos 4 LEs
#, ligados aos portos RE4 E RE1, o padrãoo 1001, 0110,1001,0110,...(valor inicial: 1001); o padrão deve mudar com um frequencia de 7 Hz.
# O valor padrão deve também ser mostrado no ecrã do PC, em binário formatado com 4 bits; os valores devem ser apre
#sentados em linhas consecutivas do ecrã. O valor da frequencia deve ser obtido com o menor erro possivel.


.data
.equ SFR_BASE_HI,0xBF88
.equ TRISB,0x6040
.equ PORTB,0x6050
.equ LATB, 0x6060
.equ TRISE,0x6100
.equ PORTE,0x6110
.equ LATE, 0x6120
.text
.globl main

main: addi $sp,$sp,-16
      sw $ra,0($sp)
      sw $s0,4($sp)
      sw $s1,8($sp)
      sw $s2,12($sp)
      lui $s0,SFR_BASE_HI

      lw $s1,TRISE($s0)
      andi $s1,$s1,0xFFE1
      sw $s1,TRISE($s0)

loop: li $a0,143
      jal delay 
      lw $s1,LATE($s0)
      andi $s1,$s1,0xFFE1
      ori $s1,$s1,0x0012
      sw $s1,LATE($s0)
      #############
      li $v0,6
      move $a0,$s1
      syscall
      #############
      lw $s2,LATE($s0)
      andi $s2,$s2,0xFFE1
      ori $s2,$s2,0x000C
      sw $s2,LATE($s0)

     ###############

     li $v0,6
     move $a0,$s1
     syscall
     ################
     j loop
     addi $sp,$sp,16
     lw $ra,0($sp)
     lw $s0,4($sp)
     lw $s1,8($sp)
     lw $s2,12($sp)
     jr $ra
delay:
     li $v0,12
     syscall
     li $t0,20000
     mulou $t0,$t0,$a0
read:
    li $v0,11
    syscall
    blt $v0,$t0,read
    jr $ra
