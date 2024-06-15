import java.math.BigInteger;
import java.util.HashMap;

@SuppressWarnings("CheckReturnValue")
public class Compiler extends BigIntCalBaseVisitor<BigInteger> {

   HashMap<String, BigInteger> vars = new HashMap<>();

   @Override public BigInteger visitProgram(BigIntCalParser.ProgramContext ctx) {
      BigInteger res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public BigInteger visitCommand(BigIntCalParser.CommandContext ctx) {
      BigInteger res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public BigInteger visitShow(BigIntCalParser.ShowContext ctx) {
      
      BigInteger res = visit(ctx.expr());
      if (res != null) {
         System.out.println(res);
      }
      return res;
   }

   @Override public BigInteger visitAssign(BigIntCalParser.AssignContext ctx) {
      String variable = ctx.ID().getText();
      BigInteger res = visit(ctx.expr());
      
      if (variable != null && res != null) {
         if (!vars.containsKey(variable)) {
            vars.put(variable, res);
         }
         return res;
      }
      return null;
      
   }

   @Override public BigInteger visitExprAddSub(BigIntCalParser.ExprAddSubContext ctx) {
      BigInteger res = null;
      BigInteger n1 = visit(ctx.expr(0));
      BigInteger n2 = visit(ctx.expr(1));

      if (n1 != null && n2 != null) {
         switch (ctx.op.getText()) {
            case "+":
               res = n1.add(n2);
               break;
            case "-":
               res = n1.subtract(n2);
               break;
         }
      }
      return res;
   }

   @Override public BigInteger visitExprParent(BigIntCalParser.ExprParentContext ctx) {
      return visit(ctx.expr());
   }

   @Override public BigInteger visitExprNumber(BigIntCalParser.ExprNumberContext ctx) {
      BigInteger res = new BigInteger(ctx.getText());
      return res;
   }

   @Override public BigInteger visitExprMultDiv(BigIntCalParser.ExprMultDivContext ctx) {
      BigInteger res = null;
      BigInteger n1 = visit(ctx.expr(0));
      BigInteger n2 = visit(ctx.expr(1));

      if (n1 != null && n2 != null) {
         switch (ctx.op.getText()) {
            case "*":
               res = n1.multiply(n2);
               break;
            case "div":
               res = n1.divide(n2);
               break;
         }
      }
      return res;
   }

   @Override public BigInteger visitExprID(BigIntCalParser.ExprIDContext ctx) {
      String variable = ctx.ID().getText();

      if (variable != null) {
         if (!vars.containsKey(variable)) {
            System.err.println("Variable " + variable + " has not been initialized!");
            return null;
         }
         else {
            return vars.get(variable);
         }
      }
      return null;
   }

   @Override public BigInteger visitExprMod(BigIntCalParser.ExprModContext ctx) {
      BigInteger res = null;
      BigInteger n1 = visit(ctx.expr(0));
      BigInteger n2 = visit(ctx.expr(1));

      if (n1 != null && n2 != null) {
         res = n1.mod(n2);
      }
      return res;
   }
}
