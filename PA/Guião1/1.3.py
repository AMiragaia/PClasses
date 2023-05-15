#Crie uma classe adequada à modelação de um ponto (definido pelas coordenadas reais x e y, em
#metros). Inclua um método distancia() para calcular distância entre 2 pontos.
#Crie uma lista com 5 pontos, com coordenadas aleatórias. Calcule e imprima a distância entre todos os
#pares de pontos.

class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y
    def distance(self, other):
        return ((self.x - other.x)**2 + (self.y - other.y)**2)**0.5
    

Points = [(1, 2), (3, 4), (5, 6), (7, 8), (9, 10)]

for i in range(len(Points)):
    for j in range(i+1, len(Points)):
        print(f"Distance between {Points[i]} and {Points[j]} is {Point(Points[i][0], Points[i][1]).distance(Point(Points[j][0], Points[j][1]))}")


