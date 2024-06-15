// Generated from BigIntCal.g4 by ANTLR 4.12.0
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link BigIntCalParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface BigIntCalVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link BigIntCalParser#program}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitProgram(BigIntCalParser.ProgramContext ctx);
	/**
	 * Visit a parse tree produced by {@link BigIntCalParser#command}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCommand(BigIntCalParser.CommandContext ctx);
	/**
	 * Visit a parse tree produced by {@link BigIntCalParser#show}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitShow(BigIntCalParser.ShowContext ctx);
	/**
	 * Visit a parse tree produced by {@link BigIntCalParser#assign}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAssign(BigIntCalParser.AssignContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ExprAddSub}
	 * labeled alternative in {@link BigIntCalParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprAddSub(BigIntCalParser.ExprAddSubContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ExprParent}
	 * labeled alternative in {@link BigIntCalParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprParent(BigIntCalParser.ExprParentContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ExprNumber}
	 * labeled alternative in {@link BigIntCalParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprNumber(BigIntCalParser.ExprNumberContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ExprMultDiv}
	 * labeled alternative in {@link BigIntCalParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprMultDiv(BigIntCalParser.ExprMultDivContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ExprID}
	 * labeled alternative in {@link BigIntCalParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprID(BigIntCalParser.ExprIDContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ExprMod}
	 * labeled alternative in {@link BigIntCalParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprMod(BigIntCalParser.ExprModContext ctx);
}