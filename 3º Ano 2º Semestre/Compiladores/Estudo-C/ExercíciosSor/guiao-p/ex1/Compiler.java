import java.util.HashMap;
import java.util.Scanner;

@SuppressWarnings("CheckReturnValue")
public class Compiler extends StrLangBaseVisitor<String> {

   HashMap<String,String> vars = new HashMap<String, String>();
   Scanner sc = new Scanner(System.in);

   @Override public String visitProgram(StrLangParser.ProgramContext ctx) {
      String res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public String visitPrintCommand(StrLangParser.PrintCommandContext ctx) {
      System.out.println(visit(ctx.display()));
      return "";
      //return res;
   }

   @Override public String visitAssignCommand(StrLangParser.AssignCommandContext ctx) {
      
      return visit(ctx.assign());
      //return res;
   }

   @Override public String visitAssign(StrLangParser.AssignContext ctx) {
      String variavel1 = ctx.getText().split(":")[0];
      String variavel = visit(ctx.expr(0));
      String value = visit(ctx.expr(1));

      if (value != null) {
         if (!vars.containsKey(variavel1)) {
            vars.put(variavel1,value);
         }
         else {
            vars.put(variavel1, value);
         }
      }
      return "";
   }

   @Override public String visitDisplay(StrLangParser.DisplayContext ctx) {
      String res = visit(ctx.expr());
      if (res != null) {
         return res;
      }
      return "";
      //return res;
   }

   @Override public String visitExprRemove(StrLangParser.ExprRemoveContext ctx) {
      String res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public String visitExprReplace(StrLangParser.ExprReplaceContext ctx) {
      String value1 = visit(ctx.expr(0));
      String value2 = visit(ctx.expr(1));
      String value3 = visit(ctx.expr(2));

      if (value1 != null && value2 != null && value3 != null) {
         return value1.replace(value2, value3);
      }
      return "";
   }

   @Override public String visitExprConcact(StrLangParser.ExprConcactContext ctx) {
      String value1 = visit(ctx.expr(0));
      String value2 = visit(ctx.expr(1));
      String concact = "";

      if (value1 != null && value2 != null) {
         concact = value1 + value2;
      }

      return concact;
      //return res;
   }

   @Override public String visitExprString(StrLangParser.ExprStringContext ctx) {
      String res = ctx.getText();
      return res.substring(1, res.length()-1);
   }

   @Override public String visitExprParent(StrLangParser.ExprParentContext ctx) {
      
      return visit(ctx.expr());
      //return res;
   }

   @Override public String visitExprInput(StrLangParser.ExprInputContext ctx) {
      //System.out.println(ctx.expr());
      System.out.print(visit(ctx.expr()));
      String value = sc.nextLine();
      return value;
      //return res;
   }

   @Override public String visitExprRemoveWS(StrLangParser.ExprRemoveWSContext ctx) {
      String res = visit(ctx.expr());
      if (res != null) {
         return res.trim();
      }
      return "";
   }

   @Override public String visitExprID(StrLangParser.ExprIDContext ctx) {
      String value = ctx.getText();

      if (!vars.containsKey(value)) {
         return "Variable '" + value + "' nao exite";
      }
      else {
         return vars.get(value);
      }
   }
}
