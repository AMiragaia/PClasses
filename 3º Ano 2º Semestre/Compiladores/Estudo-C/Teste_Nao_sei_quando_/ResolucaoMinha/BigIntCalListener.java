// Generated from BigIntCal.g4 by ANTLR 4.12.0
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link BigIntCalParser}.
 */
public interface BigIntCalListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link BigIntCalParser#program}.
	 * @param ctx the parse tree
	 */
	void enterProgram(BigIntCalParser.ProgramContext ctx);
	/**
	 * Exit a parse tree produced by {@link BigIntCalParser#program}.
	 * @param ctx the parse tree
	 */
	void exitProgram(BigIntCalParser.ProgramContext ctx);
	/**
	 * Enter a parse tree produced by {@link BigIntCalParser#command}.
	 * @param ctx the parse tree
	 */
	void enterCommand(BigIntCalParser.CommandContext ctx);
	/**
	 * Exit a parse tree produced by {@link BigIntCalParser#command}.
	 * @param ctx the parse tree
	 */
	void exitCommand(BigIntCalParser.CommandContext ctx);
	/**
	 * Enter a parse tree produced by {@link BigIntCalParser#show}.
	 * @param ctx the parse tree
	 */
	void enterShow(BigIntCalParser.ShowContext ctx);
	/**
	 * Exit a parse tree produced by {@link BigIntCalParser#show}.
	 * @param ctx the parse tree
	 */
	void exitShow(BigIntCalParser.ShowContext ctx);
	/**
	 * Enter a parse tree produced by {@link BigIntCalParser#assign}.
	 * @param ctx the parse tree
	 */
	void enterAssign(BigIntCalParser.AssignContext ctx);
	/**
	 * Exit a parse tree produced by {@link BigIntCalParser#assign}.
	 * @param ctx the parse tree
	 */
	void exitAssign(BigIntCalParser.AssignContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprAddSub}
	 * labeled alternative in {@link BigIntCalParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprAddSub(BigIntCalParser.ExprAddSubContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprAddSub}
	 * labeled alternative in {@link BigIntCalParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprAddSub(BigIntCalParser.ExprAddSubContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprParent}
	 * labeled alternative in {@link BigIntCalParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprParent(BigIntCalParser.ExprParentContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprParent}
	 * labeled alternative in {@link BigIntCalParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprParent(BigIntCalParser.ExprParentContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprNumber}
	 * labeled alternative in {@link BigIntCalParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprNumber(BigIntCalParser.ExprNumberContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprNumber}
	 * labeled alternative in {@link BigIntCalParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprNumber(BigIntCalParser.ExprNumberContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprMultDiv}
	 * labeled alternative in {@link BigIntCalParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprMultDiv(BigIntCalParser.ExprMultDivContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprMultDiv}
	 * labeled alternative in {@link BigIntCalParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprMultDiv(BigIntCalParser.ExprMultDivContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprID}
	 * labeled alternative in {@link BigIntCalParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprID(BigIntCalParser.ExprIDContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprID}
	 * labeled alternative in {@link BigIntCalParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprID(BigIntCalParser.ExprIDContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprMod}
	 * labeled alternative in {@link BigIntCalParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprMod(BigIntCalParser.ExprModContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprMod}
	 * labeled alternative in {@link BigIntCalParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprMod(BigIntCalParser.ExprModContext ctx);
}