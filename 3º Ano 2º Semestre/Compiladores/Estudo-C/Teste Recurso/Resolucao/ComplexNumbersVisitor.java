// Generated from ComplexNumbers.g4 by ANTLR 4.12.0
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link ComplexNumbersParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface ComplexNumbersVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link ComplexNumbersParser#program}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitProgram(ComplexNumbersParser.ProgramContext ctx);
	/**
	 * Visit a parse tree produced by {@link ComplexNumbersParser#command}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCommand(ComplexNumbersParser.CommandContext ctx);
	/**
	 * Visit a parse tree produced by {@link ComplexNumbersParser#display}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDisplay(ComplexNumbersParser.DisplayContext ctx);
	/**
	 * Visit a parse tree produced by {@link ComplexNumbersParser#assignment}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAssignment(ComplexNumbersParser.AssignmentContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ExprSumSub}
	 * labeled alternative in {@link ComplexNumbersParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprSumSub(ComplexNumbersParser.ExprSumSubContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ExprParent}
	 * labeled alternative in {@link ComplexNumbersParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprParent(ComplexNumbersParser.ExprParentContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ExprUnary}
	 * labeled alternative in {@link ComplexNumbersParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprUnary(ComplexNumbersParser.ExprUnaryContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ExprMultDiv}
	 * labeled alternative in {@link ComplexNumbersParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprMultDiv(ComplexNumbersParser.ExprMultDivContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ExprReal}
	 * labeled alternative in {@link ComplexNumbersParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprReal(ComplexNumbersParser.ExprRealContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ExprComplex}
	 * labeled alternative in {@link ComplexNumbersParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprComplex(ComplexNumbersParser.ExprComplexContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ExprID}
	 * labeled alternative in {@link ComplexNumbersParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprID(ComplexNumbersParser.ExprIDContext ctx);
}