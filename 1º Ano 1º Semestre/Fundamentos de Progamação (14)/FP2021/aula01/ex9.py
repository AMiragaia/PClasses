#Se sair de casa às 6:52 a passo e percorrer 1 km (ao ritmo de 10 min por km), depois fizer
#um treino rápido de 3 km (a 6 min por km) e voltar a casa a passo, a que horas chego a
#casa para o pequeno almoço?

ts = 6*60 + 52
km = 1
ts1 = ts + 10 
ts2 = ts1 + 3*6
ts3 = ts2 // 60
ts4 = ts2 % 60
#print format ts3:ts4
print("%2d:%2d" % (ts3,ts4))





