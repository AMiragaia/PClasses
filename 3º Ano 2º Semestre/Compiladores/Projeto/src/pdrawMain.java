import java.io.IOException;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import org.stringtemplate.v4.*;

import java.io.BufferedWriter;
import java.io.FileWriter;

public class pdrawMain {
   public static void main(String[] args) {
      try {
         // create a CharStream that reads from standard input:
         CharStream input = CharStreams.fromStream(System.in);
         // create a lexer that feeds off of input CharStream:
         pdrawLexer lexer = new pdrawLexer(input);
         // create a buffer of tokens pulled from the lexer:
         CommonTokenStream tokens = new CommonTokenStream(lexer);
         // create a parser that feeds off the tokens buffer:
         pdrawParser parser = new pdrawParser(tokens);
         // replace error listener:
         //parser.removeErrorListeners(); // remove ConsoleErrorListener
         //parser.addErrorListener(new ErrorHandlingListener());
         // begin parsing at program rule:
         ParseTree tree = parser.program();
         if (parser.getNumberOfSyntaxErrors() == 0) {
            // print LISP-style tree:
            // System.out.println(tree.toStringTree(parser));
            SemanticVisitor visitor = new SemanticVisitor();
            visitor.visit(tree);
            //System.out.println(visitor.erros_contador);
            if(visitor.erros_contador > 0) {
               System.out.println("Houveram erros semânticos: terminar programa.");
               System.exit(0);
            }


            Dor visitor0 = new Dor();
            ST Dor = visitor0.visit(tree);
            //System.out.println(Dor.render());

            String filename = "pdraw_program.py";
            programador(filename, Dor.render());
         }
      }
      catch(IOException e) {
         e.printStackTrace();
         System.exit(1);
      }
      catch(RecognitionException e) {
         e.printStackTrace();
         System.exit(1);
      }
   }

   public static void programador(String filename, String output) {
      try {
          FileWriter fileWriter = new FileWriter(filename, false);
          BufferedWriter bufferedWriter = new BufferedWriter(fileWriter);
          
          bufferedWriter.write(output);
          bufferedWriter.newLine();
          bufferedWriter.close();
      } catch (IOException e) {
          e.printStackTrace();
      }
  }
}
