Escreva, em linguagem Assembly, um programa para o PIC32 que, em ciclo infinito, leia o valor presente nos 4 dip-switches (portos RB3 a RB0) e envie para o PC o código ASCII do símbolo hexadecimal correspondente ao complemento lógico do valor binário 
presente nesses switches (‘0’, ‘1’, ..,’9’, ‘A’, ..’F’) – e.g. se valor dos switches for ”1100” o valor a enviar deve ser o código ASCII de ‘3’.

Sempre que é enviado um carater, o valor do LED ligado ao porto RE7 deve ser complementado.

A verificação do valor presente nos switches e respetivo envio para o PC deve ocorrer 4 vezes por segundo. Para este efeito, escreva, também em Assembly, uma função “delay()” 
que gere um atraso temporal múltiplo de 2ms e que receba como parâmetro o número de 2 milissegundos a esperar.

Comece por programar adequadamente os portos de entrada/saída necessários à correta execução da tarefa. O valor inicial do porto RE7 deve ser '1'.

Endereço dos portos a usar:
TRISB: 0xBF886040 PORTB: 0xBF886050 LATB: 0xBF886060
TRISE: 0xBF886100 PORTE: 0xBF886100 LATE: 0xBF886120





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
	
main: addi $sp,$sp,-12
	  sw $ra,0($sp)
	  sw $s0,4($sp)
	  sw $s1,8($sp)
	  
	  lui $s0,SFR_BASE_HI
	  lw $s1,TRISB($s0)
	  
	  ori $s1,$s1,0x000F
	  sw $s1,TRISB($s0) # RB3-RB0 as input
	