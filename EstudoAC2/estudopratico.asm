Escreva, em linguagem Assembly, um programa para o PIC32 que, em ciclo infinito, leia o valor presente nos 4 dip-switches (portos RB3 a RB0) e envie para o PC o código ASCII do símbolo hexadecimal correspondente ao complemento lógico do valor binário presente nesses switches (‘0’, ‘1’, ..,’9’, ‘A’, ..’F’) – e.g. se valor dos switches for ”1100” o valor a enviar deve ser o código ASCII de ‘3’.

Sempre que é enviado um carater, o valor do LED ligado ao porto RE7 deve ser complementado.

A verificação do valor presente nos switches e respetivo envio para o PC deve ocorrer 4 vezes por segundo. Para este efeito, escreva, também em Assembly, uma função “delay()” que gere um atraso temporal múltiplo de 2ms e que receba como parâmetro o número de 2 milissegundos a esperar.

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
	
main: 
	  //salvaguarda os valores iniciais na stack
	  addi $sp,$sp,-12
	  sw $ra,0($sp)
	  sw $s0,4($sp)
	  sw $s1,8($sp)
	  
	  
	  //Coloca as portas certas como inputs e outputs
	  lui $s0,SFR_BASE_HI
	  lw $s1,TRISB($s0)
	  
	  ori $s1,$s1,0x000F // 0000 0000 0000 1111
	  sw $s1,TRISB($s0) // RB3-RB0 as input
	  
	  lw $s1,TRISE($s0) 
	  andi $s1,$s1,0xFF7F //0000 0000 0000 1111 -> 0000 0000 0111 1111
	  sw $s1,TRISE($s0)
	  
	  //alterar o que se vai mostrar no portos configurados como saida
	  lw $s1,LATE($s0)
	  ori $s1,$s1,0x0800 //para mostrar no bit 7 o valor em alta
	  sw $s1,LATE($s0)
	  
while:
		lw $s1,PORTB($s0)
		not $s1,$s1
		andi $s1,$s1,0x000F // so queremos os 4 primeiros bits
		
if:
		bgt $s1,0x09,else
		addi $s1,$s1,0x30 //passar para o ascci decimal
		j end_if
else:
		addi $s1,$s1,0x37 //passar para letras hexadecimal
end_if:
		li $v0,3 // da load ao numero do syscall
		move $a0,$s1 //passa para o registo argumento 
		syscall //faz o putchar do valor em $a0
		
		lw $s1,LATE($s0)
		xori $s1,$s1,0x0080 //faz inversão do estado do 7 bit
		sw $s1,LATE($s0) //RE7 LIGADO
		
		li $a0,125
		jal delay
		
		j while
		
		
		lw $ra,0($sp)
		lw $s0,4($sp)
		lw $s1,8($sp)
		addi $sp,$sp,12
		
		li $v0,0
		jr $ra
	  
	  
delay:
		move $t0,$a0 // colcar o argumento no lugar certo
		
for_delay:
		ble $t0,$0,end_f_delay
		li $v0,12
		syscall // 12 é o syscall do resetCoreTimer()
while_delay:
		li $v0,11
		syscall
		blt $v0,40000,while_delay # while(readcoretimer() < 40000)
		
		addi $t0,$t0,-1 //ms-- loop vai ao contrario
		
		j for_delay
end_f_delay:
		jr $ra
	
	
	
	
	
	
	
//Exercício 1
//a) Escreva um programa em linguagem assembly que, em ciclo infinito, faça a leitura dos 4 bits do dip-switch da placa DETPIC32 (ligado aos portos RB3 a RB0) e mostre o valor de cada um deles nos 4 LED ligados aos portos RE3 a RE0.




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

main:
    lui $s0,SFR_BASE_HI

    lw $s1,TRISB($s0)
    ori $s1,$s1,0x000F // configurar RB3-RB0 como entrada
    sw $s1,TRISB($s0)

    lw $s1,TRISE($s0)
    andi $s1,$s1,0xFFF0 // configurar RE3-RE0 como saída
    sw $s1,TRISE($s0)

while:
    lw $s1,PORTB($s0)
    andi $s1,$s1,0x000F // obter os valores de RB3-RB0

    sw $s1,LATE($s0) // escrever os valores de RB3-RB0 para RE3-RE0

    j while

jr $ra

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//b) Altere o programa que escreveu na alínea a), de modo a que o valor de cada um dos bits do dipswitch seja mostrado por ordem inversa nos 4 LED (i.e. RB3->RE0, RB2->RE1, …, RB0->RE3).
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

main:
    lui $s0,SFR_BASE_HI

    lw $s1,TRISB($s0)
    ori $s1,$s1,0x000F // configurar RB3-RB0 como entrada
    sw $s1,TRISB($s0)

    lw $s1,TRISE($s0)
    andi $s1,$s1,0xFFF0 // configurar RE3-RE0 como saída
    sw $s1,TRISE($s0)

while:
    lw $s1,PORTB($s0)
    andi $s1,$s1,0x000F // obter os valores de RB3-RB0
	
	li $t0, 0
    li $t1, 3

shift_loop:
	andi $t2,$t1,1
	sll $t2,$t2,$t1
	or $t0,$t0,$t2
	srl $s1,$s1,1
	addi $t1,$t1, -1
	bgtz $t1, shift_loop


    sw $t0,LATE($s0) // escrever os valores de RB3-RB0 para RE3-RE0

    j while

jr $ra


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//c) Faça uma nova alteração ao programa que escreveu em a), de modo a que o valor de cada um dos bits do dip-switch seja mostrado por ordem inversa nos 4 LED ligados aos 4 bits mais significativos do porto E (i.e. RB3->RE4, …, RB0->RE7); os 4 LED ligados aos 4 bits menos significativos do porto E devem mostrar o valor presente nas entradas RB3-RB0 (i.e. RB3->RE3, …, RB0->RE0).
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

main:
    lui $s0,SFR_BASE_HI

    lw $s1,TRISB($s0)
    ori $s1,$s1,0x000F // configurar RB3-RB0 como entrada
    sw $s1,TRISB($s0)

    lw $s1,TRISE($s0)
    andi $s1,$s1,0xFF0F // configurar RE7-RE4 como saída e RE3-RE0
    sw $s1,TRISE($s0)

while:
    lw $s1,PORTB($s0)
    andi $s1,$s1,0x000F // obter os valores de RB3-RB0
	move $t0,$s1
	jal reverse
	
	andi $s1,$s1,0x000F
	or $s1,$s1,$t0
	sw $s1,LATE($s0)
	j while
    
	
	
reverse:
	li $t0,0
	li $t1,3
	andi $t2,$t1,1
	sll $t2,$t2,$t1
	or $t0,$t0,$t2
	srl $t1,$t1,1
	addi $t1,$t1,-1
	bgtz $t1,reverse
	
	sw $t0,LATE($s0) // escrever os valores de RB3-RB0 para RE3-RE0
    j while

jr $ra

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////