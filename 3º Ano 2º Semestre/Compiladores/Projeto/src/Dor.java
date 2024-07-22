import org.stringtemplate.v4.*;
import org.antlr.v4.runtime.tree.TerminalNode;
import java.util.HashMap;
import java.util.List;
import java.awt.Color;
import java.util.ArrayList;
import org.antlr.v4.runtime.tree.ParseTree;


@SuppressWarnings("CheckReturnValue")
public class Dor extends pdrawBaseVisitor<ST> {

   private STGroup templates = new STGroupFile("pdraw.stg");
   private Integer contaDor = 0;
   private HashMap<String, ST> dicio = new HashMap<>();

   private ArrayList<String> canvas_lis = new ArrayList<>();         // array para guardar os nomes dos canvas criados. Isto serve para associar cada pen a um canvas, sendo que quando uma pen é criada, ela desenha no último canvas criado
   private HashMap<String, String> pen_canvas_dicio = new HashMap<>();

   @Override public ST visitProgram(pdrawParser.ProgramContext ctx) {
      canvas_lis.add("var_Win");
      ST res = templates.getInstanceOf("main");
      res.add("name", "pdraw_program");            //nome do programa que vamos criar
      for(pdrawParser.StatContext s: ctx.stat())
         res.add("program", visit(s));             // preencher o programa com o código correspondente a todos os statements que introduzimos na pipe para o programa
      return res;
   }

   @Override public ST visitStat_PenTypeDef(pdrawParser.Stat_PenTypeDefContext ctx) {
      return visit(ctx.penTypeDef());              // a label Stat_PenTypeDef está definida como: penTypeDef. Este é a única regra/token da label, pelo que vamos visitá-la, porque essa regra tem um significado em si
   }

   @Override public ST visitStat_PenAssign(pdrawParser.Stat_PenAssignContext ctx) {
      return visit(ctx.penAssignment());
   }

   @Override public ST visitStat_PenAcio(pdrawParser.Stat_PenAcioContext ctx) {
      return visit(ctx.penAction());
   }

   @Override public ST visitStat_VarAssign(pdrawParser.Stat_VarAssignContext ctx) {
      return visit(ctx.varAssignment());             
   }

   @Override public ST visitStat_VarDeclaration(pdrawParser.Stat_VarDeclarationContext ctx) {
      return visit(ctx.varDeclaration());             
   }

   @Override public ST visitStat_Exec(pdrawParser.Stat_ExecContext ctx) {
      return visit(ctx.execution());
   }

   @Override public ST visitStat_CanvasDef(pdrawParser.Stat_CanvasDefContext ctx) {
      return visit(ctx.canvasDef());
   }

   @Override public ST visitStat_Print(pdrawParser.Stat_PrintContext ctx) {
      return visit(ctx.print());
   }

   @Override public ST visitStat_PenAlter(pdrawParser.Stat_PenAlterContext ctx) {
      return visit(ctx.penAlter());
   }

   @Override public ST visitStat_Pause(pdrawParser.Stat_PauseContext ctx) {
      return visit(ctx.pause());
   }

   @Override public ST visitStat_Until(pdrawParser.Stat_UntilContext ctx) {
      return visit(ctx.until());
   }

   @Override public ST visitStat_For(pdrawParser.Stat_ForContext ctx) {
      return visit(ctx.for_loop());
   }

   @Override public ST visitStat_Expr(pdrawParser.Stat_ExprContext ctx) {
      return visit(ctx.expr());
   }

   @Override public ST visitStat_Curly(pdrawParser.Stat_CurlyContext ctx) {
      ST res = templates.getInstanceOf("default_instruction");  
      for(pdrawParser.StatContext s: ctx.stat())
         res.add("code", visit(s));  
      return res;
   }

   @Override public ST visitPenAttribute_color(pdrawParser.PenAttribute_colorContext ctx) {
      ST res = templates.getInstanceOf("attribute_setter_for_penTypeDef");
      String color = ctx.Color().getText();
      res.add("attribute", "color");
      res.add("value", '"'+color+'"');
      return res;
   }

   @Override public ST visitPenAttribute_position(pdrawParser.PenAttribute_positionContext ctx) {
      ST res = templates.getInstanceOf("attribute_setter_for_penTypeDef");
      ST position = visit(ctx.expr());
      res.add("attribute", "position");
      res.add("value", position);
      return res;
   }

   @Override public ST visitPenAttribute_orientation(pdrawParser.PenAttribute_orientationContext ctx) {
      ST res = templates.getInstanceOf("attribute_setter_for_penTypeDef");
      ST expr = visit(ctx.expr());
      res.add("attribute", "orientation");
      res.add("value", expr);
      if (ctx.penRotateUnits != null)
         res.add("units", ctx.penRotateUnits.getText());
      return res;
   }

   @Override public ST visitPenAttribute_thickness(pdrawParser.PenAttribute_thicknessContext ctx) {
      ST res = templates.getInstanceOf("attribute_setter_for_penTypeDef");
      ST thickness = visit(ctx.expr());
      res.add("attribute", "thickness");
      res.add("value", thickness);
      return res;
   }

   @Override public ST visitPenAttribute_pressure(pdrawParser.PenAttribute_pressureContext ctx) {
      ST res = templates.getInstanceOf("attribute_setter_for_penTypeDef");
      ST pressure = visit(ctx.expr());
      res.add("attribute", "pressure");
      res.add("value", pressure);
      return res;
   }

   @Override public ST visitPenOptions_forward(pdrawParser.PenOptions_forwardContext ctx) {
      //pen_move(canvas_name, pen_name, value)
      ST res = templates.getInstanceOf("pen_action");         // uso o placeholder pen_action_suffix aqui para ligar o valor a distância que retiro daqui com o nome da caneta e do canvas que retiro do penAction no pen_action
      String pen_option = "forward";
      ST value = visit(ctx.expr());

      String pen_name = "";
      String canvas_name = "";

      
      ParseTree parent = ctx.getParent();
      while (parent != null && !(parent instanceof pdrawParser.PenActionContext)) {
         parent = parent.getParent();
      }
      
      if (parent instanceof pdrawParser.PenActionContext) {
         pdrawParser.PenActionContext PenActionContext = (pdrawParser.PenActionContext) parent;
          pen_name = "var_" + PenActionContext.Id().getText();
          canvas_name = pen_canvas_dicio.get(pen_name);
      } else {
         System.err.println("Erro: não se conseguiu obter o parent context do contexto PenOptions_forwardContext.");
      }
      
      res.add("canvas_name", canvas_name);
      res.add("pen_name", pen_name);
      res.add("pen_option", pen_option);
      res.add("value", value);
      return res;
   }

   @Override public ST visitPenOptions_backward(pdrawParser.PenOptions_backwardContext ctx) {
      ST res = templates.getInstanceOf("pen_action");        
      String pen_option = "backward";
      ST value = visit(ctx.expr());

      String pen_name = "";
      String canvas_name = "";

      
      ParseTree parent = ctx.getParent();
      while (parent != null && !(parent instanceof pdrawParser.PenActionContext)) {
         parent = parent.getParent();
      }
      
      if (parent instanceof pdrawParser.PenActionContext) {
         pdrawParser.PenActionContext PenActionContext = (pdrawParser.PenActionContext) parent;
          pen_name = "var_" + PenActionContext.Id().getText();
          canvas_name = pen_canvas_dicio.get(pen_name);
      } else {
         System.err.println("Erro: não se conseguiu obter o parent context do contexto PenOptions_backwardContext.");
      }
      
      res.add("canvas_name", canvas_name);
      res.add("pen_name", pen_name);

      res.add("pen_option", pen_option);
      res.add("value", value);
      return res;
   }

   @Override public ST visitPenOptions_up(pdrawParser.PenOptions_upContext ctx) {
      ST res = templates.getInstanceOf("pen_action");        
      String pen_option = "up";

      String pen_name = "";
      String canvas_name = "";

      
      ParseTree parent = ctx.getParent();
      while (parent != null && !(parent instanceof pdrawParser.PenActionContext)) {
         parent = parent.getParent();
      }
      
      if (parent instanceof pdrawParser.PenActionContext) {
         pdrawParser.PenActionContext PenActionContext = (pdrawParser.PenActionContext) parent;
          pen_name = "var_" + PenActionContext.Id().getText();
          canvas_name = pen_canvas_dicio.get(pen_name);
      } else {
         System.err.println("Erro: não se conseguiu obter o parent context do contexto PenOptions_upContext.");
      }
      
      res.add("canvas_name", canvas_name);
      res.add("pen_name", pen_name);

      res.add("pen_option", pen_option);
      return res;
   }

   @Override public ST visitPenOptions_down(pdrawParser.PenOptions_downContext ctx) {
      ST res = templates.getInstanceOf("pen_action");        
      String pen_option = "down";

      String pen_name = "";
      String canvas_name = "";

      
      ParseTree parent = ctx.getParent();
      while (parent != null && !(parent instanceof pdrawParser.PenActionContext)) {
         parent = parent.getParent();
      }
      
      if (parent instanceof pdrawParser.PenActionContext) {
         pdrawParser.PenActionContext PenActionContext = (pdrawParser.PenActionContext) parent;
          pen_name = "var_" + PenActionContext.Id().getText();
          canvas_name = pen_canvas_dicio.get(pen_name);
      } else {
         System.err.println("Erro: não se conseguiu obter o parent context do contexto PenOptions_downContext.");
      }
      
      res.add("canvas_name", canvas_name);
      res.add("pen_name", pen_name);

      res.add("pen_option", pen_option);
      return res;
   }

   @Override public ST visitPenOptions_left(pdrawParser.PenOptions_leftContext ctx) {
      ST res = templates.getInstanceOf("pen_action");        
      String pen_option = "left";
      ST value = visit(ctx.expr());
      String pen_rotate_units = null;
      if(ctx.penRotateUnits != null) {
         pen_rotate_units = ctx.penRotateUnits.getText();
      }

      String pen_name = "";
      String canvas_name = "";

      
      ParseTree parent = ctx.getParent();
      while (parent != null && !(parent instanceof pdrawParser.PenActionContext)) {
         parent = parent.getParent();
      }
      
      if (parent instanceof pdrawParser.PenActionContext) {
         pdrawParser.PenActionContext PenActionContext = (pdrawParser.PenActionContext) parent;
          pen_name = "var_" + PenActionContext.Id().getText();
          canvas_name = pen_canvas_dicio.get(pen_name);
      } else {
         System.err.println("Erro: não se conseguiu obter o parent context do contexto PenOptions_leftContext.");
      }
      
      res.add("canvas_name", canvas_name);
      res.add("pen_name", pen_name);

      res.add("pen_option", pen_option);
      res.add("value", value);
      if(pen_rotate_units != null) {
         res.add("units", '"' + pen_rotate_units + '"');
      }
      return res;
   }

   @Override public ST visitPenOptions_right(pdrawParser.PenOptions_rightContext ctx) {
      ST res = templates.getInstanceOf("pen_action");        
      String pen_option = "right";
      ST value = visit(ctx.expr());
      String pen_rotate_units = null;
      if(ctx.penRotateUnits != null) {
         pen_rotate_units = ctx.penRotateUnits.getText();
      }

      String pen_name = "";
      String canvas_name = "";

      
      ParseTree parent = ctx.getParent();
      while (parent != null && !(parent instanceof pdrawParser.PenActionContext)) {
         parent = parent.getParent();
      }
      
      if (parent instanceof pdrawParser.PenActionContext) {
         pdrawParser.PenActionContext PenActionContext = (pdrawParser.PenActionContext) parent;
         pen_name = "var_" + PenActionContext.Id().getText();
         canvas_name = pen_canvas_dicio.get(pen_name);
      } else {
         System.err.println("Erro: não se conseguiu obter o parent context do contexto PenOptions_rightContext.");
      }
      
      res.add("canvas_name", canvas_name);
      res.add("pen_name", pen_name);

      res.add("pen_option", pen_option);
      res.add("value", value);
      if(pen_rotate_units != null) {
         res.add("units", "'" + pen_rotate_units + "'");
      }
      return res;
   }

   @Override public ST visitPenOptions_pause(pdrawParser.PenOptions_pauseContext ctx) {
      ST res = templates.getInstanceOf("pause");
      res.add("value", visit(ctx.expr()));
      return res;
   }

   @Override public ST visitPenTypeDef(pdrawParser.PenTypeDefContext ctx) {      // chegamos aqui da função visitStat_PenTypeDef comentada acima, cuja única funcionalidade é visitar esta função/contexto. Aqui temos que traduzir a expressão/sequência de tokens da gramática do tipo 'define' 'pen' ClassName '{' penAttribute+ '}' ';' em código que faça o desejado (definir/criar um tipo de caneta, com nome dado pelo token ClassName, com os atributos dados pelas regras penAttribute+). Podíamos escrever código java direto, mas aqui temos que usar código String Template, que em si permite criar código em qualquer linguagem que queiramos (na verdade somos nós que o criamos, no ficheiro .stg correspondente) 
      ST res_st = templates.getInstanceOf("pen_def");
      ST attribute_st = templates.getInstanceOf("attribute_setter_for_penTypeDef");     //placeholder; meti string mas podia ter metido qualquer coisa; o java é que se queixava que o attribute_st poderia estão não definido, e então meti isto para resolver

      //criar nova classe de caneta com o nome escolhido
      String pen_class = ctx.Id().getText();
      res_st.add("pen_class", "var_" + pen_class);


      // adicionar os atributos (como podem ser mais que um, temos que iterar)
      for(pdrawParser.PenAttributeContext p: ctx.penAttribute()) {

         ST attribute_placeholder = visit(p);

         ST attribute_setter_penClass_for_penTypeDef = templates.getInstanceOf("attribute_setter_penClass_for_penTypeDef");
         attribute_setter_penClass_for_penTypeDef.add("pen_class", "var_" + pen_class);
         attribute_setter_penClass_for_penTypeDef.add("placeholder_suffix", attribute_placeholder);

         res_st.add("pen_class_attribute_setter", attribute_setter_penClass_for_penTypeDef); 
      }  

      contaDor++;    // void. Já não é usado contador, é usado o prefixo var_ para neutralizar o nome das variáveis
      return res_st;
   }

   @Override public ST visitPenAction(pdrawParser.PenActionContext ctx) {
      ST res = templates.getInstanceOf("default_instruction");

      for(pdrawParser.PenOptionsContext p: ctx.penOptions())
      {
         ST dor_cena = visit(p);
         res.add("code", dor_cena);          
      } 

      return res;
   }

   @Override public ST visitCanvasDef(pdrawParser.CanvasDefContext ctx) {
      ST res = templates.getInstanceOf("create_canvas");
      String className = ctx.Id().getText();
      String title = "\"";

      for (TerminalNode str : ctx.String()) {
         title = title + str.getText();
      }
      title += '"';
      
      String point = visit(ctx.expr()).render();

      String coordinates = point.substring(1, point.length() - 1);
      String[] parts = coordinates.split(",");
       
      
      res.add("canvas_name", className);
      res.add("title", title);
      res.add("x", parts[0].trim());
      res.add("y", parts[1].trim());

      canvas_lis.add("var_" + className);
      return res;
   }

   @Override public ST visitPenAssignment(pdrawParser.PenAssignmentContext ctx) {
      ST res = templates.getInstanceOf("pen_assign");

      //buscar o nome da pen e da classe
      String pen_name = "var_" + ctx.Id(0).getText();

      try {
         String pen_class = "var_" + ctx.Id(1).getText();
         res.add("pen_class", pen_class);
         res.add("pen_name", pen_name);
      }  catch (Exception e) {
         res.add("pen_name", pen_name);
      }


      pen_canvas_dicio.put( pen_name, canvas_lis.get(canvas_lis.size() - 1));
      return res;
   }

   @Override public ST visitPrint(pdrawParser.PrintContext ctx) {
      ST res = templates.getInstanceOf("print");
      String print_var = null;
      try {
         print_var = ctx.id.getText();
         res.add("var", "var_" + print_var);
      } catch(Exception dor) {
         try {
            print_var = ctx.id_class.getText() + "";
            res.add("var", "var_" + print_var);
         }
         catch(Exception qualidade) {
            try {
               print_var = "";
               for (int i = 0; i < ctx.String().size(); i++) {
                  String s = ctx.String(i).getText();
                  print_var += s;
               }
               res.add("var", '"' + print_var.replace("\"", "") + '"');
            } catch(Exception cena) {
               System.out.println("Erro: não há nada para dar print.");
               System.exit(0);
            }
         }
      }
      return res;
   }

   @Override public ST visitPenAlter(pdrawParser.PenAlterContext ctx) {
      ST res = templates.getInstanceOf("attribute_setter_penName_for_penTypeDef");
      String pen_name = "var_" + ctx.Id().getText();
      ST attribute = visit(ctx.penAttribute());
      res.add("pen_name", pen_name);
      res.add("value", attribute);
      return res;
   }

   @Override public ST visitExecution(pdrawParser.ExecutionContext ctx) {
      ST res = templates.getInstanceOf("default_instruction");
      String string_exec = "";
      for (int i = 0; i < ctx.String().size(); i++) {
         String s = ctx.String(i).getText();
         string_exec += s;
      }

      for (int dor = 0; dor < ctx.Id().size(); dor++) {
         ST exec = templates.getInstanceOf("exec");
         exec.add("commands", string_exec);
         String var_pen = "var_" + ctx.Id(dor).getText();
         String canvas = pen_canvas_dicio.get(var_pen);
         exec.add("canvas", canvas);
         exec.add("pen", var_pen);
         res.add("code", exec);
      }
      return res;
   }

   @Override public ST visitPause(pdrawParser.PauseContext ctx) {
      ST res = templates.getInstanceOf("pause");
      ST value = visit(ctx.expr());
      res.add("value", value);
      return res;
   }

   @Override public ST visitUntil(pdrawParser.UntilContext ctx) {
      ST res = templates.getInstanceOf("until");
      ST bool_expr = visit(ctx.expr());
      ST stat = visit(ctx.stat());

      res.add("expr", bool_expr);
      res.add("stat", stat);
      return res;
   }

   @Override public ST visitFor_loop(pdrawParser.For_loopContext ctx) {
      ST res = templates.getInstanceOf("for");
      ST assign_expr = visit(ctx.varAssignment(0));
      ST bool_expr = visit(ctx.expr());
      ST arith_expr = visit(ctx.varAssignment(1));
      ST stat = visit(ctx.stat());

      res.add("expr1", assign_expr);
      res.add("expr2", bool_expr);
      res.add("expr3", arith_expr);
      res.add("stat", stat);

      return res;
   }

   @Override public ST visitExpr_stdin(pdrawParser.Expr_stdinContext ctx) {
      ST res = templates.getInstanceOf("stdin");
      String res_string = "";
      for (int i = 0; i < ctx.String().size(); i++) {
         String s = ctx.String(i).getText();
         res_string += s;
      }
      res.add("string", '"' + res_string.replace("\"", "") + '"');
      return res;
   }

   @Override public ST visitExpr_parenthesis(pdrawParser.Expr_parenthesisContext ctx) {
      ST res = templates.getInstanceOf("parenthesis");
      res.add("value", visit(ctx.expr()));
      return res;
   }

   @Override public ST visitExpr_bool_and(pdrawParser.Expr_bool_andContext ctx) {
      ST res = templates.getInstanceOf("operation");
      res.add("expr1", visit(ctx.expr(0)));
      res.add("expr2", visit(ctx.expr(1)));
      res.add("op", "and");
      return res;
   }

   @Override public ST visitExpr_bool_not(pdrawParser.Expr_bool_notContext ctx) {
      ST res = templates.getInstanceOf("bool_not");
      res.add("expr", visit(ctx.expr()));
      return res;
   }

   @Override public ST visitExpr_mult(pdrawParser.Expr_multContext ctx) {
      ST res = templates.getInstanceOf("operation");
      res.add("expr1", visit(ctx.expr(0)));
      res.add("expr2", visit(ctx.expr(1)));

      String op = ctx.op.getText();
      if (op.matches("\\\\"))
         op = "%";

      res.add("op", op);
      return res;
   }

   @Override public ST visitExpr_var(pdrawParser.Expr_varContext ctx) {          // tenho de guardar as variáveis num dicionário, pelo menos as pens, porque nos exemplos é válido somar uma Pen com um Ponto, o que em Pytho obviamente não pinta (pen_p1 + (a,b) dá erro, o que se quer é pen_p1.pos[0] + a, pen_p1.pos[1] + b)
      ST res = templates.getInstanceOf("placeholder");

      String variable = "var_" + ctx.Id().getText(); 
      res.add("text", variable);
      return res;
   }

   @Override public ST visitExpr_bool(pdrawParser.Expr_boolContext ctx) {
      ST res = templates.getInstanceOf("placeholder");
      String variable = ctx.Bool().getText(); 
      res.add("text", variable);
      return res;
   }

   @Override public ST visitExpr_bool_comparison(pdrawParser.Expr_bool_comparisonContext ctx) {
      ST res = templates.getInstanceOf("operation");
      res.add("expr1", visit(ctx.expr(0)));
      res.add("expr2", visit(ctx.expr(1)));
      res.add("op", ctx.op.getText());
      return res;
   }

   @Override public ST visitExpr_int(pdrawParser.Expr_intContext ctx) {
      ST res = templates.getInstanceOf("placeholder");
      String variable = ctx.Int().getText(); 
      res.add("text", variable);
      return res;
   }

   @Override public ST visitVarAssignment(pdrawParser.VarAssignmentContext ctx) {
      // Type? VarName ('=' expr) (',' VarName '=' expr)* ';'?;                                           #var_assign

      ST res = templates.getInstanceOf("default_instruction");

      // ver o tipo, se houver
      String varType = null;
      if (ctx.Type() != null)
      {
         varType = ctx.Type().getText();
         if ( varType.toLowerCase().matches("string") )
         {
            varType = "str";
         }
         else if ( varType.toLowerCase().matches("real") )
         {
            varType = "float";
         }
         else if ( varType.toLowerCase().matches("int") )
         {
            varType = "int";
         }
         else{
            varType = null;
         }
      }


      for(int i = 0; i < ctx.Id().size(); i++)
      {
         String varName = "var_" + ctx.Id(i).getText();
         ST value = visit(ctx.expr(i));

         ST assignment = templates.getInstanceOf("assign");
         assignment.add("var_name", varName);
         assignment.add("value", value);

         if (varType != null)
         {
            assignment.add("type", varType);
         }   
         res.add("code", assignment);
      }
      return res;
   }

   @Override public ST visitVarDeclaration(pdrawParser.VarDeclarationContext ctx) {       // o interpretador trata das declarações. No Python não existem declarações
      //Type VarName (',' VarName)* ';' ;
      //ST res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public ST visitExpr_point(pdrawParser.Expr_pointContext ctx) {
      return visit(ctx.point());
   }

   @Override public ST visitExpr_sum(pdrawParser.Expr_sumContext ctx) {
      ST res = templates.getInstanceOf("operation");
      res.add("expr1", visit(ctx.expr(0)));
      res.add("expr2", visit(ctx.expr(1)));
      res.add("op", ctx.op.getText());
      return res;
   }

   @Override public ST visitExpr_real(pdrawParser.Expr_realContext ctx) {
      ST res = templates.getInstanceOf("placeholder");
      String variable = ctx.Real().getText(); 
      res.add("text", variable);
      return res;
   }

   @Override public ST visitExpr_string(pdrawParser.Expr_stringContext ctx) {
      ST res = templates.getInstanceOf("placeholder");
      String res_string = "";
      for (int i = 0; i < ctx.String().size(); i++) {
         String s = ctx.String(i).getText();
         res_string += s;
      }
      res.add("text", '"' + res_string.replace("\"", "") + '"');
      return res;
   }

   @Override public ST visitExpr_bool_or_xor(pdrawParser.Expr_bool_or_xorContext ctx) {
      ST res = templates.getInstanceOf("operation");
      res.add("expr1", visit(ctx.expr(0)));
      res.add("expr2", visit(ctx.expr(1)));

      String op = ctx.op.getText();
      if ((op.toLowerCase()).matches("or")) {
         res.add("op", "or");
      }
      else if ((op.toLowerCase()).matches("xor")) {
         res.add("op", "^");
      }
      else {
         System.out.println("Erro: o operador " + op + " é desconhecido.");
         System.exit(0);
      }

      return res;
   }

   @Override public ST visitExpr_conversion(pdrawParser.Expr_conversionContext ctx) {
      ST res = templates.getInstanceOf("conversion");
      String type = ctx.Type().getText();
      type = type.toLowerCase();

      if(type.matches("string")) {
         res.add("type", "str");
      }
      else if(type.matches("int")) {
         res.add("type", "int");
      }
      else if(type.matches("real")) {
         res.add("type", "float");
      }
      else {
         System.out.println("Erro: o tipo para converter (" + type + ") não é string, nem int, nem double.");
         System.exit(0);
      }

      res.add("expr", visit(ctx.expr()));
      
      return res;
   }

   @Override public ST visitPoint(pdrawParser.PointContext ctx) {
      ST res = templates.getInstanceOf("point");
      res.add("expr1", visit(ctx.expr(0)));
      res.add("expr2", visit(ctx.expr(1)));
      return res;
   } 






   @Override public ST visitStat_if(pdrawParser.Stat_ifContext ctx) {
      return visitChildren(ctx);
   }

   @Override public ST visitIf(pdrawParser.IfContext ctx) {
      // if: 'if' '(' expr ')' stat ';'?;

      ST expr = visit(ctx.expr());
      ST stat = visit(ctx.stat());

      ST res = templates.getInstanceOf("if");
      res.add("expr", expr);
      res.add("stat", stat);
      return res;
   }

   @Override public ST visitStat_canvas_select(pdrawParser.Stat_canvas_selectContext ctx) {
      return visitChildren(ctx);
   }

   @Override public ST visitCanvas_select(pdrawParser.Canvas_selectContext ctx) {
      // canvas_select:  'pen' VarName 'select' 'canvas' ClassName ';';

      String pen = "var_" + ctx.Id(0).getText();
      String canvas = "var_" + ctx.Id(1).getText();

      pen_canvas_dicio.put(pen, canvas);

      ST res = null;
      return res;

   }

   @Override public ST visitStat_canvas_color(pdrawParser.Stat_canvas_colorContext ctx) {
      return visitChildren(ctx);
   }

   @Override public ST visitCanvas_color(pdrawParser.Canvas_colorContext ctx) {
      String canvas = "var_" + ctx.Id().getText();
      String color = ctx.Color().getText();

      ST res = templates.getInstanceOf("canvas_color");
      res.add("canvas", canvas);
      res.add("color", color);
      return res;
   }

   @Override public ST visitStat_function_declaration(pdrawParser.Stat_function_declarationContext ctx) {
      return visitChildren(ctx);
   }

   @Override public ST visitFunction_declaration(pdrawParser.Function_declarationContext ctx) {
      // funções reconhecem variáveis do contexto em que se encontram, e esse contexto não reconhece as suas. As variáveis locais aqui declaradas com o mesmo nome que variáveis de contexto anterior, não interferem com o valor das variáveis anteriores
      // 'def' 'function' VarName '(' (Type VarName (',' Type VarName)*)? ')' stat ';';

      String function_name = ctx.Id(0).getText();
   
      ST res = templates.getInstanceOf("function_declaration");
      res.add("name", "var_" + function_name);

      if(ctx.Id().size() != 1) {
         for(int i = 0; i < ctx.Type().size(); i++) {
            String param = "var_" + ctx.Id(i+1).getText();
            res.add("param", param);
         }

      }
      res.add("stat", visit(ctx.stat()));
      return res;
   }

   @Override public ST visitStat_function(pdrawParser.Stat_functionContext ctx) {
      return visit(ctx.function());
   }

   @Override public ST visitFunction(pdrawParser.FunctionContext ctx) {
      // function:       'functionador' VarName '(' (expr (',' expr)*)? ')' ';'?;

      String function_name = "var_" + ctx.Id().getText();

      ST res = templates.getInstanceOf("function_invocation");
      res.add("name", function_name);

      for(int i = 0; i < ctx.expr().size(); i++) {
         ST param = visit(ctx.expr(i));
         res.add("param", param);
      }
      return res;
   }
}
