from graphics import *
from antlr4 import *
from ipdrawLexer import ipdrawLexer
from ipdrawParser import ipdrawParser
from SecondaryCompInterpraDor import SecondaryCompInterpraDor
from io import StringIO
import math, time
import sys




# Initialization of global variables

var_PI = math.pi
false = False
true = True

var_Win = GraphWin(" ", 500, 500)     # default canvas


# Class that represents the pen entity
class Pen:
    def __init__(self, pen_class = None):
        if pen_class != None:
            self.pos = pen_class["pos"]
            self.color = pen_class["color"]
            self.orientation = pen_class["orientation"]
            self.thickness = pen_class["thickness"]
            self.pressure = pen_class["pressure"]
            self.levitate = False
        else:
            self.pos = (10,10)
            self.color = "red"
            self.orientation = 0
            self.thickness = 1
            self.pressure = 0
            self.levitate = False


    def __str__(self):
        return f"Pen(pos={self.pos}, color='{self.color}', orientation={self.orientation / math.pi} PI, thickness={self.thickness}, pressure={self.pressure}, levitate={self.levitate})"

    def set_attribute(self, attribute, value, units='rad'):         # para alterar attributes de Pens
        if attribute == 'position':
            self.pos = value

        if attribute == 'color':
            self.color = value

        if attribute == 'orientation':
            self.orientation = (math.radians(value) % (2 * math.pi)) if units == 'º' else (value % (2 * math.pi))

        if attribute == 'thickness':
            self.thickness = value

        if attribute == 'pressure':
            self.pressure = value

        if attribute == 'up':
            self.levitate = True

        if attribute == 'down':
            self.levitate = False


    def __add__(self, other):                       # porque na gramática é valido somar uma Pen com um tuplo. Portanto aqui, vou também fazer com que seja válido somar um objeto da classe Pen com um tuplo
        if isinstance(other, tuple) and len(other) == 2:
            self.pos = (self.pos[0] + other[0], self.pos[1] + other[1])
            return self
        return NotImplemented


    def __sub__(self, other):                       
        if isinstance(other, tuple) and len(other) == 2:
            self.pos = (self.pos[0] - other[0], self.pos[1] - other[1])
            return self
        return NotImplemented

    def __mul__(self, other):                       # porque na gramática é valido somar uma Pen com um tuplo. Portanto aqui, vou também fazer com que seja válido somar um objeto da classe Pen com um tuplo
        if isinstance(other, int) and len(other) == 2:
            self.pos = (self.pos[0] + other[0], self.pos[1] + other[1])
            return self
        elif isinstance(other, (int, float)):
            self.pos = (self.pos[0] * other, self.pos[1] * other)
            return self
        return NotImplemented

    def __truediv__(self, other):
        if isinstance(other, (tuple, list)) and len(other) == 2:
            self.pos = (self.pos[0] / other[0], self.pos[1] / other[1])
            return self
        elif isinstance(other, (int, float)):
            self.pos = (self.pos[0] / other, self.pos[1] / other)
            return self
        return NotImplemented




def penClass_set_attribute(pen_class, attribute, value=0, units='rad'):     # para alterar os atributos das pen_classes. Isto porque na gramática uso a mesma regra 'penAttribute' para a definição de Pens e para a sua instanciação, pelo que quando visito os atributos no visitor para meter o código correspondente no .stg, não posso meter "['pos'] = (4,0)" para alterar os atributos das classes Pen, nem posso usar ".pos = (4,0)" para os dicionários usados na instanciação das Pens, pelo que para não separar a regra em 2, 1 para cada caso, crio estas funções para ter algo em comum para ambos os casos: "(posição, (4,0))" 
    if attribute in ['position','color','thickness','pressure']:
        if attribute == 'pressure' and value == -1:
            pen_class["levitate"] = True
        elif attribute == 'position':
            pen_class['pos'] = value
        else:
            pen_class[attribute] = value

    elif attribute == 'orientation':
        pen_class["orientation"] = (math.radians(value) % (2 * math.pi)) if units == 'º' else (value % (2 * math.pi))

    elif attribute == 'up':
        pen_class["levitate"] = True

    elif attribute == 'down':
        pen_class["levitate"] = False




# Function to move the pen, drawing if the pressure is there 
def pen_action(canvas, pen, pen_option, value = 0, units = 'rad'):

    start_x, start_y = pen.pos

    if pen_option == 'forward':
        end_x = start_x + value * math.cos(pen.orientation)
        end_y = start_y + value * math.sin(pen.orientation)

    if pen_option == 'backward':
        end_x = start_x - value * math.cos(pen.orientation)
        end_y = start_y - value * math.sin(pen.orientation)


    if pen_option == 'up':
        pen.levitate = True
    if pen_option == 'down':
        pen.levitate = False


    if pen_option == 'left':
        if units == 'º':
            pen.orientation = (pen.orientation - math.radians(value) ) % (2 * math.pi)
        else:
            pen.orientation = (pen.orientation - value) % (2 * math.pi)
    if pen_option == 'right':
        if units == 'º':
            pen.orientation = (pen.orientation + math.radians(value) ) % (2 * math.pi)
        else:
            pen.orientation = (pen.orientation + value) % (2 * math.pi)


    if pen_option == 'backward' or pen_option == 'forward':
        if pen.levitate == True:
            pen.pos = (end_x, end_y)
        else:
            line = Line(Point(start_x, start_y), Point(end_x, end_y))
            line.setWidth( 1 + (pen.thickness * pen.pressure))
            line.setFill(pen.color)
            line.draw(canvas)
            pen.pos = (end_x, end_y)




def pause( microseconds ):
    time.sleep( microseconds / 1000000)




def conversion(type, expr):
    if type == 'str':
        try:
            res = str(expr)
            return res
        except:
            print("Erro: falha de conversão para string.")
            exit(0)

    elif type == 'int':
        try:
            res = int(expr)
            return res
        except:
            print("Erro: falha de conversão para inteiro.")
            exit(0)

    elif type == 'float':
        try:
            res = float(expr)
            return res
        except:
            print("Erro: falha de conversão para real.")
            exit(0)
    else:
        print("Erro: não é suposto chegarmos a esta linha (na função conversion).")
        exit(0)




def pen_execute(canvas, pen, commands):                             # para executar os comandos dados, vou instanciar um visitor da linguagem secundária, e vou executá-lo sobre a pen passada como argumento

    commands = '' + commands + ''
    input_string = ''
    if commands.endswith('.ipdraw'):        # é um ficheiro, temos de ler o seu conteúdo
        with open(commands, 'r', encoding='utf-8') as stream:
            input_string = stream.read()
    else:
        input_string = commands

    input_stream = InputStream(input_string)

    visitor0 = SecondaryCompInterpraDor()
    visitor0.pen = pen                                      # o visitor atua sobre esta pen
    visitor0.canvas = canvas
    lexer = ipdrawLexer(input_stream)
    stream = CommonTokenStream(lexer)
    parser = ipdrawParser(stream)
    tree = parser.program()
    if parser.getNumberOfSyntaxErrors() == 0:
        visitor0.visit(tree)









# Main program
def main():

    var_Canvas1 = GraphWin("Canvas1", 100, 100)     # todos as novas pens criadas vão desenhar neste canvas, até que um novo canvas seja criado


    # criar pen_class default, e modificar-lhe os atributos indicados 
    var_PenType1 = {}
    var_PenType1["pos"] = (10,10)
    var_PenType1["color"] = "red"
    var_PenType1["orientation"] = 0
    var_PenType1["thickness"] = 1
    var_PenType1["pressure"] = 0
    var_PenType1["levitate"] = False


    # meter os valores desejados na pen_class criada
    penClass_set_attribute( var_PenType1, 'color', "green"  )
    penClass_set_attribute( var_PenType1, 'position', (10, 10)  )
    penClass_set_attribute( var_PenType1, 'orientation', 45, 'º'  )
    penClass_set_attribute( var_PenType1, 'thickness', 10  )
    penClass_set_attribute( var_PenType1, 'pressure', -1  )



    var_p1 = Pen(  var_PenType1 )


    pen_action(var_Canvas1, var_p1, "down")


    pen_action(var_Canvas1, var_p1, "forward", value=10)


    var_p1.set_attribute( 'color', "red"  )


    pen_action(var_Canvas1, var_p1, "left", value=10, units="º")


    pen_action(var_Canvas1, var_p1, "backward", value=10)


    var_p1.set_attribute( 'color', "blue"  )


    pen_action(var_Canvas1, var_p1, "right", value=20, units='º')


    pen_action(var_Canvas1, var_p1, "forward", value=10)


    var_x = int(5)
    var_y = int(10)


    var_p1.set_attribute( 'position', (var_x, var_y)  )


    var_x = (conversion("int", input("x: ").strip()))


    var_y = (conversion("int", input("y: ").strip()))


    var_p1.set_attribute( 'position', (var_x, var_y)  )


    #printar variável indicada
    print(var_p1)


    #printar variável indicada
    print("\n")


    pause(10000)


    pen_action(var_Canvas1, var_p1, "forward", value=10)
    pause(10000)
    pen_action(var_Canvas1, var_p1, "left", value=10)
    pen_action(var_Canvas1, var_p1, "forward", value=20)


    var_p1.set_attribute( 'position', (0, 0)  )


    pen_action(var_Canvas1, var_p1, "down")


    pen_action(var_Canvas1, var_p1, "forward", value=10)
    pen_action(var_Canvas1, var_p1, "right", value=144, units='º')
    pen_action(var_Canvas1, var_p1, "forward", value=10)
    pen_action(var_Canvas1, var_p1, "right", value=144, units='º')
    pen_action(var_Canvas1, var_p1, "forward", value=10)
    pen_action(var_Canvas1, var_p1, "right", value=144, units='º')
    pen_action(var_Canvas1, var_p1, "forward", value=10)
    pen_action(var_Canvas1, var_p1, "right", value=144, units='º')
    pen_action(var_Canvas1, var_p1, "forward", value=10)


    var_p1 = ((var_p1 + (5, 5)))


    var_p1.set_attribute( 'color', "green"  )


    var_i = (0)
    while( (var_i < 5) ):
        pen_action(var_Canvas1, var_p1, "forward", value=10)
        pen_action(var_Canvas1, var_p1, "right", value=144, units='º')
        var_i = ((var_i + 1))


    var_pn = Pen(   )


    var_pn.set_attribute( 'color', "blue"  )


    var_pn.set_attribute( 'thickness', 10  )


    var_pn.set_attribute( 'pressure', (1 / 2)  )


    var_done = (false)


    while(not (var_done)):
        var_length = (conversion("int", input("length: ").strip()))
        pen_action(var_Canvas1, var_p1, "forward", value=var_length)
        var_angle = (((conversion("float", input("rotation angle (degrees): ").strip()) * var_PI) / 180))
        pen_action(var_Canvas1, var_p1, "left", value=var_angle)
        #printar variável indicada
        print(var_p1)
        var_t = str(input("finish (y/N)?: ").strip())
        var_done = ((((var_t == "y")) or ((var_t == "Y"))))
    try:
        var_Win.getMouse()
        var_Win.close()
    except:
        return




if __name__ == "__main__":
    main()
