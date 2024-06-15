// Generated from Vector.g4 by ANTLR 4.12.0
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link VectorParser}.
 */
public interface VectorListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link VectorParser#program}.
	 * @param ctx the parse tree
	 */
	void enterProgram(VectorParser.ProgramContext ctx);
	/**
	 * Exit a parse tree produced by {@link VectorParser#program}.
	 * @param ctx the parse tree
	 */
	void exitProgram(VectorParser.ProgramContext ctx);
	/**
	 * Enter a parse tree produced by {@link VectorParser#command}.
	 * @param ctx the parse tree
	 */
	void enterCommand(VectorParser.CommandContext ctx);
	/**
	 * Exit a parse tree produced by {@link VectorParser#command}.
	 * @param ctx the parse tree
	 */
	void exitCommand(VectorParser.CommandContext ctx);
	/**
	 * Enter a parse tree produced by {@link VectorParser#print}.
	 * @param ctx the parse tree
	 */
	void enterPrint(VectorParser.PrintContext ctx);
	/**
	 * Exit a parse tree produced by {@link VectorParser#print}.
	 * @param ctx the parse tree
	 */
	void exitPrint(VectorParser.PrintContext ctx);
	/**
	 * Enter a parse tree produced by {@link VectorParser#assign}.
	 * @param ctx the parse tree
	 */
	void enterAssign(VectorParser.AssignContext ctx);
	/**
	 * Exit a parse tree produced by {@link VectorParser#assign}.
	 * @param ctx the parse tree
	 */
	void exitAssign(VectorParser.AssignContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprVector}
	 * labeled alternative in {@link VectorParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprVector(VectorParser.ExprVectorContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprVector}
	 * labeled alternative in {@link VectorParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprVector(VectorParser.ExprVectorContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprAddSub}
	 * labeled alternative in {@link VectorParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprAddSub(VectorParser.ExprAddSubContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprAddSub}
	 * labeled alternative in {@link VectorParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprAddSub(VectorParser.ExprAddSubContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprMult}
	 * labeled alternative in {@link VectorParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprMult(VectorParser.ExprMultContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprMult}
	 * labeled alternative in {@link VectorParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprMult(VectorParser.ExprMultContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprParent}
	 * labeled alternative in {@link VectorParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprParent(VectorParser.ExprParentContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprParent}
	 * labeled alternative in {@link VectorParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprParent(VectorParser.ExprParentContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprUnary}
	 * labeled alternative in {@link VectorParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprUnary(VectorParser.ExprUnaryContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprUnary}
	 * labeled alternative in {@link VectorParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprUnary(VectorParser.ExprUnaryContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprReal}
	 * labeled alternative in {@link VectorParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprReal(VectorParser.ExprRealContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprReal}
	 * labeled alternative in {@link VectorParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprReal(VectorParser.ExprRealContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprInternalProduct}
	 * labeled alternative in {@link VectorParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprInternalProduct(VectorParser.ExprInternalProductContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprInternalProduct}
	 * labeled alternative in {@link VectorParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprInternalProduct(VectorParser.ExprInternalProductContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprID}
	 * labeled alternative in {@link VectorParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprID(VectorParser.ExprIDContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprID}
	 * labeled alternative in {@link VectorParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprID(VectorParser.ExprIDContext ctx);
}