#Implemente classes que permitam criar objetos das seguintes formas geométricas: Círculo, Quadrado
#e Retângulo.
#Cada forma é caraterizada por dois atributos obrigatórios – cor (String) e centro (ponto com
#coordenadas x, y) – e ainda atributos adicionais para cada tipo de forma (raio para o círculo, dois lados
#no retângulo e um lado no caso do quadrado). Tenha em atenção os conceitos de encapsulamento.
#Reutilize a classe do exercício 1.3 para o centro.
#Garanta as seguintes especificações:
import turtle
class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y
    def distance(self, other):
        return ((self.x - other.x)**2 + (self.y - other.y)**2)**0.5
    

#a) crie classes que representem cada uma das figuras geométricas, implementando construtor(es) adequados para cada classe;
class Circle:
    def __init__(self, radius, color, center):
        self.radius = radius
        self.color = color
        self.center = center
    def get_radius(self):
        return self.radius
    def get_color(self):
        return self.color
    def get_center(self):
        return self.center
    def set_radius(self, radius):
        self.radius = radius
    def set_color(self, color):
        self.color = color
    def set_center(self, center):
        self.center = center
    def area(self):
        return 3.141592653589793 * self.radius**2
    def perimeter(self):
        return 2 * 3.141592653589793 * self.radius
    def turtle_draw(self):
        turtle.penup()
        turtle.goto(self.center.x, self.center.y)
        turtle.pendown()
        turtle.color(self.color)
        turtle.circle(self.radius)
    def __str__(self):
        return f"Circle with radius {self.radius}, color {self.color} and center {self.center}"
    def __repr__(self):
        return f"Circle({self.radius}, {self.color}, {self.center})"
    def intersects(self, other):
    # verifica se o círculo se intersecta com outro círculo
        return abs(self.radius - other.radius) <= self.center.distance(other.center) <= self.radius + other.radius

         
    
class Square:
    def __init__(self, side, color, center):
        self.side = side
        self.color = color
        self.center = center
    def get_side(self):
        return self.side
    def get_color(self):
        return self.color
    def get_center(self):
        return self.center
    def set_side(self, side):
        self.side = side
    def set_color(self, color):
        self.color = color
    def set_center(self, center):
        self.center = center
    def area(self):
        return self.side**2
    def perimeter(self):
        return 4 * self.side
    def turtle_draw(self):
        turtle.penup()
        turtle.goto(self.center.x, self.center.y)
        turtle.pendown()
        turtle.color(self.color)
        turtle.forward(self.side)
        turtle.left(90)
        turtle.forward(self.side)
        turtle.left(90)
        turtle.forward(self.side)
        turtle.left(90)
        turtle.forward(self.side)
        turtle.left(90)

    def __str__(self):
        return f"Square with side {self.side}, color {self.color} and center {self.center}"
    def __repr__(self):
        return f"Square({self.side}, {self.color}, {self.center})"
    
class Rectangle:
    def __init__(self, side1, side2, color, center):
        self.side1 = side1
        self.side2 = side2
        self.color = color
        self.center = center
    def get_side1(self):
        return self.side1
    def get_side2(self):
        return self.side2
    def get_color(self):
        return self.color
    def get_center(self):
        return self.center
    def set_side1(self, side1):
        self.side1 = side1
    def set_side2(self, side2):
        self.side2 = side2
    def set_color(self, color):
        self.color = color
    def set_center(self, center):
        self.center = center
    def area(self):
        return self.side1 * self.side2
    def perimeter(self):
        return 2 * (self.side1 + self.side2)
    def turtle_draw(self):
        turtle.penup()
        turtle.goto(self.center.x, self.center.y)
        turtle.pendown()
        turtle.color(self.color)
        turtle.forward(self.side1)
        turtle.left(90)
        turtle.forward(self.side2)
        turtle.left(90)
        turtle.forward(self.side1)
        turtle.left(90)
        turtle.forward(self.side2)
        turtle.left(90)
        turtle.done()
    
    def __str__(self):
        return f"Rectangle with sides {self.side1} and {self.side2}, color {self.color} and center {self.center}"
    def __repr__(self):
        return f"Rectangle({self.side1}, {self.side2}, {self.color}, {self.center})"


#b) adicione todos os métodos getters e settters relevantes;
#c) implemente um método para calcular a área de cada tipo de figura;
#d) [TPC] implemente um método para calcular o perímetro de cada tipo de figura;
#e) [TPC] implemente um método que desenhe a forma geométrica usando o módulo Turtle;
#f) implemente um método para verificar se os dois círculos se intersetam

#Teste as classes criadas, criando objetos de cada tipo e invocando os métodos implementados.

Circle(50, "red", Point(0, 0)).turtle_draw()
Square(50, "red", Point(0, 0)).turtle_draw()
Circle(15, "red", Point(5, 5)).turtle_draw()
print(Circle(30, "red", Point(0, 0)).intersects(Circle(15, "red", Point(5, 5))))

