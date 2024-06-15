import java.util.HashMap;

@SuppressWarnings("CheckReturnValue")
public class Compiler extends VectorBaseVisitor<VectorClass> {

   HashMap<String, VectorClass> vars = new HashMap<>();

   @Override public VectorClass visitPrint(VectorParser.PrintContext ctx) {
      VectorClass res = visit(ctx.expr());
      if (res != null) {
         System.out.println(res);
      }
      return res;
   }

   @Override public VectorClass visitAssign(VectorParser.AssignContext ctx) {
      
      String variable = ctx.ID().getText();
      
      VectorClass res = visit(ctx.expr());

      if (res != null && variable != null) {
         if (!vars.containsKey(variable))  {
            vars.put(variable, res);
            return res;
         }
      }
      
      return null;
   }

   @Override public VectorClass visitExprVector(VectorParser.ExprVectorContext ctx) {
      
      String vector = ctx.getText();
      VectorClass res = new VectorClass(vector);
      return res;
   }

   @Override public VectorClass visitExprAddSub(VectorParser.ExprAddSubContext ctx) {
      
      String op = ctx.op.getText();
      VectorClass v1 = visit(ctx.expr(0));
      VectorClass v2 = visit(ctx.expr(1));
      VectorClass res = null;

      if(op != null && v1 != null && v2 != null) {
         
         if (!v1.isVector() && !v2.isVector()) {
            switch (op) {
            case "+":
               Double x = v1.getX()+v2.getX();
               Double y = v1.getY()+v2.getY();
               res = new VectorClass(x, y);
               break;
            case "-":
               Double x1 = v1.getX()-v2.getX();
               Double y1 = v1.getY()-v2.getY();
               res = new VectorClass(x1, y1);
               break;
            }
         }
         else {
            switch (op) {
            case "+":
               Double x = v1.getX()+v2.getX();
               res = new VectorClass(x);
               break;
            case "-":
               Double x1 = v1.getX()-v2.getX();
               res = new VectorClass(x1);
               break;
            }
         }
      }

      return res;
   }

   @Override public VectorClass visitExprMult(VectorParser.ExprMultContext ctx) {
      VectorClass v1 = visit(ctx.expr(0));
      VectorClass v2 = visit(ctx.expr(1));
      VectorClass res = null;

      if(v1 != null && v2 != null) {
         
         if (v1.isVector() && !v2.isVector()) {
            Double x = v1.getX()*v2.getX();
            Double y = v1.getX()*v2.getY();
            res = new VectorClass(x, y);
         }
         else if (!v1.isVector() && v2.isVector()) {
            Double x = v1.getX()*v2.getX();
            Double y = v1.getY()*v2.getX();
            res = new VectorClass(x, y);
         }
         else if (v1.isVector() && v2.isVector()) {
            Double x = v1.getX()*v2.getX();
            res = new VectorClass(x);
         }
      }
      return res;
   }

   @Override public VectorClass visitExprParent(VectorParser.ExprParentContext ctx) {
      VectorClass res = visit(ctx.expr());
      return res;
   }

   @Override public VectorClass visitExprUnary(VectorParser.ExprUnaryContext ctx) {
      String op = ctx.op.getText();
      VectorClass res = visit(ctx.expr());
      
      if (res != null) {
         if (op.equals("-")) {
            res = res.negativeScalar();
         }
      }

      return res;
   }

   @Override public VectorClass visitExprReal(VectorParser.ExprRealContext ctx) {
      VectorClass res = new VectorClass(Double.parseDouble(ctx.getText()));
      return res;
   }

   @Override public VectorClass visitExprInternalProduct(VectorParser.ExprInternalProductContext ctx) {
      VectorClass v1 = visit(ctx.expr(0));
      VectorClass v2 = visit(ctx.expr(1));
      VectorClass res = null;

      res = new VectorClass(v1.getX()*v2.getX()+v1.getY()*v2.getY());
      return res;
   }

   @Override public VectorClass visitExprID(VectorParser.ExprIDContext ctx) {
      
      String variable = ctx.getText();

      if (variable != null) {
         if (!vars.containsKey(variable)) {
            System.err.println("Variable " + variable + " has not been initialized!");
            return null;
         }
      }
      return vars.get(variable);
   }
}
