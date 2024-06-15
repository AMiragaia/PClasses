// Generated from ComplexNumber.g4 by ANTLR 4.12.0
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link ComplexNumberParser}.
 */
public interface ComplexNumberListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link ComplexNumberParser#program}.
	 * @param ctx the parse tree
	 */
	void enterProgram(ComplexNumberParser.ProgramContext ctx);
	/**
	 * Exit a parse tree produced by {@link ComplexNumberParser#program}.
	 * @param ctx the parse tree
	 */
	void exitProgram(ComplexNumberParser.ProgramContext ctx);
	/**
	 * Enter a parse tree produced by {@link ComplexNumberParser#command}.
	 * @param ctx the parse tree
	 */
	void enterCommand(ComplexNumberParser.CommandContext ctx);
	/**
	 * Exit a parse tree produced by {@link ComplexNumberParser#command}.
	 * @param ctx the parse tree
	 */
	void exitCommand(ComplexNumberParser.CommandContext ctx);
	/**
	 * Enter a parse tree produced by {@link ComplexNumberParser#print}.
	 * @param ctx the parse tree
	 */
	void enterPrint(ComplexNumberParser.PrintContext ctx);
	/**
	 * Exit a parse tree produced by {@link ComplexNumberParser#print}.
	 * @param ctx the parse tree
	 */
	void exitPrint(ComplexNumberParser.PrintContext ctx);
	/**
	 * Enter a parse tree produced by {@link ComplexNumberParser#assign}.
	 * @param ctx the parse tree
	 */
	void enterAssign(ComplexNumberParser.AssignContext ctx);
	/**
	 * Exit a parse tree produced by {@link ComplexNumberParser#assign}.
	 * @param ctx the parse tree
	 */
	void exitAssign(ComplexNumberParser.AssignContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprAddSub}
	 * labeled alternative in {@link ComplexNumberParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprAddSub(ComplexNumberParser.ExprAddSubContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprAddSub}
	 * labeled alternative in {@link ComplexNumberParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprAddSub(ComplexNumberParser.ExprAddSubContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprParent}
	 * labeled alternative in {@link ComplexNumberParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprParent(ComplexNumberParser.ExprParentContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprParent}
	 * labeled alternative in {@link ComplexNumberParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprParent(ComplexNumberParser.ExprParentContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprUnary}
	 * labeled alternative in {@link ComplexNumberParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprUnary(ComplexNumberParser.ExprUnaryContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprUnary}
	 * labeled alternative in {@link ComplexNumberParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprUnary(ComplexNumberParser.ExprUnaryContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprNumber}
	 * labeled alternative in {@link ComplexNumberParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprNumber(ComplexNumberParser.ExprNumberContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprNumber}
	 * labeled alternative in {@link ComplexNumberParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprNumber(ComplexNumberParser.ExprNumberContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprMultDiv}
	 * labeled alternative in {@link ComplexNumberParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprMultDiv(ComplexNumberParser.ExprMultDivContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprMultDiv}
	 * labeled alternative in {@link ComplexNumberParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprMultDiv(ComplexNumberParser.ExprMultDivContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprInput}
	 * labeled alternative in {@link ComplexNumberParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprInput(ComplexNumberParser.ExprInputContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprInput}
	 * labeled alternative in {@link ComplexNumberParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprInput(ComplexNumberParser.ExprInputContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprComplex}
	 * labeled alternative in {@link ComplexNumberParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprComplex(ComplexNumberParser.ExprComplexContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprComplex}
	 * labeled alternative in {@link ComplexNumberParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprComplex(ComplexNumberParser.ExprComplexContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprID}
	 * labeled alternative in {@link ComplexNumberParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprID(ComplexNumberParser.ExprIDContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprID}
	 * labeled alternative in {@link ComplexNumberParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprID(ComplexNumberParser.ExprIDContext ctx);
}