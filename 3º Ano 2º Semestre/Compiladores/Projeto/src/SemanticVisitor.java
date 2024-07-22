import java.util.*;
import java.io.IOException;

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;


@SuppressWarnings("CheckReturnValue")
public class SemanticVisitor extends pdrawBaseVisitor<String> {
   // Map the variable types
   HashMap<String, String> varTypes = new HashMap<>();
   Integer erros_contador = 0;
   HashMap<String, ArrayList<String>> functions = new HashMap<>();
   //private Map<String, String> penTypeDefMap = new HashMap<>();

   @Override public String visitProgram(pdrawParser.ProgramContext ctx) {
      varTypes.put("PI", "real");
      varTypes.put("Win", "canvas");
      return visitChildren(ctx);
   }

   @Override public String visitStat_PenTypeDef(pdrawParser.Stat_PenTypeDefContext ctx) {
      return visit(ctx.penTypeDef()); 
   }

   @Override public String visitStat_PenAssign(pdrawParser.Stat_PenAssignContext ctx) {
      // Continuar visitando os filhos do contexto atual
      return visitChildren(ctx);
   }

   @Override public String visitStat_PenAcio(pdrawParser.Stat_PenAcioContext ctx) {
      // Continuar visitando os filhos do contexto atual
      return visitChildren(ctx);
   }

   @Override public String visitStat_VarDeclaration(pdrawParser.Stat_VarDeclarationContext ctx) {
      // Continuar visitando os filhos do contexto atual
      return visitChildren(ctx);
   }
   

   @Override public String visitStat_VarAssign(pdrawParser.Stat_VarAssignContext ctx) {
      return visitChildren(ctx);
   }


   @Override public String visitStat_Exec(pdrawParser.Stat_ExecContext ctx) {
      return visitChildren(ctx);
   }

   @Override public String visitStat_CanvasDef(pdrawParser.Stat_CanvasDefContext ctx) {
      return visitChildren(ctx);
   }

   @Override public String visitStat_Print(pdrawParser.Stat_PrintContext ctx) {
      return visitChildren(ctx);
   }

   @Override public String visitStat_PenAlter(pdrawParser.Stat_PenAlterContext ctx) {
      return visitChildren(ctx);
   }

   @Override public String visitStat_Pause(pdrawParser.Stat_PauseContext ctx) {
      return visitChildren(ctx);
   }

   @Override public String visitStat_Until(pdrawParser.Stat_UntilContext ctx) {
      return visitChildren(ctx);
   }

   @Override public String visitStat_For(pdrawParser.Stat_ForContext ctx) {
      return visitChildren(ctx);
   }

   @Override public String visitStat_Expr(pdrawParser.Stat_ExprContext ctx) {
      return visitChildren(ctx);
   }

   @Override public String visitStat_Curly(pdrawParser.Stat_CurlyContext ctx) {
      return visitChildren(ctx);
   }

   @Override public String visitPenAttribute_color(pdrawParser.PenAttribute_colorContext ctx) {
      return "";
   }

   @Override public String visitPenAttribute_position(pdrawParser.PenAttribute_positionContext ctx) {
      // Acessar o tipo da expressão dentro do contexto
      String expr_type = visit(ctx.expr());

      // Verificar se a expressão é um número
      if(!expr_type.matches("point")){
         System.err.println("Erro: A pressão requer ponto, e não um " + expr_type + ".");
         erros_contador++;
         System.exit(0);
         return "";
      } 
      return "";
   }

   @Override public String visitPenAttribute_orientation(pdrawParser.PenAttribute_orientationContext ctx) {
      // Acessar o tipo da expressão dentro do contexto
      String expr_type = visit(ctx.expr());

      // Verificar se a expressão é um número
      if(!isNumeric(expr_type)){
         System.err.println("Erro: A orientação requer um valor numérico, e não um " + expr_type + ".");
         erros_contador++;
         System.exit(0);
         return "";
      } 
      return "";
   }

   @Override public String visitPenAttribute_thickness(pdrawParser.PenAttribute_thicknessContext ctx) {
      // Acessar o tipo da expressão dentro do contexto
      String expr_type = visit(ctx.expr());

      // Verificar se a expressão é um número
      if(!isNumeric(expr_type)){
         System.err.println("Erro: A espessura requer um valor numérico, e não um " + expr_type + ".");
         erros_contador++;
         System.exit(0);
         return "";
      } 
      return "";
   }

   @Override public String visitPenAttribute_pressure(pdrawParser.PenAttribute_pressureContext ctx) {
      // Acessar o tipo da expressão dentro do contexto
      String expr_type = visit(ctx.expr());

      // Verificar se a expressão é um número
      if(!isNumeric(expr_type)){
         System.err.println("Erro: A pressão requer um valor numérico, e não um " + expr_type + ".");
         erros_contador++;
         System.exit(0);
         return "";
      } 
      return "";
   }

   @Override public String visitPenOptions_forward(pdrawParser.PenOptions_forwardContext ctx) {
      // Acessar o tipo da expressão dentro do contexto
      String expr_type = visit(ctx.expr());

      // Verificar se a expressão é um número
      if(!isNumeric(expr_type)){
         System.err.println("Erro: A distância a andar para a frente requer um número, e não um " + expr_type + ".");
         erros_contador++;
         System.exit(0);
         return "";
      } 
      return "";
   }

   @Override public String visitPenOptions_backward(pdrawParser.PenOptions_backwardContext ctx) {
      // Acessar o tipo da expressão dentro do contexto
      String expr_type = visit(ctx.expr());

      // Verificar se a expressão é um número
      if(!isNumeric(expr_type)){
         System.err.println("Erro: A distância a andar para trás requer um número, e não um " + expr_type + ".");
         erros_contador++;
         System.exit(0);
         return "";
      } 
      return "";
   }

   @Override public String visitPenOptions_up(pdrawParser.PenOptions_upContext ctx) {
      return visitChildren(ctx);
   }

   @Override public String visitPenOptions_down(pdrawParser.PenOptions_downContext ctx) {
      return visitChildren(ctx);
   }

   @Override public String visitPenOptions_left(pdrawParser.PenOptions_leftContext ctx) {
      // Acessar o tipo da expressão dentro do contexto
      String expr_type = visit(ctx.expr());

      // Verificar se a expressão é um número
      if(!isNumeric(expr_type)){
         System.err.println("Erro: A viragem para a esquerda requer um número, e não um " + expr_type + ".");
         erros_contador++;
         System.exit(0);
         return "";
      } 
      return "";
   }

   @Override public String visitPenOptions_right(pdrawParser.PenOptions_rightContext ctx) {
      // Acessar o tipo da expressão dentro do contexto
      String expr_type = visit(ctx.expr());

      // Verificar se a expressão é um número
      if(!isNumeric(expr_type)){
         System.err.println("Erro: A viragem para a direira requer um número, e não um " + expr_type + ".");
         erros_contador++;
         System.exit(0);
         return "";
      } 
      return "";
   }

   @Override public String visitPenOptions_pause(pdrawParser.PenOptions_pauseContext ctx) {
      // Acessar o tipo da expressão dentro do contexto
      String expr_type = visit(ctx.expr());

      // Verificar se a expressão é um número
      if(!isNumeric(expr_type)){
         System.err.println("Erro: O valor de pausa deve ser um número, e não um " +expr_type + ".");
         erros_contador++;
         System.exit(0);
         return "";
      } 
      return "";
   }

   @Override public String visitPenTypeDef(pdrawParser.PenTypeDefContext ctx) {
      // Obter o nome da classe da caneta
      String pen_type_name = ctx.Id().getText();
      
      // Verificar se a classe de caneta já foi definida anteriormente
      //if (penTypeDefMap.containsKey(pen_type_name)) {
      if(varTypes.containsKey(pen_type_name)) {
         System.err.println("Erro: Tipo de caneta '" + pen_type_name + "' já foi declarado.");
         erros_contador++;
         System.exit(0);
         return "";
      }
      // Adicionar a definição de tipo de caneta ao mapa
      varTypes.put(pen_type_name, "pen_class");

      return visitChildren(ctx);
   }

   @Override public String visitPenAction(pdrawParser.PenActionContext ctx) {
      // só se podem aplicar ações a pens. É preciso ver (1) se a pen existe, e (2) se a variável é uma pen
      //
      String var = ctx.Id().getText();

      if(!varTypes.containsKey(var)) {
         System.err.println("Erro: A pen '" + var + "' não pode fazer ações porque ela não foi declarada.");
         erros_contador++;
         System.exit(0);
      }

      if( !(varTypes.get(var)).matches("pen") )
      {
         System.err.println("Erro: A variável '" + var + "' não pode fazer ações porque ela não é uma pen.");
         erros_contador++;
         System.exit(0);
      }

      return visitChildren(ctx);
   }

   @Override public String visitCanvasDef(pdrawParser.CanvasDefContext ctx) {
      // (1) verificar se o canvas já existe
      String canvas = ctx.Id().getText();

      if(varTypes.containsKey(canvas)) {
         System.err.println("Erro: O canvas '" + canvas + "' não pode ser criado porque já existe.");
         erros_contador++;
         System.exit(0);
      }

      varTypes.put(canvas, "canvas");

      String canvas_point = visit(ctx.expr());
      if(!canvas_point.matches("point")) {
         System.err.println("Erro: O canvas '" + canvas + "' não pode ter posição numa variável do tipo '" +canvas_point + "'.");
         erros_contador++;
         System.exit(0);
      }

      return "";

   }

   @Override public String visitPenAssignment(pdrawParser.PenAssignmentContext ctx) {
      // verificar se pen já existe, e se o tipo de pen existe, caso seja expresso
      
      String pen_name = ctx.Id(0).getText();
      String pen_type_name = null;

      if(ctx.Id(1) != null)
         pen_type_name = ctx.Id(1).getText();

         if(varTypes.containsKey(pen_name)) {
            System.err.println("Erro: A pen '" + pen_name + "' não pode ser criada porque já existe.");
            erros_contador++;
            System.exit(0);
         }

         if(pen_type_name != null) {
            if(!varTypes.containsKey(pen_type_name)) {
               System.err.println("Erro: A pen '" + pen_name + "' não pode ser criada porque o tipo de pen expresso '" + pen_type_name + "' não existe.");
               erros_contador++;
               System.exit(0);
            }
         }

      varTypes.put(pen_name, "pen");
      return "";
   }

   @Override public String visitVarAssignment(pdrawParser.VarAssignmentContext ctx) {        // stress das variáveis escaparem à semântica está no ciclo for
      // o tipo na regra é opcional
      // para cada variável, temos de verificar que já existem no dicio (se não houver type são assignments, se houver são declarações), e se o seu tipo bate certo com o tipo da expressão

      String type = null;  
      if(ctx.Type() != null)
      {
         type = ctx.Type().getText();
      }

      for(int i = 0; i < ctx.Id().size(); i++) {    
         String var = ctx.Id(i).getText();

         if(var.matches("background")) {
            erros_contador++;
            System.err.println("Não se pode usar a palavra " + var + " porque é reservada.");
            System.exit(0);
         }

         if(type == null) {                                          // caso não haja tipo, é porque a variável tem que existir
            if(!varTypes.containsKey(var)) {
               System.err.println("Erro: Não se pode atribuir um valor à variável '" + var + "' porque ela não foi declarada.");
               erros_contador++;
               System.exit(0);
            }

            String var_type = varTypes.get(var);                     // se a variável já existe, então este é o seu tipo
            String expr_type = visit(ctx.expr(0));                 // este é o tipo do valor que lhe estou a atribuir

            if ( (isNumeric(var_type) && isNumeric(expr_type)) || ( (var_type.matches("pen") && expr_type.matches("point")) || (var_type.matches("point") && expr_type.matches("pen")) || (var_type.matches("bool") && expr_type.matches("bool")) || (var_type.matches("string") && expr_type.matches("string"))  ) ) {
               
            }
            else {
               System.err.println("Erro: O tipo da variável '" + var + "' (" + var_type + ") não corresponde ao tipo de expressão que lhe está a ser atribuída (" + expr_type + ").");
               erros_contador++;
               System.exit(0);
            }


         }
         else {
            if(varTypes.containsKey(var)) {
               System.err.println("Erro: Não se pode declarar a variável '" + var + "' porque ela já foi declarada.");
               erros_contador++;
               System.exit(0);
            }

            String expr_type = visit(ctx.expr(0));
            varTypes.put(var, expr_type);

            if ( (isNumeric(type) && isNumeric(expr_type)) || ( (type.matches("pen") && expr_type.matches("point")) || (type.matches("point") && expr_type.matches("pen")) || (type.matches("bool") && expr_type.matches("bool")) || (type.matches("string") && expr_type.matches("string"))  ) ) {
               
            }

            else {
               System.err.println("Erro: O tipo da variável '" + var + "' (" + type + ") não corresponde ao tipo de expressão que lhe está a ser atribuída 4(" + expr_type + ").");
               erros_contador++;
               System.exit(0);
            }
         }
      }
      String first_var = ctx.Id(0).getText();
      String first_var_type = varTypes.get(first_var);

      if( (ctx.Id().size() == 1) && (isNumeric(first_var_type)) ) {  // para informar o ciclo_for se temos apenas uma variável a ser assigned no VarAssignment, e se é do tipo numérico
         return "true";   
      }
      else {
         return "false";
      }
   }

   @Override public String visitVarDeclaration(pdrawParser.VarDeclarationContext ctx) {
      String type = ctx.Type().getText();

      for(int i = 0; i < ctx.Id().size(); i++)
      {
         String var = ctx.Id(i).getText();
         if(varTypes.containsKey(var)) {
            System.err.println("Erro: Não se pode declarar a variável '" + var + "' porque ela já foi declarada.");
            erros_contador++;
            System.exit(0);
         }
         varTypes.put(var, type);
      }
      return "";
   }

   @Override public String visitPrint(pdrawParser.PrintContext ctx) {
      String var = null;

      if(ctx.Id() != null) {
         var = ctx.Id().getText();
         if(!varTypes.containsKey(var)) {
            System.err.println("Erro: Não se pode imprimir a variável '" + var + "' porque ela não foi declarada.");
            erros_contador++;
            System.exit(0);
         }
         else {
            return varTypes.get(var);
         }
      }
      else if (ctx.Id() != null) {
         var = ctx.Id().getText();
         if(!varTypes.containsKey(var)) {
            System.err.println("Erro: Não se pode imprimir o tipo de caneta '" + var + "' porque ela não foi declarada.");
            erros_contador++;
            System.exit(0);
         }
         else {
            return varTypes.get(var);
         }
      }
      return "";
   }

   @Override public String visitPenAlter(pdrawParser.PenAlterContext ctx) {
      String var = ctx.Id().getText();
      if(!varTypes.containsKey(var)) {
         System.err.println("Erro: Variável '" + var + "' não existe.");
         erros_contador++;
         System.exit(0);
         return "";
      }
      if(!(varTypes.get(var)).matches("pen")) {
         System.err.println("Erro: A variável '" + var + "' não é uma caneta.");
         erros_contador++;
         System.exit(0);
         return "";
      }
      return visitChildren(ctx);
   }

   @Override public String visitExecution(pdrawParser.ExecutionContext ctx) {
      //as VarNames têm que existir e ser pens
      for(int i=0; i<ctx.Id().size(); i++) {
         String var = ctx.Id(i).getText();
         if(!varTypes.containsKey(var)) {
            System.err.println("Erro: Não se pode carregar comandos externos para a pen '" +  var + "' pois ela não existe.");
            erros_contador++;
            System.exit(0);
            return "";
         }

         if(!varTypes.get(var).matches("pen")) {
            System.err.println("Erro: Não se pode carregar comandos externos para a variável '" +  var + "' pois ela não é uma pen.");
            erros_contador++;
            System.exit(0);
            return "";
         }
      }
      return "";
   }

   @Override public String visitPause(pdrawParser.PauseContext ctx) {
      // Acessar o tipo da expressão dentro do contexto
      String expr_type = visit(ctx.expr());

      // Verificar se a expressão é um número
      if(!isNumeric(expr_type)){
         System.err.println("Erro: O valor de pausa deve ser um número, e não um " +expr_type + ".");
         erros_contador++;
         System.exit(0);
         return "";
      } 
      return "";
   }

   @Override public String visitUntil(pdrawParser.UntilContext ctx) {
      String expr_type = visit(ctx.expr());
      if(!expr_type.matches("bool")) {
         System.err.println("Erro: A expressão de repetição deve ser booleana, e não " + expr_type + ".");
         erros_contador++;
         System.exit(0);
         return "";
      }
      return visit(ctx.stat());
   }

   @Override public String visitFor_loop(pdrawParser.For_loopContext ctx) {
      // para o primeiro VarAssignment só se pode ter uma declaração (VarName.size() == 1), caso haja Type trata-se de declaração com assignment, caso contrário é so assignment
      // é preciso saber se a expr da segunda VarAssignment é do tipo 'numeric'
      // para a expr, tem de ser do tipo 'bool'


      String varAssign1 = visit(ctx.varAssignment(0));
      if(varAssign1.matches("false")) {
         System.err.println("Erro: O primeiro assignment do ciclo for tem de ser do tipo numérico.");
         erros_contador++;
         System.exit(0);
         return "";
      }


      String expr = visit(ctx.expr());
      if (!expr.matches("bool")) {
         System.err.println("Erro: A expressão do ciclo for tem de ser booleana.");
         erros_contador++;
         System.exit(0);
         return "";
      }


      String varAssign2 = visit(ctx.varAssignment(1));
      if(varAssign2.matches("false")) {
         System.err.println("Erro: O segundo assignment do ciclo for tem de ser do tipo numérico.");
         erros_contador++;
         System.exit(0);
         return "";
      }


      return visit(ctx.stat());
   }

   @Override public String visitExpr_stdin(pdrawParser.Expr_stdinContext ctx) {
      return "string";
   }

   @Override public String visitExpr_parenthesis(pdrawParser.Expr_parenthesisContext ctx) {
      return visit(ctx.expr());
   }

   @Override public String visitExpr_bool_and(pdrawParser.Expr_bool_andContext ctx) {
      String expr_type_0 = visit(ctx.expr(0));
      String expr_type_1 = visit(ctx.expr(1));

      if(!expr_type_0.matches("bool") || !expr_type_1.matches("bool")) {
         System.err.println("Erro: operações booleanas requerem expressões booleanas, e não "+ expr_type_0 + " e " + expr_type_1 + ".");
         erros_contador++;
         System.exit(0);
         return "";
      }
      return "bool";
   }

   @Override public String visitExpr_bool_not(pdrawParser.Expr_bool_notContext ctx) {
      String expr0_type = visit(ctx.expr());
      if(!expr0_type.matches("bool")) {
         System.err.println("Erro: A negação lógica requer uma expressão booleana, e não " + expr0_type + ".");
         erros_contador++;
         System.exit(0);
         return "";
      }
      return "bool";
   }

   @Override public String visitExpr_mult(pdrawParser.Expr_multContext ctx) {
      String expr0_type = visit(ctx.expr(0));
      String expr1_type = visit(ctx.expr(1));
      
      if(!isNumeric(expr0_type) || !isNumeric(expr1_type)) {
         System.err.println("Erro: Uma operação numérica deve conter 2 valores numéricos, e não " + expr0_type + " e " + expr1_type + ".");
         erros_contador++;
         System.exit(0);
         return "";
      }

      if(expr0_type.matches("real") || expr1_type.matches("real") )
         return "real";
      return "int";
   }

   @Override public String visitExpr_var(pdrawParser.Expr_varContext ctx) {
      String var = ctx.Id().getText();
      String var_type = null;
      if(varTypes.containsKey(var)) {
         var_type = varTypes.get(var);
      }
      else {
         erros_contador++;
         System.err.println("Não se pode usar a variável " + var + " porque não foi declarada.");
         System.exit(0);
         return "";
      }
      return var_type;    // string que diz o tipo
   }

   @Override public String visitExpr_bool(pdrawParser.Expr_boolContext ctx) {
      return "bool";
   }

   @Override public String visitExpr_bool_comparison(pdrawParser.Expr_bool_comparisonContext ctx) {  
      String expr0_type = visit(ctx.expr(0));
      String expr1_type = visit(ctx.expr(1));
      String op = ctx.op.getText();

      if(op.matches("==") || op.matches("!=")) {
         return "bool";
      }

      if(isNumeric(expr0_type) && isNumeric(expr1_type)) 
         return "bool";

      System.err.println("Erro: Não se pode comparar variáveis do tipo '" + expr0_type + "' e '" + expr1_type  + "'.");
      erros_contador++;
      System.exit(0);  
      return null;   
   }

   @Override public String visitExpr_int(pdrawParser.Expr_intContext ctx) {
      return "int";
   }

   @Override public String visitExpr_point(pdrawParser.Expr_pointContext ctx) {
      return visitChildren(ctx);
   }

   @Override public String visitExpr_sum(pdrawParser.Expr_sumContext ctx) {
      String expr0_type = visit(ctx.expr(0));
      String expr1_type = visit(ctx.expr(1));

      if (   (isNumeric(expr0_type) && isNumeric(expr1_type))  ||  (expr0_type.matches("pen") && expr1_type.matches("point"))  ||  (expr1_type.matches("pen") && expr0_type.matches("point")) || (expr0_type.matches("point") && expr1_type.matches("point")) || ((expr0_type.matches("string") && expr1_type.matches("string"))) ) {
         if(expr0_type.matches("real") || expr1_type.matches("real") )
            return "real";
         else if(( expr0_type.matches("point") && expr1_type.matches("pen") ) || (( expr0_type.matches("pen") && expr1_type.matches("point") )) )
            return "point";
         else if( expr0_type.matches("string") && expr1_type.matches("string") )
            return "string";
         return "int";
      }
      
      else{
         System.err.println("Erro: Uma operanção numérica deve conter 2 valores numéricos, uma pen e um ponto, ou dois pontos, e não " + expr0_type + " e " + expr1_type + ".");
         erros_contador++;
         System.exit(0);
      }
      return null;   
   }

   @Override public String visitExpr_real(pdrawParser.Expr_realContext ctx) {
      return "real";
   }


   @Override public String visitExpr_string(pdrawParser.Expr_stringContext ctx) {
      return "string";     // tipo de expr_string
   }

   @Override public String visitExpr_bool_or_xor(pdrawParser.Expr_bool_or_xorContext ctx) {
      String expr_type_0 = visit(ctx.expr(0));
      String expr_type_1 = visit(ctx.expr(1));

      if(!expr_type_0.matches("bool") || !expr_type_1.matches("bool")) {
         System.err.println("Erro: operações booleanas requerem expressões booleanas, e não "+ expr_type_0 + " e " + expr_type_1 + ".");
         erros_contador++;
         System.exit(0);
         return "";
      }
      return "bool";      
   }

   @Override public String visitExpr_conversion(pdrawParser.Expr_conversionContext ctx) {
      // mandar abaixo se o type for bool ou point
      // o type a converter tem que ser compatível com o tipo da expr
      String type = ctx.Type().getText();
      String expr_type = visit(ctx.expr());

      if(type.matches("bool") || type.matches("point")) {
         System.err.println("Erro: Não se pode converter uma expressão para ponto ou bool.");
         erros_contador++;
         System.exit(0);
         return "";
      }
      return type;
   }

   @Override public String visitPoint(pdrawParser.PointContext ctx) {
      String expr_type_0 = visit(ctx.expr(0));
      String expr_type_1 = visit(ctx.expr(1));

      if(!isNumeric(expr_type_1) || !isNumeric(expr_type_0)) {
         System.err.println("Erro: Um ponto deve conter 2 valores numéricos em vez de " + expr_type_0 + " e " + expr_type_1 + ".");
         erros_contador++;
         System.exit(0);
         return "";
      }
      return "point";
   }



   @Override public String visitStat_canvas_select(pdrawParser.Stat_canvas_selectContext ctx) {
      return visitChildren(ctx);
   }

   @Override public String visitStat_function_declaration(pdrawParser.Stat_function_declarationContext ctx) {
      return visitChildren(ctx);
   }

   @Override public String visitStat_if(pdrawParser.Stat_ifContext ctx) {
      return visitChildren(ctx);
   }

   @Override public String visitStat_canvas_color(pdrawParser.Stat_canvas_colorContext ctx) {
      return visitChildren(ctx);
   }

   @Override public String visitCanvas_color(pdrawParser.Canvas_colorContext ctx) {
      String canvas = ctx.Id().getText();

      if(!varTypes.containsKey(canvas)) {
         System.err.println("Erro: não se pode alterar a cor do canvas '" + canvas + "' porque ele não existe.");
         erros_contador++;
         System.exit(0);
      }

      if(!varTypes.get(canvas).matches("canvas")) {
         System.err.println("Erro: a variável '" + canvas + "' não é um canvas.");
         erros_contador++;
         System.exit(0);
      }

      return "";
   }


   @Override public String visitIf(pdrawParser.IfContext ctx) {
      String expr_type = visit(ctx.expr());
      if(!expr_type.matches("bool")) {
         System.err.println("Erro: a condição de um if deve ser do tipo 'bool' e não do tipo '" + expr_type + "'.");
         erros_contador++;
         System.exit(0);
      }
      return visit(ctx.stat());
   }

   @Override public String visitCanvas_select(pdrawParser.Canvas_selectContext ctx) {
      String pen_var = ctx.Id(0).getText();
      String canvas = ctx.Id(1).getText();

      if(!varTypes.containsKey(pen_var)) {
         System.err.println("Erro: a pen '" + pen_var + "' não existe.");
         erros_contador++;
         System.exit(0);
      }
      if(!varTypes.containsKey(canvas)) {
         System.err.println("Erro: o canvas '" + canvas + "' não existe.");
         erros_contador++;
         System.exit(0);
      }

      if(!varTypes.get(pen_var).matches("pen")) {
         System.err.println("Erro: a variável '" + pen_var + "' não é uma pen.");
         erros_contador++;
         System.exit(0);
      }
      if(!varTypes.get(canvas).matches("canvas")) {
         System.err.println("Erro: a variável '" + canvas + "' não é um canvas.");
         erros_contador++;
         System.exit(0);
      }
      return "";
   }

   @Override public String visitFunction_declaration(pdrawParser.Function_declarationContext ctx) {
      // funções reconhecem variáveis do contexto em que se encontram, e esse contexto não reconhece as suas. As variáveis locais aqui declaradas com o mesmo nome que variáveis de contexto anterior, não interferem com o valor das variáveis anteriores
      // 'def' 'function' '(' (Type VarName (',' Type VarName)*)? ')' stat ';';

      String function_name = ctx.Id(0).getText();
      if(varTypes.containsKey(function_name)) {
         System.err.println("Erro: o nome para a função '" + function_name + "' já está a ser usado.");
         erros_contador++;
         System.exit(0);
      }

      varTypes.put(function_name, "function");
      
      // guardar todas as variáveis e os seus valores antes de analisar semanticamente o corpo  
      HashMap<String, String> varTypes_deep_copy = new HashMap<>(varTypes);

      ArrayList<String> var_names = new ArrayList<>();
      ArrayList<String> var_types = new ArrayList<>();

      if(ctx.Id().size() != 1) {
         for(int i = 0; i<ctx.Type().size(); i++) {
            String type = ctx.Type(i).getText();
            String var_name = ctx.Id(i+1).getText();
   
            if(var_names.contains(var_name)) {
               System.err.println("Erro: o parâmetro '" + var_name + "' não pode ser repetido nos parâmetros da função.");
               erros_contador++;
               System.exit(0);
            }
            var_names.add(var_name);
            varTypes.put(var_name, type);
            var_types.add(type);
   
         }
      }

      functions.put(function_name, var_types);
      HashMap<String, ArrayList<String>> functions_deep_copy = new HashMap<>(functions);
      for (Map.Entry<String, ArrayList<String>> entry : functions.entrySet()) {
         String key = entry.getKey();
         ArrayList<String> originalList = entry.getValue();
         ArrayList<String> copiedList = new ArrayList<>(originalList);
         functions_deep_copy.put(key, copiedList);
      }
      
      visit(ctx.stat());

      // repôr todas as variáveis e os seus valores  
      varTypes.clear();
      varTypes.putAll(varTypes_deep_copy);

      functions = functions_deep_copy;

      return "";
   }

   @Override public String visitStat_function(pdrawParser.Stat_functionContext ctx) {
      return visit(ctx.function());
   }

   @Override public String visitFunction(pdrawParser.FunctionContext ctx) {
      // function:       'functionador' VarName '(' (expr (',' expr)*)? ')' ';'?;

      String function_name = ctx.Id().getText();
      if(!varTypes.containsKey(function_name)) {
         System.err.println("Erro: a função '" + function_name + "' não existe.");
         erros_contador++;
         System.exit(0);
      }

      ArrayList<String> params_copy = functions.get(function_name);

      if(ctx.expr().size() != params_copy.size()) {
         System.err.println("Erro: a função requer " + ctx.expr().size() + " parâmetros, e foram dados " + params_copy.size() + ".");
            erros_contador++;
            System.exit(0);
      }

      int i = 0;
      for (String type : params_copy) {
         String expr_type = visit(ctx.expr(i));
         if(!type.matches(expr_type)) {
            System.err.println("Erro: a função requer que o parâmetro indicado seja do tipo '" + type + "', e não do tipo '" + expr_type + "'.");
            erros_contador++;
            System.exit(0);
         }
         i+=1;
      }

      return "";
   }








   private boolean isNumeric(String str) {
      if (str.matches("real") || str.matches("int"))
         return true;
      return false;
   } 
  
}
