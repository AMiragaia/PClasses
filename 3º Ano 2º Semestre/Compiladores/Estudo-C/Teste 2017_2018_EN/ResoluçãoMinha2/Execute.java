import java.util.HashMap;
import java.util.Scanner;

@SuppressWarnings("CheckReturnValue")
public class Execute extends ComplexNumberBaseVisitor<Complex> {

   HashMap<String, Complex> vars = new HashMap<>();
   Scanner sc = new Scanner(System.in);

   @Override public Complex visitProgram(ComplexNumberParser.ProgramContext ctx) {
      Complex res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public Complex visitCommand(ComplexNumberParser.CommandContext ctx) {
      Complex res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public Complex visitPrint(ComplexNumberParser.PrintContext ctx) {
      Complex res = visit(ctx.expr());
      if (res != null) {
         System.out.println(res);
      }
      return res;
   }

   @Override public Complex visitAssign(ComplexNumberParser.AssignContext ctx) {
      String var = ctx.ID().getText();
      Complex res = visit(ctx.expr());

      if (var != null && res != null) {
         if (!vars.containsKey(var)) {
            vars.put(var, res);
         }
         return res;
      }
      return null; 
   }

   @Override public Complex visitExprAddSub(ComplexNumberParser.ExprAddSubContext ctx) {
      
      String op = ctx.op.getText();
      Complex c1 = visit(ctx.expr(0));
      Complex c2 = visit(ctx.expr(1));
      Complex res = null;
      
      switch(op) {
         case "+":
            res = c1.add(c2);
            break;
         case "-":
            res = c1.sub(c2);
            break;
      }

      return res;
   }

   @Override public Complex visitExprParent(ComplexNumberParser.ExprParentContext ctx) {
      return visit(ctx.expr());
   }

   @Override public Complex visitExprUnary(ComplexNumberParser.ExprUnaryContext ctx) {
      Complex res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public Complex visitExprNumber(ComplexNumberParser.ExprNumberContext ctx) {
      Complex res = new Complex(ctx.NUMBER().getText());
      return res;
   }

   @Override public Complex visitExprMultDiv(ComplexNumberParser.ExprMultDivContext ctx) {
      String op = ctx.op.getText();
      Complex c1 = visit(ctx.expr(0));
      Complex c2 = visit(ctx.expr(1));
      Complex res = null;
      
      switch(op) {
         case "*":
            res = c1.mult(c2);
            break;
         case ":":
            res = c1.div(c2);
            break;
      }

      return res;
   }

   @Override public Complex visitExprInput(ComplexNumberParser.ExprInputContext ctx) {
      String var = ctx.STRING().getText().substring(1, ctx.STRING().getText().length()-1);
      System.out.print(var+"(re): ");
      Integer real = sc.nextInt();
      System.out.print(var+"(im): ");
      Integer im = sc.nextInt();
      
      Complex res = new Complex(real, im);
      return res;
   }

   @Override public Complex visitExprComplex(ComplexNumberParser.ExprComplexContext ctx) {
      String complex = ctx.COMPLEX().getText();
      Complex res = new Complex(complex);
      return res;
   }

   @Override public Complex visitExprID(ComplexNumberParser.ExprIDContext ctx) {
      String var = ctx.ID().getText();
      
      if (var != null) {
         if (!vars.containsKey(var)) {
            System.err.println("Variable " + var + " has not been initilized!");
            return null;
         }
         return vars.get(var);  
      }
      return null;
   }
}
