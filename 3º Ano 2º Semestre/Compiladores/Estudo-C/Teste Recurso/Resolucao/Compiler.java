@SuppressWarnings("CheckReturnValue")
public class Compiler extends ComplexNumbersBaseVisitor<Complex> {

   @Override public Complex visitProgram(ComplexNumbersParser.ProgramContext ctx) {
      Complex res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public Complex visitCommand(ComplexNumbersParser.CommandContext ctx) {
      Complex res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public Complex visitDisplay(ComplexNumbersParser.DisplayContext ctx) {
      Complex res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public Complex visitAssignment(ComplexNumbersParser.AssignmentContext ctx) {
      Complex res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public Complex visitExprSumSub(ComplexNumbersParser.ExprSumSubContext ctx) {
      Complex res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public Complex visitExprParent(ComplexNumbersParser.ExprParentContext ctx) {
      Complex res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public Complex visitExprUnary(ComplexNumbersParser.ExprUnaryContext ctx) {
      Complex res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public Complex visitExprMultDiv(ComplexNumbersParser.ExprMultDivContext ctx) {
      Complex res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public Complex visitExprReal(ComplexNumbersParser.ExprRealContext ctx) {
      Complex res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public Complex visitExprComplex(ComplexNumbersParser.ExprComplexContext ctx) {
      Complex res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public Complex visitExprID(ComplexNumbersParser.ExprIDContext ctx) {
      Complex res = null;
      return visitChildren(ctx);
      //return res;
   }
}
