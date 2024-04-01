import math
# You throw a dart that hits coordinates (x, y) on a dartboard.
# Create a program that gives you the score.
# See:
#   https://en.wikipedia.org/wiki/Darts#Dartboard
#   https://www.dimensions.com/element/dartboard

print("Enter the coordinates in mm from the center of the board.")


x = float(input("x? "))
y = float(input("y? "))
# Points of the sectors, clockwise from the top
# Example: the sector right from the center is POINTS[5] == 6.
POINTS = (20, 1, 18, 4, 13, 6, 10, 15, 2, 17, 3, 19, 7, 16, 8, 11, 14, 9, 12, 5)

# COMPLETE...

#obtenção do angulo tendo em conta as coordenadas utilizadas pelo utilizador
if (x == 0 and y > 0):
    angle = 0.0
elif(x == 0 and y < 0):
    angle = 180.0
elif(x > 0 and y == 0):
    angle = 90.0
elif(x < 0 and y == 0):
    angle = 270.0
else:
    tempAngle = math.degrees(math.atan(y/x))
    if(x > 0 and y > 0):
        angle = 99.0 - tempAngle
    elif(x > 0 and y < 0):
        angle = 189.0 - tempAngle
    elif(x < 0 and y < 0):
        angle = 279.0 - tempAngle
    elif(x < 0 and y > 0):
        angle = 369.0 - tempAngle

# verificar o score com base em varios circulos tendo em conta o raio de cada um e os angulos dos setores
if ((x)**2+(y)**2 >= 170**2):
    score = 0
elif ((x)**2+(y)**2 <= 170**2 and (x)**2+(y)**2 >= 162**2):
    #caso espcial de dobro de pontos
    score = POINTS[int(angle // 18)] * 2
elif((x)**2+(y)**2 <= 107**2 and (x)**2+(y)**2 >= 99**2):
    #caso especial de triplo de pontos
    score = POINTS[int(angle // 18)] * 3
elif((x)**2+(y)**2 <= 32**2 and (x)**2+(y)**2 >= 12.7**2):
    score = 25
elif((x)**2+(y)**2 <= 12.7**2):
    score = 50
else:
    score = POINTS[int(angle // 18)]

print(score)