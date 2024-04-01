.equ READ_CORE_TIMER,11
.equ RESET_CORE_TIMER,12
.equ PUT_CHAR,3
.equ PRINT_INT,6
.data
.text
.globl main
main: li $t0,0  # counter=0
while:          # while (1) {
      li $v0,RESET_CORE_TIMER #
      syscall # resetCoreTimer()
read: li $v0,READ_CORE_TIMER #
      syscall # readCoreTimer()
      # blt $v0, 200000, read       #while(readCoreTimer() < 200000)    -> 100hz
      # blt $v0, 2000000, read      #while(readCoreTimer() < 2000000)   -> 10hz
      # blt $v0, 4000000, read      #while(readCoreTimer() < 4000000)   -> 5hz
      blt $v0,200000,read # if (readCoreTimer() < 200000) goto read
      addi $t0,$t0,1 # counter++
      move $a0,$t0 
      li $a1,4
      sll $a1,$a1,16
      ori $a1,$a1, 10 # 10 | 4 << 16

      li $v0, PRINT_INT
      syscall # printInt(counter++, 10 | 4 << 16)

      li $a0, '\r'
      li $v0,PUT_CHAR #
      syscall # putChar('\n')
    j while # }
    li $v0,0
jr $ra #