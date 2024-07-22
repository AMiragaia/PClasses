from antlr4 import *
from ipdrawParser import ipdrawParser
from ipdrawVisitor import ipdrawVisitor

from graphics import *
from antlr4 import *
from io import StringIO
import math, time
import sys

from ipdrawLexer import ipdrawLexer



















# Funções que importei do .stg para definir e fazer ações e operações em e com pens e assim
   
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
         return f"Pen(pos={self.pos}, color='{self.color}', orientation={self.orientation}, thickness={self.thickness}, pressure={self.pressure}, levitate={self.levitate})"

      def set_attribute(self, attribute, value, units='rad'):         # para alterar attributes de Pens
         if attribute == 'position':
               self.pos = value

         if attribute == 'color':
               self.color = value

         if attribute == 'orientation':
               self.orientation = math.radians(value) if units == 'º' else value

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
         pen_class["orientation"] = math.radians(value) if units == 'º' else value

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
               pen.orientation = pen.orientation - math.radians(value)
         else:
               pen.orientation = pen.orientation - value
      if pen_option == 'right':
         if units == 'º':
               pen.orientation = pen.orientation + math.radians(value)
         else:
               pen.orientation = pen.orientation + value


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



# e o tipo de pen é representado por esta secção do .stg adaptado a código sem placeholders
def pen_def():
# criar pen_class default, e modificar-lhe os atributos indicados 
      pen_class = {}
      pen_class["pos"] = (10,10)
      pen_class["color"] = "red"
      pen_class["orientation"] = 0
      pen_class["thickness"] = 1
      pen_class["pressure"] = 0
      pen_class["levitate"] = False

      return pen_class









class SecondaryCompInterpraDor(ipdrawVisitor):


   def __init__(self):
      self.dicio_vars = {"PI": {'value': math.pi, "assigned": True }}
      #self.dicio_lis_compatible_types = {"real": ["real", "int"],   "int":['real', 'int'],  "bool":['bool'], 'point':['point', 'pen'],   'pen':['point']}
      self.pen = None
      self.canvas = None




   def visitProgram(self, ctx:ipdrawParser.ProgramContext):
      return self.visitChildren(ctx)
      """ for stat in ctx.stat():
        self.visit(stat) 
      return None """      # faz o mesmo que a linha acima; visita todos os nós filhos do contexto

   def visitStat_penCmd(self, ctx:ipdrawParser.Stat_penCmdContext):
      return self.visitChildren(ctx)

   def visitStat_varAssignment(self, ctx:ipdrawParser.Stat_varAssignmentContext):
      return self.visitChildren(ctx)

   def visitStat_varDeclaration(self, ctx:ipdrawParser.Stat_varDeclarationContext):
      return self.visitChildren(ctx)

   def visitStat_if(self, ctx:ipdrawParser.Stat_ifContext):
      return self.visitChildren(ctx)

   def visitStat_Until(self, ctx:ipdrawParser.Stat_UntilContext):
      return self.visitChildren(ctx)

   #def visitStat_For(self, ctx:ipdrawParser.Stat_ForContext):
   #   return self.visitChildren(ctx)

   def visitStat_pause(self, ctx:ipdrawParser.Stat_pauseContext):
      return self.visitChildren(ctx)

   def visitStat_print(self, ctx:ipdrawParser.Stat_printContext):
      return self.visitChildren(ctx)

   def visitStat_Curly(self, ctx:ipdrawParser.Stat_CurlyContext):
      return self.visitChildren(ctx)

   def visitPenCmd_pos(self, ctx:ipdrawParser.PenCmd_posContext):
      point = self.visit(ctx.point())
      self.pen.set_attribute("pos", point)

   def visitPenCmd_color(self, ctx:ipdrawParser.PenCmd_colorContext):
      color = ctx.Color().getText()
      self.pen.set_attribute("color", color)

   def visitPenCmd_orientation(self, ctx:ipdrawParser.PenCmd_orientationContext):
      expr = self.visit(ctx.expr())
      if not isinstance(expr, (float, int)):
         raise Exception(f"Erro semântico ipdraw: o valor atribuído à orientação não é do tipo 'real' ou 'int'.")
  
      units = None
      try:
         units = ctx.penRotateUnits.getText()
      except:
         units = 'rad'

      self.pen.set_attribute("orientation", expr, units)


   def visitPenCmd_thickness(self, ctx:ipdrawParser.PenCmd_thicknessContext):
      expr = self.visit(ctx.expr())
      if not isinstance(expr, (float, int)):
         raise Exception(f"Erro semântico ipdraw: o valor atribuído à espessura não é do tipo 'real' ou 'int'.")
      
      self.pen.set_attribute("thickness", expr)
      
      return None

   def visitPenCmd_pressure(self, ctx:ipdrawParser.PenCmd_pressureContext):
      expr = self.visit(ctx.expr())
      if not isinstance(expr, (float, int)):
         raise Exception(f"Erro semântico ipdraw: o valor atribuído à pressão não é do tipo 'real' ou 'int'.")
      
      self.pen.set_attribute("pressure", expr)
      
      return None

   def visitPenCmd_down(self, ctx:ipdrawParser.PenCmd_downContext):
      pen_action(self.canvas, self.pen, "down")

   def visitPenCmd_up(self, ctx:ipdrawParser.PenCmd_upContext):
      pen_action(self.canvas, self.pen, "up")

   def visitPenCmd_forward(self, ctx:ipdrawParser.PenCmd_forwardContext):
      expr = self.visit(ctx.expr())
      if not isinstance(expr, (float, int)):
         raise Exception(f"Erro semântico ipdraw: o valor atribuído à distância não é do tipo 'real' ou 'int'.")


      pen_action(self.canvas, self.pen, "forward", expr)
      
      return None

   def visitPenCmd_backward(self, ctx:ipdrawParser.PenCmd_backwardContext):
      expr = self.visit(ctx.expr())
      if not isinstance(expr, (float, int)):
         raise Exception(f"Erro semântico ipdraw: o valor atribuído à distância não é do tipo 'real' ou 'int'.")


      pen_action(self.canvas, self.pen, "backward", expr)
      
      return None

   def visitPenCmd_left(self, ctx:ipdrawParser.PenCmd_leftContext):
      expr = self.visit(ctx.expr())
      if not isinstance(expr, (float, int)):
         raise Exception(f"Erro semântico ipdraw: o valor atribuído ao valor a rodar para a esquerda não é do tipo 'real' ou 'int'.")
      
      units = None
      try:
         units = ctx.penRotateUnits.getText()
      except:
         units = 'rad'

      pen_action(self.canvas, self.pen, "left", expr, units)
      
      return None

   def visitPenCmd_right(self, ctx:ipdrawParser.PenCmd_rightContext):
      expr = self.visit(ctx.expr())
      if not isinstance(expr, (float, int)):
         raise Exception(f"Erro semântico ipdraw: o valor atribuído ao valor a rodar para a direita não é do tipo 'real' ou 'int'.")
      
      units = None
      try:
         units = ctx.penRotateUnits.getText()
      except:
         units = 'rad'

      pen_action(self.canvas, self.pen, "right", expr, units)

      return None

   def visitPenCmd_pause(self, ctx:ipdrawParser.PenCmd_pauseContext):
      value = self.visit(ctx.expr())

      if not isinstance(value, (float, int)):
         raise Exception(f"Erro semântico ipdraw: o valor atribuído ao pause não é do tipo 'real' ou 'int'.")
      pause(value)

   def visitVarAssignment(self, ctx:ipdrawParser.VarAssignmentContext):
      var_type = ctx.TYPE().getText() if ctx.TYPE() else None
      assignments = zip(ctx.ID(), ctx.expr())

      lis_types_real_int = True
      lis_types_length = 0

      for var, expr in assignments:
         var_name = var.getText()
         expr_value = self.visit(expr)

         if var_type:
            if var_name in self.dicio_vars:                                      # se há tipo, é porque estas variáveis deviam de estar a ser declaradas pela primeira vez, e não deviam estar no dicio_vars
               raise Exception(f"Erro semântico ipdraw: a variável {var_name} já foi declarada, e não pode ser declarada outra vez.")
            
            value_type = None
            if var_type == 'int':
               value_type = 0
            if var_type == 'real':
               value_type = 2.4
            if var_type == 'bool':
               value_type = False
            if var_type == 'point':
               value_type = (0,0)
            if var_type == 'string':
               value_type = 'dor'

            self.dicio_vars[var_name] = {'value': value_type, 'assigned': True}
            self.dicio_vars[var_name]['value'] = expr_value

            type_var_name = type(value_type)
            type_expr_value = type(expr_value)
            if type_var_name != type_expr_value :
               raise Exception(f"Erro semântico ipdraw: a variável {var_name} é do tipo {type_var_name}, e o valor que lhe está a ser atribuído ({expr_value}) é do tipo {type_expr_value}.")

            type_var_name = type(self.dicio_vars[var_name]['value'])
            type_expr_value = type(expr_value)

            if type_expr_value != type_var_name:                              # se a variável existe, o tipo com que foi declarado tem que ser consistente com o tipo que está a ser agora usado 
               raise Exception(f"Erro semântico ipdraw: a variável {var_name} é do tipo {type_var_name}, e o valor que lhe está a ser atribuído ({expr_value}) é do tipo {type_expr_value}.")
            
            if not isinstance(self.dicio_vars[var_name]['value'], (float, int)):
               lis_types_real_int = False
            lis_types_length+=1

            self.dicio_vars[var_name]['assigned'] = True

            





         else:
            if var_name not in self.dicio_vars:                                  # e se não há tipo, é porque se presume que a variável já existe
               raise Exception(f"Erro semântico ipdraw: a variável {var_name} não pode ser usada sem ser declarada previamente.")
            

            type_var_name = type(self.dicio_vars[var_name]['value'])
            type_expr_value = type(expr_value)

            if type_expr_value != type_var_name:                              # se a variável existe, o tipo com que foi declarado tem que ser consistente com o tipo que está a ser agora usado 
               raise Exception(f"Erro semântico ipdraw: a variável {var_name} é do tipo {type_var_name}, e o valor que lhe está a ser atribuído ({expr_value}) é do tipo {type_expr_value}.")
            
            if not isinstance(self.dicio_vars[var_name]['value'], (float, int)):
               lis_types_real_int = False
            lis_types_length+=1

            self.dicio_vars[var_name]['value'] = expr_value
            self.dicio_vars[var_name]['assigned'] = True

            


      return lis_types_length, lis_types_real_int, var_name, self.dicio_vars[var_name]['value']                                        # retorna o tipo, caso haja, e um valor boolean a indicar se os assignments feitos são do tipo real ou int (para fins de verificar na função do ciclo for se os assignments fazem sentido)
                                                                                                                                       # e agora também retorna o nome da variável e o seu valor, para ser usado nos assignments do ciclo for

   def visitVarDeclaration(self, ctx:ipdrawParser.VarDeclarationContext):
      var_type = ctx.TYPE().getText()
      value_type = None

      if var_type == 'int':
         value_type = 0
      if var_type == 'real':
         value_type = 2.4
      if var_type == 'bool':
         value_type = False
      if var_type == 'point':
         value_type = (0,0)
      if var_type == 'string':
         value_type = 'dor'


      for var in ctx.ID():
         var_name = var.getText()
         if var_name in self.dicio_vars:     # se há tipo, é porque estas variáveis deviam de estar a ser declaradas pela primeira vez, e não deviam estar no dicio_vars
            raise Exception(f"Erro semântico ipdraw: a variável {var_name} já foi declarada, e não pode ser declarada outra vez.")
         self.dicio_vars[var_name] = {'value': value_type, 'assigned': False}
      return None

   def visitExpr_int(self, ctx:ipdrawParser.Expr_intContext):
      inteiro = ctx.INT().getText()
      try:
         inteiro = int(inteiro)
         return inteiro
      except:
         raise Exception(f"Erro semântico ipdraw: o valor {inteiro} não é um valor do tipo int.")

   def visitExpr_parenthesis(self, ctx:ipdrawParser.Expr_parenthesisContext):
      return self.visit(ctx.expr())

   def visitExpr_sum(self, ctx:ipdrawParser.Expr_sumContext):
      x = self.visit(ctx.expr(0))
      y = self.visit(ctx.expr(1))

      op = ctx.op.text

      pen_flag = False
      point_flag = False

      try:
         x = int(x)
      except:
         try:
            x = float(x)
         except:
            if isinstance(x, Pen):
               pen_flag = True
            elif isinstance(x, tuple):
               point_flag = True
            else:
               raise Exception(f"Erro semântico ipdraw: não é possível fazer operações com os valores '{x}' e '{y}' com o operador '{op}'.")
         
      if pen_flag:
         if not isinstance(y, tuple):
            raise Exception(f"Erro semântico ipdraw: não é possível fazer operações com os valores '{x}' e '{y}' com o operador '{op}'.")
      elif point_flag:
         if not isinstance(y, (Pen, tuple)):
            raise Exception(f"Erro semântico ipdraw: não é possível fazer operações com os valores '{x}' e '{y}' com o operador '{op}'.")
      else:
         try:
            y = int(y)
         except:
            try:
               y = float(y)
            except:
               raise Exception(f"Erro semântico ipdraw: não é possível fazer operações com os valores '{x}' e '{y}' com o operador '{op}'.")

      if op == '+':
         return x + y
      if op == '-':
         return x - y
 
      raise Exception(f"Erro semântico ipdraw: não é possível fazer operações com os valores '{x}' e '{y}' com o operador '{op}'.")

   def visitExpr_or(self, ctx:ipdrawParser.Expr_orContext):
      expr1 = self.visit(ctx.expr(0))
      expr2 = self.visit(ctx.expr(1))
      op = ctx.op.text

      if isinstance(expr1, bool) and isinstance(expr2, bool):
         if op == 'or' or op == '||':
            return expr1 or expr2
         if op == 'xor':
            return expr1 ^ expr2
         
      raise Exception(f"Erro semântico ipdraw: os valores {expr1} e {expr2} não são aptos para operações booleanas com o operador {op}.")

   def visitExpr_REAL(self, ctx:ipdrawParser.Expr_REALContext):
      real = ctx.REAL().getText()
      try:
         real = float(real)
         return real
      except:
         raise Exception(f"Erro semântico ipdraw: o valor {real} não é um valor do tipo real.")

   def visitExpr_and(self, ctx:ipdrawParser.Expr_andContext):
      expr1 = self.visit(ctx.expr(0))
      expr2 = self.visit(ctx.expr(1))
      op = ctx.op.text

      if isinstance(expr1, bool) and isinstance(expr2, bool):
         if op == 'and' or op == '&&':
            return expr1 and expr2
         
      raise Exception(f"Erro semântico ipdraw: os valores {expr1} e {expr2} não são aptos para operações booleanas com o operador {op}.")

   def visitExpr_bool(self, ctx:ipdrawParser.Expr_boolContext):
      value = ctx.BOOL.getText()
      if value == 'false':
         return False
      if value == 'true':
         return True
      raise Exception(f"Erro semântico ipdraw: o valor '{value}' não é do tipo bool.")

   def visitExpr_comparison(self, ctx:ipdrawParser.Expr_comparisonContext):
      expr1 = self.visit(ctx.expr(0))
      expr2 = self.visit(ctx.expr(1))
      op = ctx.op.text


      if not isinstance(expr1, (float, int)) or not isinstance(expr2, (float, int)):
         raise Exception(f"Erro semântico ipdraw: o tipo {expr1} não é compatível com {expr2}, ou não é apto para operações de comparação.")

      if op == ">=":
         return expr1 >= expr2
      if op == "<":
         return expr1 < expr2
      if op == "!=":
         return expr1 != expr2
      if op == "==":
         return expr1 == expr2
      if op == ">":
         return expr1 > expr2
      if op == "<=":
         return expr1 <= expr2
      

      raise Exception(f"Erro semântico ipdraw: o operador {op} é desconhecido.")
      
      
      
      #edit: o problema que eu aqui tinha era que daqui saia True or False, e depois no ciclo while do until, ia ter True or False, para sempre. Ou tinha loop infinito, ou ele nunca começava, porque expressões como dor < 10, se dessem True aqui, esse True em concreto ia para o ciclo while, e ficava lá sempre, mesmo que dor passasse a ser >= 10. Só a primeira verificação é que ia para lá. A solução para este problema que parecia extremamente difícil de resolver é simples: na função do until, chamo esta verificação nesta função a cada iteração do loop. Assim, se dor fosse incrementado numa iteração do while, a verificação seguinte, aqui nesta função, ia ser com o valor atualizado de dor (caso o dicio_vars seja bem atualizado), e atribuia esta verificação à mesma variável referente à verificação no ciclo while, para a substituir a cada iteração
      """ if op == '==' or op == '!=':
         return (expr1 == expr2), expr1, expr2

      if not isinstance(expr1, (float, int)) or not isinstance(expr2, (float, int)):
         raise Exception(f"Erro semântico ipdraw: o tipo {expr1} não é compatível com {expr2}, ou não é apto para operações de comparação.")
      
      try:
         if op == '<=':
            return (expr1 <= expr2), expr1, expr2
         if op == '>=':
            return (expr1 >= expr2), expr1, expr2
         if op == '<':
            return (expr1 < expr2), expr1, expr2
         if op == '>':
            return (expr1 > expr2), expr1, expr2      # para efeitos de saber as variáveis e valores a usar no ciclo for
      except:
         raise Exception(f"Erro semântico ipdraw: o tipo {expr1} não é compatível com {expr2}, ou não é apto para operações de comparação.") 

      """

   def visitExpr_not(self, ctx:ipdrawParser.Expr_notContext):
      condition = self.visit(ctx.expr()) 

      if not isinstance(condition, bool):
         raise Exception(f"Erro semântico ipdraw: o tipo esperado para a expressão a negar é 'bool', mas foi recebido {condition}.")
      return not condition

      """ if not isinstance(condition, bool, tuple):
         raise Exception(f"Erro semântico ipdraw: o tipo esperado para a expressão a negar é 'bool', mas foi recebido {condition}.")
      
      if isinstance(condition, bool):
         return not condition
      return not condition[0] """          # para efeitos de saber as variáveis e valores a usar no ciclo for

   def visitExpr_mul(self, ctx:ipdrawParser.Expr_mulContext):
      x = self.visit(ctx.expr(0))
      y = self.visit(ctx.expr(1))

      op = ctx.op.text

      try:
         x = int(x)
      except:
         try:
            x = float(x)
         except:
            raise Exception(f"Erro semântico ipdraw: não é possível fazer operações como multiplicação com os valores '{x}' e '{y}'.")
         
      try:
         y = int(y)
      except:
         try:
            y = float(y)
         except:
            raise Exception(f"Erro semântico ipdraw: não é possível fazer operações como multiplicação com os valores '{x}' e '{y}'.")

      if op == '*':
         return x * y
      if op == '/':
         return x / y
      if op == '//':
         return x // y
      if op == '%':
         return x % y
      if op == '**':
         return x ** y
      
      raise Exception(f"Erro semântico ipdraw: não é possível fazer operações com os valores '{x}' e '{y}' com o operador '{op}'.")
      

   def visitIf(self, ctx:ipdrawParser.IfContext):
      condition = self.visit(ctx.expr()) 
      if not isinstance(condition, bool):
         raise Exception(f"Erro semântico ipdraw: o tipo esperado para a condição é 'bool', mas foi recebido {condition}.")

      if condition:
         corpo = ctx.stat()
         self.visit(corpo)

      return None

   def visitUntil(self, ctx:ipdrawParser.UntilContext):
      condition = self.visit(ctx.expr()) 
      if not isinstance(condition, bool):
         raise Exception(f"Erro semântico ipdraw: o tipo esperado para a condição é 'bool', mas foi recebido {condition}.")

      while not condition:                         # esta condição é agora atualizada a cada iteração pela chamada recursiva à mesma expr() (que se for a comparação dor < 10, faz esta comparação a cada iteração, com o valor atual de dor)
         self.visit(ctx.stat())
         condition = self.visit(ctx.expr())        # linha que veio salvar a minha dor


   """ def visitFor_loop(self, ctx:ipdrawParser.For_loopContext):
      assignment_1 = ctx.varAssignment(0)
      lis_types_length, lis_types_real_int, varname, var_value = self.visit(assignment_1)
      if lis_types_length != 1 or lis_types_real_int == False:
         raise Exception(f"Erro semântico ipdraw: a primeira VarAssignment do ciclo for tem que ser de apenas uma variável do tipo real ou int.")



      condition = ctx.expr()
      condition = self.visit(condition)
      if not isinstance(condition, bool):
         raise Exception(f"Erro semântico ipdraw: o tipo esperado para a condição do ciclo for é 'bool', mas foi recebido {condition_type}.")


      assignment_2 = ctx.varAssignment(1)
      is_types_length, lis_types_real_int, varname_2, var_value_2 = self.visit(assignment_2)
      if lis_types_length != 1 or lis_types_real_int == False or varname_2 != varname:
         raise Exception(f"Erro semântico ipdraw: a segunda VarAssignment do ciclo for tem que ser de apenas uma variável do tipo real ou int.")

    
      varname = var_value
      while(condition):
         varname += var_value_2 - var_value
         corpo = ctx.stat()
         self.visit(corpo)
         condition = self.visit(ctx.expr())   # linha mágica

      #for i in range(var_value, condition, var_value_2-var_value ):
      #   corpo = ctx.stat()
      #   self.visit(corpo)

      return None """

   def visitPoint(self, ctx:ipdrawParser.PointContext):

      x = self.visit(ctx.expr(0))
      y = self.visit(ctx.expr(1))

      try:
         x = int(x)
      except:
         try:
            x = float(x)
         except:
            raise Exception(f"Erro semântico ipdraw: o ponto tem que ser constituído por '(número, número)' e não por '{x}, {y}'.")
         
      try:
         y = int(y)
      except:
         try:
            y = float(y)
         except:
            raise Exception(f"Erro semântico ipdraw: o ponto tem que ser constituído por '(número, número)' e não por '{x}, {y}'.")

      return (x,y)

   def visitExpr_point(self, ctx:ipdrawParser.Expr_pointContext):
      return self.visit(ctx.point())
   
   def visitExpr_string(self, ctx:ipdrawParser.Expr_stringContext):
      return ctx.STRING().getText()
   
   def visitExpr_var(self, ctx:ipdrawParser.Expr_varContext):
      var_name = ctx.ID().getText()

      if var_name not in self.dicio_vars:
         raise Exception(f"Erro semântico ipdraw: a variável {var_name} não foi declarada previamente.")
      if self.dicio_vars[var_name]['assigned'] == False:
         raise Exception(f"Erro semântico ipdraw: a variável {var_name} foi declarada previamente mas não lhe foi atribuída um valor.")
      return self.dicio_vars[var_name]['value']
   
   def visitPause(self, ctx:ipdrawParser.PauseContext):
      value = self.visit(ctx.expr())

      if not isinstance(value, (float, int)):
         raise Exception(f"Erro semântico ipdraw: o valor atribuído ao pause não é do tipo 'real' ou 'int'.")
      pause(value)
   
   def visitPrint(self, ctx:ipdrawParser.PrintContext):
      try:
         var_name = ctx.ID().getText() + ""
         print(self.dicio_vars[var_name]['value'])
      except:
         try:
            string = ""
            for s in ctx.STRING():
               string += s.getText()
            print(string)
         except:
            raise Exception(f"Erro semântico ipdraw: não se consegue imprimir o valor inserido.")
            
   def visitInteractador(self, ctx:ipdrawParser.InteractadorContext):
      return self.visitChildren(ctx)

   def visitInteractador(self, ctx:ipdrawParser.InteractadorContext):         #função que permite interpretar input do utilizador não como string, mas como comandos ipdraw

      input_string = input("Insira comandos: ")
      input_stream = InputStream(input_string)

      dor = SecondaryCompInterpraDor()
      dor.pen = self.pen                                      
      dor.canvas = self.canvas
      dor.dicio_vars = self.dicio_vars
      lexer = ipdrawLexer(input_stream)
      stream = CommonTokenStream(lexer)
      parser = ipdrawParser(stream)
      tree = parser.program()
      if parser.getNumberOfSyntaxErrors() == 0:
         dor.visit(tree)

      self.dicio_vars = dor.dicio_vars

      #dor qualidade cena