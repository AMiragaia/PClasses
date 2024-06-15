// Generated from CalcComplex.g4 by ANTLR 4.12.0
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link CalcComplexParser}.
 */
public interface CalcComplexListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link CalcComplexParser#program}.
	 * @param ctx the parse tree
	 */
	void enterProgram(CalcComplexParser.ProgramContext ctx);
	/**
	 * Exit a parse tree produced by {@link CalcComplexParser#program}.
	 * @param ctx the parse tree
	 */
	void exitProgram(CalcComplexParser.ProgramContext ctx);
	/**
	 * Enter a parse tree produced by {@link CalcComplexParser#command}.
	 * @param ctx the parse tree
	 */
	void enterCommand(CalcComplexParser.CommandContext ctx);
	/**
	 * Exit a parse tree produced by {@link CalcComplexParser#command}.
	 * @param ctx the parse tree
	 */
	void exitCommand(CalcComplexParser.CommandContext ctx);
	/**
	 * Enter a parse tree produced by {@link CalcComplexParser#display}.
	 * @param ctx the parse tree
	 */
	void enterDisplay(CalcComplexParser.DisplayContext ctx);
	/**
	 * Exit a parse tree produced by {@link CalcComplexParser#display}.
	 * @param ctx the parse tree
	 */
	void exitDisplay(CalcComplexParser.DisplayContext ctx);
	/**
	 * Enter a parse tree produced by {@link CalcComplexParser#assign}.
	 * @param ctx the parse tree
	 */
	void enterAssign(CalcComplexParser.AssignContext ctx);
	/**
	 * Exit a parse tree produced by {@link CalcComplexParser#assign}.
	 * @param ctx the parse tree
	 */
	void exitAssign(CalcComplexParser.AssignContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprAddSub}
	 * labeled alternative in {@link CalcComplexParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprAddSub(CalcComplexParser.ExprAddSubContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprAddSub}
	 * labeled alternative in {@link CalcComplexParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprAddSub(CalcComplexParser.ExprAddSubContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprParent}
	 * labeled alternative in {@link CalcComplexParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprParent(CalcComplexParser.ExprParentContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprParent}
	 * labeled alternative in {@link CalcComplexParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprParent(CalcComplexParser.ExprParentContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprUnary}
	 * labeled alternative in {@link CalcComplexParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprUnary(CalcComplexParser.ExprUnaryContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprUnary}
	 * labeled alternative in {@link CalcComplexParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprUnary(CalcComplexParser.ExprUnaryContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprNumber}
	 * labeled alternative in {@link CalcComplexParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprNumber(CalcComplexParser.ExprNumberContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprNumber}
	 * labeled alternative in {@link CalcComplexParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprNumber(CalcComplexParser.ExprNumberContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprMultDiv}
	 * labeled alternative in {@link CalcComplexParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprMultDiv(CalcComplexParser.ExprMultDivContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprMultDiv}
	 * labeled alternative in {@link CalcComplexParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprMultDiv(CalcComplexParser.ExprMultDivContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprInput}
	 * labeled alternative in {@link CalcComplexParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprInput(CalcComplexParser.ExprInputContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprInput}
	 * labeled alternative in {@link CalcComplexParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprInput(CalcComplexParser.ExprInputContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprComplex}
	 * labeled alternative in {@link CalcComplexParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprComplex(CalcComplexParser.ExprComplexContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprComplex}
	 * labeled alternative in {@link CalcComplexParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprComplex(CalcComplexParser.ExprComplexContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprID}
	 * labeled alternative in {@link CalcComplexParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprID(CalcComplexParser.ExprIDContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprID}
	 * labeled alternative in {@link CalcComplexParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprID(CalcComplexParser.ExprIDContext ctx);
}