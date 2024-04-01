#Mapa de registos
# i = $t0
# n = $t1
# aux = $f0
# sum = $f2
# array = $f4
# thd = $f6
# val = $f8

	.data
sum: .double 0.0
	.text
	.globl main

main:
	li $t0,0 #i= 0
	move $f4,$a0 # double aux
	move $f6,$a1 # double *array
	move $f8,$a2 # double  val
	move $t1,$a3 # int n
	# até aqui passamos os argumentos da função para os registos que são corretos para os trabalharmos
	l.d $f2,sum #escrevemos no $f2 o valor sum (double 0.0)
		
for:bge $t0,$t1,endfor for (i=0;i<n;i++)
	mtc1 $f4,$f4 #visto que vamos somar a um ponteiro para um double um inteiro, temos que passar primeiro a int, e por isso movemos o mesmo para o coprocessador
	cvt.w.d $f4,$f4 # fazemos a conversão do array para inteiro
	add $f4,$t0,$f4 # array[i] = $t2
	mtc1 $f4,$f4 #fazemos a conversão de volta para double
	cvt.d.w $f4,$f4
	add.d $f0,$f4,$f8 # aux = array[i] + val
if:
	ble $f0,$f6,else #if(aux>thd) 
	mov.d $f4,$f6
	add.d $f2,$f2,$f6 #sum += thd
else: mov.d $f4,$f0 #array[i] = thd
	  add.d $f2,$f2,$f0  #sum += aux		
endfor: mtc1 $t1,$f10 #passa o n para o coprocessador
		cvt.d.w $f10,$f10 #converte o n para double
		div.d $f12,$f2,$f10 #return (sum/(double)n

	jr $ra
