import math

def check_inside_circle(r, x, y):
    if r**2 >= x**2 + y**2:
        return True
    else:
        return False

def main():
    r = int(input("Inserir raio: "))
    x = int(input("Posição x: "))
    y = int(input("Posição y: "))
    if check_inside_circle(r,x,y) == True:
        if x == 0 and y > 0:
            angulo = 90
        elif x == 0 and y < 0:
            angulo = 270
        else:
            angulo = math.degrees(math.atan(y/x)) # ou multiplicar por 180/pi o atan se não se quiser usar a função degrees
        print("O ponto está dentro do círculo e o ângulo é: ", angulo)

    else:
        print("Fora do circulo!")

if __name__ == "__main__":
    main()