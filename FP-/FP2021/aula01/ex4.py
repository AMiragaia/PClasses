seg = int(input("Número de segundos pretendido?" ))
h = seg // 3600
horas = seg % 3600
m = horas // 60
minutos = horas % 60
s = minutos // 60
print("{:02d}:{:02d}:{:02d}".format(h, m, s)) 