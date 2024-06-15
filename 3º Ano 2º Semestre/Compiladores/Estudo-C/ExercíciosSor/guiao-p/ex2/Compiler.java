import java.util.HashMap;
import java.util.Scanner;

@SuppressWarnings("CheckReturnValue")
public class Compiler extends FracLangBaseVisitor<Fraction> {

   HashMap<String, Fraction> vars = new HashMap<>();
   Scanner sc = new Scanner(System.in);

   @Override public Fraction visitAssignment(FracLangParser.AssignmentContext ctx) {
      Fraction res = visit(ctx.expr());
      String variable = ctx.ID().getText();

      if (variable != null && res != null) {
         if (!vars.containsKey(variable)) {
            vars.put(variable, res);
         }
      }
      
      return res;
   }

   @Override public Fraction visitDisplay(FracLangParser.DisplayContext ctx) {
      Fraction res = visit(ctx.expr());

      if (res != null) {
         System.out.println(res);
      }
      return res;
   }

   @Override public Fraction visitExprFrac(FracLangParser.ExprFracContext ctx) {
     
      String[] fraction = ctx.FRAC().getText().split("/");

      if (fraction.length != 1) {
         int num = Integer.valueOf(fraction[0]);
         int den = Integer.valueOf(fraction[1]);
         return new Fraction(num,den);
      }
      else {
         int num = Integer.valueOf(fraction[0]);
         return new Fraction(num);
      }
   }

   @Override public Fraction visitExprAddSub(FracLangParser.ExprAddSubContext ctx) {
      Fraction res = null;
      
      Fraction f1 = visit(ctx.expr(0));
      Fraction f2 = visit(ctx.expr(1));

      if (f1 != null && f2 != null) {
         switch(ctx.op.getText()) {
            case "+":
               res = new Fraction(f1.getNum()*f2.getDen() + f2.getNum()*f1.getDen(), f1.getDen()*f2.getDen());
               break;

            case "-":
               res = new Fraction(f1.getNum()*f2.getDen() - f2.getNum()*f1.getDen(), f1.getDen()*f2.getDen());
               break;
            }
      }

      return res;
   }

   @Override public Fraction visitExprParent(FracLangParser.ExprParentContext ctx) {
      Fraction res = visit(ctx.expr());
      return res;
   }

   @Override public Fraction visitExprMultDiv(FracLangParser.ExprMultDivContext ctx) {
      Fraction res = null;
      
      Fraction f1 = visit(ctx.expr(0));
      Fraction f2 = visit(ctx.expr(1));

      if (f1 != null && f2 != null) {
         switch(ctx.op.getText()) {
            case "*":
               res = new Fraction(f1.getNum()*f2.getNum(), f2.getDen()*f1.getDen());
               break;

            case ":":
               res = new Fraction(f1.getNum()*f2.getDen(), f2.getNum()*f1.getDen());
               break;
            }
      }

      return res;
   }

   @Override public Fraction visitExprInput(FracLangParser.ExprInputContext ctx) {
      Fraction res = null;
      System.out.print(ctx.STRING().getText().substring(1, ctx.STRING().getText().length()-1) + ": ");
      String frac = sc.nextLine();

      String[] frac2 = frac.split("/");

      switch (frac2.length) {
         case 1:
            res = new Fraction(Integer.valueOf(frac));
            break;
         case 2:
            res = new Fraction(Integer.valueOf(frac2[0]), Integer.valueOf(frac2[1]));
            break;
      }

      return res;
   }

   @Override public Fraction visitExprReduce(FracLangParser.ExprReduceContext ctx) {
      Fraction res = visit(ctx.expr());
      if (res != null) {
         res = res.reduce();
      }
      return res;
   }

   @Override public Fraction visitExprID(FracLangParser.ExprIDContext ctx) {
      

      Fraction res = null;

      String variable = ctx.getText();

      if(!vars.containsKey(variable)) {
         System.out.println("Variable " + variable + " is not defined!");
      }
      else {
         res = vars.get(variable);
      }
      return res;
   }

   @Override public Fraction visitExprPosNeg(FracLangParser.ExprPosNegContext ctx) {
      Fraction res = visit(ctx.expr());

      if (res != null) {
         if (ctx.op.getText().equals("-")) {
            res = new Fraction(-res.getNum(), res.getDen());
         }
      }
      return res;
   }
}
