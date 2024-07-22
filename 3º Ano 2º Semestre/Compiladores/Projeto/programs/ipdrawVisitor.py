# Generated from ipdraw.g4 by ANTLR 4.13.1
from antlr4 import *
if "." in __name__:
    from .ipdrawParser import ipdrawParser
else:
    from ipdrawParser import ipdrawParser

# This class defines a complete generic visitor for a parse tree produced by ipdrawParser.

class ipdrawVisitor(ParseTreeVisitor):

    # Visit a parse tree produced by ipdrawParser#program.
    def visitProgram(self, ctx:ipdrawParser.ProgramContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#stat_penCmd.
    def visitStat_penCmd(self, ctx:ipdrawParser.Stat_penCmdContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#stat_if.
    def visitStat_if(self, ctx:ipdrawParser.Stat_ifContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#stat_Until.
    def visitStat_Until(self, ctx:ipdrawParser.Stat_UntilContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#stat_print.
    def visitStat_print(self, ctx:ipdrawParser.Stat_printContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#stat_Curly.
    def visitStat_Curly(self, ctx:ipdrawParser.Stat_CurlyContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#stat_varAssignment.
    def visitStat_varAssignment(self, ctx:ipdrawParser.Stat_varAssignmentContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#stat_varDeclaration.
    def visitStat_varDeclaration(self, ctx:ipdrawParser.Stat_varDeclarationContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#stat_pause.
    def visitStat_pause(self, ctx:ipdrawParser.Stat_pauseContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#stat_interactador.
    def visitStat_interactador(self, ctx:ipdrawParser.Stat_interactadorContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#penCmd_pos.
    def visitPenCmd_pos(self, ctx:ipdrawParser.PenCmd_posContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#penCmd_color.
    def visitPenCmd_color(self, ctx:ipdrawParser.PenCmd_colorContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#penCmd_orientation.
    def visitPenCmd_orientation(self, ctx:ipdrawParser.PenCmd_orientationContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#penCmd_thickness.
    def visitPenCmd_thickness(self, ctx:ipdrawParser.PenCmd_thicknessContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#penCmd_pressure.
    def visitPenCmd_pressure(self, ctx:ipdrawParser.PenCmd_pressureContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#penCmd_down.
    def visitPenCmd_down(self, ctx:ipdrawParser.PenCmd_downContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#penCmd_up.
    def visitPenCmd_up(self, ctx:ipdrawParser.PenCmd_upContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#penCmd_forward.
    def visitPenCmd_forward(self, ctx:ipdrawParser.PenCmd_forwardContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#penCmd_backward.
    def visitPenCmd_backward(self, ctx:ipdrawParser.PenCmd_backwardContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#penCmd_left.
    def visitPenCmd_left(self, ctx:ipdrawParser.PenCmd_leftContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#penCmd_right.
    def visitPenCmd_right(self, ctx:ipdrawParser.PenCmd_rightContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#penCmd_pause.
    def visitPenCmd_pause(self, ctx:ipdrawParser.PenCmd_pauseContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#varAssignment.
    def visitVarAssignment(self, ctx:ipdrawParser.VarAssignmentContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#varDeclaration.
    def visitVarDeclaration(self, ctx:ipdrawParser.VarDeclarationContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#expr_parenthesis.
    def visitExpr_parenthesis(self, ctx:ipdrawParser.Expr_parenthesisContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#expr_var.
    def visitExpr_var(self, ctx:ipdrawParser.Expr_varContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#expr_bool.
    def visitExpr_bool(self, ctx:ipdrawParser.Expr_boolContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#expr_comparison.
    def visitExpr_comparison(self, ctx:ipdrawParser.Expr_comparisonContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#expr_mul.
    def visitExpr_mul(self, ctx:ipdrawParser.Expr_mulContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#expr_int.
    def visitExpr_int(self, ctx:ipdrawParser.Expr_intContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#expr_point.
    def visitExpr_point(self, ctx:ipdrawParser.Expr_pointContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#expr_sum.
    def visitExpr_sum(self, ctx:ipdrawParser.Expr_sumContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#expr_or.
    def visitExpr_or(self, ctx:ipdrawParser.Expr_orContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#expr_REAL.
    def visitExpr_REAL(self, ctx:ipdrawParser.Expr_REALContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#expr_string.
    def visitExpr_string(self, ctx:ipdrawParser.Expr_stringContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#expr_and.
    def visitExpr_and(self, ctx:ipdrawParser.Expr_andContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#expr_not.
    def visitExpr_not(self, ctx:ipdrawParser.Expr_notContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#if.
    def visitIf(self, ctx:ipdrawParser.IfContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#until.
    def visitUntil(self, ctx:ipdrawParser.UntilContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#print.
    def visitPrint(self, ctx:ipdrawParser.PrintContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#pause.
    def visitPause(self, ctx:ipdrawParser.PauseContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#interactador.
    def visitInteractador(self, ctx:ipdrawParser.InteractadorContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by ipdrawParser#point.
    def visitPoint(self, ctx:ipdrawParser.PointContext):
        return self.visitChildren(ctx)



del ipdrawParser