import java.util.HashMap;
import java.util.Scanner;

@SuppressWarnings("CheckReturnValue")
public class Compiler extends CalcComplexBaseVisitor<ComplexNumber> {

   HashMap<String, ComplexNumber> vars = new HashMap<>();
   Scanner sc = new Scanner(System.in);
   
   // @Override public ComplexNumber visitProgram(CalcComplexParser.ProgramContext ctx) {
   //    ComplexNumber res = null;
   //    return visitChildren(ctx);
   //    //return res;
   // }

   // @Override public ComplexNumber visitCommand(CalcComplexParser.CommandContext ctx) {
   //    ComplexNumber res = null;
   //    return visitChildren(ctx);
   //    //return res;
   // }

   @Override public ComplexNumber visitDisplay(CalcComplexParser.DisplayContext ctx) {
      ComplexNumber res = visit(ctx.expr());
      if (res !=  null) {
         System.out.println(res);
      }
      return res;
   }

   @Override public ComplexNumber visitAssign(CalcComplexParser.AssignContext ctx) {
      ComplexNumber res = visit(ctx.expr());
      String variable = ctx.ID().getText();

      if (res != null && variable != null) {
         if (!vars.containsKey(variable)) {
            vars.put(variable, res);
            return res;
         }
      }

      return null;
   }

   @Override public ComplexNumber visitExprAddSub(CalcComplexParser.ExprAddSubContext ctx) {
      ComplexNumber complex1 = visit(ctx.expr(0));
      ComplexNumber complex2 = visit(ctx.expr(1));
      String op = ctx.op.getText();
      ComplexNumber res = null;

      if (complex1 != null && complex2 != null && op != null) {
         switch (op) {
            case "+":
               res = new ComplexNumber(complex1.getReal() + complex2.getReal(), complex1.getIma() + complex2.getIma());
               break;

            case "-":
               res = new ComplexNumber(complex1.getReal() - complex2.getReal(), complex1.getIma() - complex2.getIma());
               break;
         }
         return res;
      }
      return null;
   }

   @Override public ComplexNumber visitExprParent(CalcComplexParser.ExprParentContext ctx) {
      return visit(ctx.expr());
      //return res;
   }

   @Override public ComplexNumber visitExprUnary(CalcComplexParser.ExprUnaryContext ctx) {
      ComplexNumber res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public ComplexNumber visitExprNumber(CalcComplexParser.ExprNumberContext ctx) {
      ComplexNumber res = new ComplexNumber(ctx.getText());
      return res;
   }

   @Override public ComplexNumber visitExprMultDiv(CalcComplexParser.ExprMultDivContext ctx) {
      ComplexNumber complex1 = visit(ctx.expr(0));
      ComplexNumber complex2 = visit(ctx.expr(1));
      String op = ctx.op.getText();
      ComplexNumber res = null;

      if (complex1 != null && complex2 != null && op != null) {
         switch (op) {
            case "*":
               res = new ComplexNumber(complex1.getReal() * complex2.getReal() - complex1.getIma() * complex2.getIma() , complex1.getReal() * complex2.getIma() + complex1.getIma() * complex2.getReal());
               break;

            case ":":
               
               Integer r1 = complex1.getReal() * complex2.getReal() + complex1.getIma() * complex2.getIma();
               Integer r2 = (int) (Math.pow(complex2.getReal(),2)+Math.pow(complex2.getIma(),2));
               Integer r = r1/r2;
               Integer d1 = complex1.getIma() * complex2.getReal() - complex1.getReal() * complex2.getIma();
               Integer d2 = (int) (Math.pow(complex2.getReal(),2)+Math.pow(complex2.getIma(),2));
               Integer d = d1/d2;
         
               res = new ComplexNumber(r,d);
               break;
         }
         return res;
      }
      return null;
   }

   @Override public ComplexNumber visitExprInput(CalcComplexParser.ExprInputContext ctx) {
      
      String variable = ctx.STRING().getText().substring(1, ctx.STRING().getText().length()-1);
      System.out.print(variable + "(re): ");
      Integer real = sc.nextInt();
      System.out.print(variable + "(im): ");
      Integer ima = sc.nextInt();
      
      ComplexNumber res = new ComplexNumber(real, ima);
      return res;
   }

   @Override public ComplexNumber visitExprComplex(CalcComplexParser.ExprComplexContext ctx) {
      ComplexNumber res = new ComplexNumber(ctx.getText());
      return res;
   }

   @Override public ComplexNumber visitExprID(CalcComplexParser.ExprIDContext ctx) {
      String variable = ctx.getText();

      if (variable != null) {
         if (!vars.containsKey(variable)) {
            System.err.println("Variable " + variable + " has not been initialized!");
         }
         else {
            return vars.get(variable);
         }
      }
      return null;
   }
}