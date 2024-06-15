// Generated from ComplexNumbers.g4 by ANTLR 4.12.0
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link ComplexNumbersParser}.
 */
public interface ComplexNumbersListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link ComplexNumbersParser#program}.
	 * @param ctx the parse tree
	 */
	void enterProgram(ComplexNumbersParser.ProgramContext ctx);
	/**
	 * Exit a parse tree produced by {@link ComplexNumbersParser#program}.
	 * @param ctx the parse tree
	 */
	void exitProgram(ComplexNumbersParser.ProgramContext ctx);
	/**
	 * Enter a parse tree produced by {@link ComplexNumbersParser#command}.
	 * @param ctx the parse tree
	 */
	void enterCommand(ComplexNumbersParser.CommandContext ctx);
	/**
	 * Exit a parse tree produced by {@link ComplexNumbersParser#command}.
	 * @param ctx the parse tree
	 */
	void exitCommand(ComplexNumbersParser.CommandContext ctx);
	/**
	 * Enter a parse tree produced by {@link ComplexNumbersParser#display}.
	 * @param ctx the parse tree
	 */
	void enterDisplay(ComplexNumbersParser.DisplayContext ctx);
	/**
	 * Exit a parse tree produced by {@link ComplexNumbersParser#display}.
	 * @param ctx the parse tree
	 */
	void exitDisplay(ComplexNumbersParser.DisplayContext ctx);
	/**
	 * Enter a parse tree produced by {@link ComplexNumbersParser#assignment}.
	 * @param ctx the parse tree
	 */
	void enterAssignment(ComplexNumbersParser.AssignmentContext ctx);
	/**
	 * Exit a parse tree produced by {@link ComplexNumbersParser#assignment}.
	 * @param ctx the parse tree
	 */
	void exitAssignment(ComplexNumbersParser.AssignmentContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprSumSub}
	 * labeled alternative in {@link ComplexNumbersParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprSumSub(ComplexNumbersParser.ExprSumSubContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprSumSub}
	 * labeled alternative in {@link ComplexNumbersParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprSumSub(ComplexNumbersParser.ExprSumSubContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprParent}
	 * labeled alternative in {@link ComplexNumbersParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprParent(ComplexNumbersParser.ExprParentContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprParent}
	 * labeled alternative in {@link ComplexNumbersParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprParent(ComplexNumbersParser.ExprParentContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprUnary}
	 * labeled alternative in {@link ComplexNumbersParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprUnary(ComplexNumbersParser.ExprUnaryContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprUnary}
	 * labeled alternative in {@link ComplexNumbersParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprUnary(ComplexNumbersParser.ExprUnaryContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprMultDiv}
	 * labeled alternative in {@link ComplexNumbersParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprMultDiv(ComplexNumbersParser.ExprMultDivContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprMultDiv}
	 * labeled alternative in {@link ComplexNumbersParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprMultDiv(ComplexNumbersParser.ExprMultDivContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprReal}
	 * labeled alternative in {@link ComplexNumbersParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprReal(ComplexNumbersParser.ExprRealContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprReal}
	 * labeled alternative in {@link ComplexNumbersParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprReal(ComplexNumbersParser.ExprRealContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprComplex}
	 * labeled alternative in {@link ComplexNumbersParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprComplex(ComplexNumbersParser.ExprComplexContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprComplex}
	 * labeled alternative in {@link ComplexNumbersParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprComplex(ComplexNumbersParser.ExprComplexContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprID}
	 * labeled alternative in {@link ComplexNumbersParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprID(ComplexNumbersParser.ExprIDContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprID}
	 * labeled alternative in {@link ComplexNumbersParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprID(ComplexNumbersParser.ExprIDContext ctx);
}