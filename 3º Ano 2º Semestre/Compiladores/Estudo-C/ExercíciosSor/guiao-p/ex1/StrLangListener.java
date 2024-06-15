// Generated from StrLang.g4 by ANTLR 4.12.0
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link StrLangParser}.
 */
public interface StrLangListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link StrLangParser#program}.
	 * @param ctx the parse tree
	 */
	void enterProgram(StrLangParser.ProgramContext ctx);
	/**
	 * Exit a parse tree produced by {@link StrLangParser#program}.
	 * @param ctx the parse tree
	 */
	void exitProgram(StrLangParser.ProgramContext ctx);
	/**
	 * Enter a parse tree produced by the {@code AssignCommand}
	 * labeled alternative in {@link StrLangParser#command}.
	 * @param ctx the parse tree
	 */
	void enterAssignCommand(StrLangParser.AssignCommandContext ctx);
	/**
	 * Exit a parse tree produced by the {@code AssignCommand}
	 * labeled alternative in {@link StrLangParser#command}.
	 * @param ctx the parse tree
	 */
	void exitAssignCommand(StrLangParser.AssignCommandContext ctx);
	/**
	 * Enter a parse tree produced by the {@code PrintCommand}
	 * labeled alternative in {@link StrLangParser#command}.
	 * @param ctx the parse tree
	 */
	void enterPrintCommand(StrLangParser.PrintCommandContext ctx);
	/**
	 * Exit a parse tree produced by the {@code PrintCommand}
	 * labeled alternative in {@link StrLangParser#command}.
	 * @param ctx the parse tree
	 */
	void exitPrintCommand(StrLangParser.PrintCommandContext ctx);
	/**
	 * Enter a parse tree produced by {@link StrLangParser#assign}.
	 * @param ctx the parse tree
	 */
	void enterAssign(StrLangParser.AssignContext ctx);
	/**
	 * Exit a parse tree produced by {@link StrLangParser#assign}.
	 * @param ctx the parse tree
	 */
	void exitAssign(StrLangParser.AssignContext ctx);
	/**
	 * Enter a parse tree produced by {@link StrLangParser#display}.
	 * @param ctx the parse tree
	 */
	void enterDisplay(StrLangParser.DisplayContext ctx);
	/**
	 * Exit a parse tree produced by {@link StrLangParser#display}.
	 * @param ctx the parse tree
	 */
	void exitDisplay(StrLangParser.DisplayContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprRemove}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprRemove(StrLangParser.ExprRemoveContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprRemove}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprRemove(StrLangParser.ExprRemoveContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprReplace}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprReplace(StrLangParser.ExprReplaceContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprReplace}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprReplace(StrLangParser.ExprReplaceContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprConcact}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprConcact(StrLangParser.ExprConcactContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprConcact}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprConcact(StrLangParser.ExprConcactContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprString}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprString(StrLangParser.ExprStringContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprString}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprString(StrLangParser.ExprStringContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprParent}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprParent(StrLangParser.ExprParentContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprParent}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprParent(StrLangParser.ExprParentContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprInput}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprInput(StrLangParser.ExprInputContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprInput}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprInput(StrLangParser.ExprInputContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprRemoveWS}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprRemoveWS(StrLangParser.ExprRemoveWSContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprRemoveWS}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprRemoveWS(StrLangParser.ExprRemoveWSContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprID}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprID(StrLangParser.ExprIDContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprID}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprID(StrLangParser.ExprIDContext ctx);
}