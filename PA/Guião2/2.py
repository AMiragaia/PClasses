import random

class Shape:
    def __init__(self, color, center):
        self.color = color
        self.center = center
    def get_color(self):
        return self.color
    def get_center(self):
        return self.center
    def set_color(self, color):
        self.color = color
    def set_center(self, center):
        self.center = center
    def area(self):
        pass
    def perimeter(self):
        pass

class Circle(Shape):
    def __init__(self, radius, color, center):
        super().__init__(color, center)
        self.radius = radius
    def get_radius(self):
        return self.radius
    def set_radius(self, radius):
        self.radius = radius
    def area(self):
        return 3.141592653589793 * self.radius**2
    def perimeter(self):
        return 2 * 3.141592653589793 * self.radius

class Square(Shape):
    def __init__(self, side, color, center):
        super().__init__(color, center)
        self.side = side
    def get_side(self):
        return self.side
    def set_side(self, side):
        self.side = side
    def area(self):
        return self.side**2
    def perimeter(self):
        return 4 * self.side

class Rectangle(Shape):
    def __init__(self, side1, side2, color, center):
        super().__init__(color, center)
        self.side1 = side1
        self.side2 = side2
    def get_side1(self):
        return self.side1
    def get_side2(self):
        return self.side2
    def set_side1(self, side1):
        self.side1 = side1
    def set_side2(self, side2):
        self.side2 = side2
    def area(self):
        return self.side1 * self.side2
    def perimeter(self):
        return 2 * (self.side1 + self.side2)

class Figures:
    @staticmethod
    def random_shape():
        rn = random.randrange(0,3)
        if rn == 0:
            return Circle(random.uniform(1,10), "red", (0, 0))
        elif rn == 1:
            return Square(random.uniform(1,10), "green", (0, 0))
        else:
            return Rectangle(random.uniform(1,10), random.uniform(1,10), "blue", (0, 0))

def main():
    figures = []
    for i in range(9):
        figures.append(Figures.random_shape())
    for fig in figures:
        print("Area:", fig.area())
        print("Perimeter:", fig.perimeter())

main()