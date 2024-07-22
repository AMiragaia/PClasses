// Generated from pdraw.g4 by ANTLR 4.13.1
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link pdrawParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface pdrawVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link pdrawParser#program}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitProgram(pdrawParser.ProgramContext ctx);
	/**
	 * Visit a parse tree produced by the {@code stat_PenTypeDef}
	 * labeled alternative in {@link pdrawParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStat_PenTypeDef(pdrawParser.Stat_PenTypeDefContext ctx);
	/**
	 * Visit a parse tree produced by the {@code stat_PenAssign}
	 * labeled alternative in {@link pdrawParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStat_PenAssign(pdrawParser.Stat_PenAssignContext ctx);
	/**
	 * Visit a parse tree produced by the {@code stat_PenAcio}
	 * labeled alternative in {@link pdrawParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStat_PenAcio(pdrawParser.Stat_PenAcioContext ctx);
	/**
	 * Visit a parse tree produced by the {@code stat_VarAssign}
	 * labeled alternative in {@link pdrawParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStat_VarAssign(pdrawParser.Stat_VarAssignContext ctx);
	/**
	 * Visit a parse tree produced by the {@code stat_VarDeclaration}
	 * labeled alternative in {@link pdrawParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStat_VarDeclaration(pdrawParser.Stat_VarDeclarationContext ctx);
	/**
	 * Visit a parse tree produced by the {@code stat_Exec}
	 * labeled alternative in {@link pdrawParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStat_Exec(pdrawParser.Stat_ExecContext ctx);
	/**
	 * Visit a parse tree produced by the {@code stat_CanvasDef}
	 * labeled alternative in {@link pdrawParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStat_CanvasDef(pdrawParser.Stat_CanvasDefContext ctx);
	/**
	 * Visit a parse tree produced by the {@code stat_Print}
	 * labeled alternative in {@link pdrawParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStat_Print(pdrawParser.Stat_PrintContext ctx);
	/**
	 * Visit a parse tree produced by the {@code stat_canvas_color}
	 * labeled alternative in {@link pdrawParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStat_canvas_color(pdrawParser.Stat_canvas_colorContext ctx);
	/**
	 * Visit a parse tree produced by the {@code stat_PenAlter}
	 * labeled alternative in {@link pdrawParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStat_PenAlter(pdrawParser.Stat_PenAlterContext ctx);
	/**
	 * Visit a parse tree produced by the {@code stat_Pause}
	 * labeled alternative in {@link pdrawParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStat_Pause(pdrawParser.Stat_PauseContext ctx);
	/**
	 * Visit a parse tree produced by the {@code stat_if}
	 * labeled alternative in {@link pdrawParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStat_if(pdrawParser.Stat_ifContext ctx);
	/**
	 * Visit a parse tree produced by the {@code stat_function_declaration}
	 * labeled alternative in {@link pdrawParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStat_function_declaration(pdrawParser.Stat_function_declarationContext ctx);
	/**
	 * Visit a parse tree produced by the {@code stat_function}
	 * labeled alternative in {@link pdrawParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStat_function(pdrawParser.Stat_functionContext ctx);
	/**
	 * Visit a parse tree produced by the {@code stat_canvas_select}
	 * labeled alternative in {@link pdrawParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStat_canvas_select(pdrawParser.Stat_canvas_selectContext ctx);
	/**
	 * Visit a parse tree produced by the {@code stat_Until}
	 * labeled alternative in {@link pdrawParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStat_Until(pdrawParser.Stat_UntilContext ctx);
	/**
	 * Visit a parse tree produced by the {@code stat_For}
	 * labeled alternative in {@link pdrawParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStat_For(pdrawParser.Stat_ForContext ctx);
	/**
	 * Visit a parse tree produced by the {@code stat_Expr}
	 * labeled alternative in {@link pdrawParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStat_Expr(pdrawParser.Stat_ExprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code stat_Curly}
	 * labeled alternative in {@link pdrawParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStat_Curly(pdrawParser.Stat_CurlyContext ctx);
	/**
	 * Visit a parse tree produced by the {@code penAttribute_color}
	 * labeled alternative in {@link pdrawParser#penAttribute}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPenAttribute_color(pdrawParser.PenAttribute_colorContext ctx);
	/**
	 * Visit a parse tree produced by the {@code penAttribute_position}
	 * labeled alternative in {@link pdrawParser#penAttribute}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPenAttribute_position(pdrawParser.PenAttribute_positionContext ctx);
	/**
	 * Visit a parse tree produced by the {@code penAttribute_orientation}
	 * labeled alternative in {@link pdrawParser#penAttribute}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPenAttribute_orientation(pdrawParser.PenAttribute_orientationContext ctx);
	/**
	 * Visit a parse tree produced by the {@code penAttribute_thickness}
	 * labeled alternative in {@link pdrawParser#penAttribute}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPenAttribute_thickness(pdrawParser.PenAttribute_thicknessContext ctx);
	/**
	 * Visit a parse tree produced by the {@code penAttribute_pressure}
	 * labeled alternative in {@link pdrawParser#penAttribute}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPenAttribute_pressure(pdrawParser.PenAttribute_pressureContext ctx);
	/**
	 * Visit a parse tree produced by the {@code penOptions_forward}
	 * labeled alternative in {@link pdrawParser#penOptions}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPenOptions_forward(pdrawParser.PenOptions_forwardContext ctx);
	/**
	 * Visit a parse tree produced by the {@code penOptions_backward}
	 * labeled alternative in {@link pdrawParser#penOptions}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPenOptions_backward(pdrawParser.PenOptions_backwardContext ctx);
	/**
	 * Visit a parse tree produced by the {@code penOptions_up}
	 * labeled alternative in {@link pdrawParser#penOptions}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPenOptions_up(pdrawParser.PenOptions_upContext ctx);
	/**
	 * Visit a parse tree produced by the {@code penOptions_down}
	 * labeled alternative in {@link pdrawParser#penOptions}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPenOptions_down(pdrawParser.PenOptions_downContext ctx);
	/**
	 * Visit a parse tree produced by the {@code penOptions_left}
	 * labeled alternative in {@link pdrawParser#penOptions}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPenOptions_left(pdrawParser.PenOptions_leftContext ctx);
	/**
	 * Visit a parse tree produced by the {@code penOptions_right}
	 * labeled alternative in {@link pdrawParser#penOptions}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPenOptions_right(pdrawParser.PenOptions_rightContext ctx);
	/**
	 * Visit a parse tree produced by the {@code penOptions_pause}
	 * labeled alternative in {@link pdrawParser#penOptions}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPenOptions_pause(pdrawParser.PenOptions_pauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link pdrawParser#penTypeDef}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPenTypeDef(pdrawParser.PenTypeDefContext ctx);
	/**
	 * Visit a parse tree produced by {@link pdrawParser#penAction}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPenAction(pdrawParser.PenActionContext ctx);
	/**
	 * Visit a parse tree produced by {@link pdrawParser#canvasDef}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCanvasDef(pdrawParser.CanvasDefContext ctx);
	/**
	 * Visit a parse tree produced by {@link pdrawParser#penAssignment}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPenAssignment(pdrawParser.PenAssignmentContext ctx);
	/**
	 * Visit a parse tree produced by {@link pdrawParser#varAssignment}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVarAssignment(pdrawParser.VarAssignmentContext ctx);
	/**
	 * Visit a parse tree produced by {@link pdrawParser#varDeclaration}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVarDeclaration(pdrawParser.VarDeclarationContext ctx);
	/**
	 * Visit a parse tree produced by {@link pdrawParser#print}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPrint(pdrawParser.PrintContext ctx);
	/**
	 * Visit a parse tree produced by {@link pdrawParser#penAlter}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPenAlter(pdrawParser.PenAlterContext ctx);
	/**
	 * Visit a parse tree produced by {@link pdrawParser#execution}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExecution(pdrawParser.ExecutionContext ctx);
	/**
	 * Visit a parse tree produced by {@link pdrawParser#pause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPause(pdrawParser.PauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link pdrawParser#if}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIf(pdrawParser.IfContext ctx);
	/**
	 * Visit a parse tree produced by {@link pdrawParser#canvas_select}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCanvas_select(pdrawParser.Canvas_selectContext ctx);
	/**
	 * Visit a parse tree produced by {@link pdrawParser#canvas_color}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCanvas_color(pdrawParser.Canvas_colorContext ctx);
	/**
	 * Visit a parse tree produced by {@link pdrawParser#function_declaration}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFunction_declaration(pdrawParser.Function_declarationContext ctx);
	/**
	 * Visit a parse tree produced by {@link pdrawParser#function}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFunction(pdrawParser.FunctionContext ctx);
	/**
	 * Visit a parse tree produced by {@link pdrawParser#until}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitUntil(pdrawParser.UntilContext ctx);
	/**
	 * Visit a parse tree produced by {@link pdrawParser#for_loop}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFor_loop(pdrawParser.For_loopContext ctx);
	/**
	 * Visit a parse tree produced by the {@code expr_stdin}
	 * labeled alternative in {@link pdrawParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpr_stdin(pdrawParser.Expr_stdinContext ctx);
	/**
	 * Visit a parse tree produced by the {@code expr_parenthesis}
	 * labeled alternative in {@link pdrawParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpr_parenthesis(pdrawParser.Expr_parenthesisContext ctx);
	/**
	 * Visit a parse tree produced by the {@code expr_bool_and}
	 * labeled alternative in {@link pdrawParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpr_bool_and(pdrawParser.Expr_bool_andContext ctx);
	/**
	 * Visit a parse tree produced by the {@code expr_bool_not}
	 * labeled alternative in {@link pdrawParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpr_bool_not(pdrawParser.Expr_bool_notContext ctx);
	/**
	 * Visit a parse tree produced by the {@code expr_mult}
	 * labeled alternative in {@link pdrawParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpr_mult(pdrawParser.Expr_multContext ctx);
	/**
	 * Visit a parse tree produced by the {@code expr_var}
	 * labeled alternative in {@link pdrawParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpr_var(pdrawParser.Expr_varContext ctx);
	/**
	 * Visit a parse tree produced by the {@code expr_bool}
	 * labeled alternative in {@link pdrawParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpr_bool(pdrawParser.Expr_boolContext ctx);
	/**
	 * Visit a parse tree produced by the {@code expr_bool_comparison}
	 * labeled alternative in {@link pdrawParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpr_bool_comparison(pdrawParser.Expr_bool_comparisonContext ctx);
	/**
	 * Visit a parse tree produced by the {@code expr_int}
	 * labeled alternative in {@link pdrawParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpr_int(pdrawParser.Expr_intContext ctx);
	/**
	 * Visit a parse tree produced by the {@code expr_point}
	 * labeled alternative in {@link pdrawParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpr_point(pdrawParser.Expr_pointContext ctx);
	/**
	 * Visit a parse tree produced by the {@code expr_sum}
	 * labeled alternative in {@link pdrawParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpr_sum(pdrawParser.Expr_sumContext ctx);
	/**
	 * Visit a parse tree produced by the {@code expr_real}
	 * labeled alternative in {@link pdrawParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpr_real(pdrawParser.Expr_realContext ctx);
	/**
	 * Visit a parse tree produced by the {@code expr_string}
	 * labeled alternative in {@link pdrawParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpr_string(pdrawParser.Expr_stringContext ctx);
	/**
	 * Visit a parse tree produced by the {@code expr_bool_or_xor}
	 * labeled alternative in {@link pdrawParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpr_bool_or_xor(pdrawParser.Expr_bool_or_xorContext ctx);
	/**
	 * Visit a parse tree produced by the {@code expr_conversion}
	 * labeled alternative in {@link pdrawParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpr_conversion(pdrawParser.Expr_conversionContext ctx);
	/**
	 * Visit a parse tree produced by {@link pdrawParser#point}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPoint(pdrawParser.PointContext ctx);
}