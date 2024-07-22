# Generated from ipdraw.g4 by ANTLR 4.13.1
from antlr4 import *
if "." in __name__:
    from .ipdrawParser import ipdrawParser
else:
    from ipdrawParser import ipdrawParser

# This class defines a complete listener for a parse tree produced by ipdrawParser.
class ipdrawListener(ParseTreeListener):

    # Enter a parse tree produced by ipdrawParser#program.
    def enterProgram(self, ctx:ipdrawParser.ProgramContext):
        pass

    # Exit a parse tree produced by ipdrawParser#program.
    def exitProgram(self, ctx:ipdrawParser.ProgramContext):
        pass


    # Enter a parse tree produced by ipdrawParser#stat_penCmd.
    def enterStat_penCmd(self, ctx:ipdrawParser.Stat_penCmdContext):
        pass

    # Exit a parse tree produced by ipdrawParser#stat_penCmd.
    def exitStat_penCmd(self, ctx:ipdrawParser.Stat_penCmdContext):
        pass


    # Enter a parse tree produced by ipdrawParser#stat_if.
    def enterStat_if(self, ctx:ipdrawParser.Stat_ifContext):
        pass

    # Exit a parse tree produced by ipdrawParser#stat_if.
    def exitStat_if(self, ctx:ipdrawParser.Stat_ifContext):
        pass


    # Enter a parse tree produced by ipdrawParser#stat_Until.
    def enterStat_Until(self, ctx:ipdrawParser.Stat_UntilContext):
        pass

    # Exit a parse tree produced by ipdrawParser#stat_Until.
    def exitStat_Until(self, ctx:ipdrawParser.Stat_UntilContext):
        pass


    # Enter a parse tree produced by ipdrawParser#stat_print.
    def enterStat_print(self, ctx:ipdrawParser.Stat_printContext):
        pass

    # Exit a parse tree produced by ipdrawParser#stat_print.
    def exitStat_print(self, ctx:ipdrawParser.Stat_printContext):
        pass


    # Enter a parse tree produced by ipdrawParser#stat_Curly.
    def enterStat_Curly(self, ctx:ipdrawParser.Stat_CurlyContext):
        pass

    # Exit a parse tree produced by ipdrawParser#stat_Curly.
    def exitStat_Curly(self, ctx:ipdrawParser.Stat_CurlyContext):
        pass


    # Enter a parse tree produced by ipdrawParser#stat_varAssignment.
    def enterStat_varAssignment(self, ctx:ipdrawParser.Stat_varAssignmentContext):
        pass

    # Exit a parse tree produced by ipdrawParser#stat_varAssignment.
    def exitStat_varAssignment(self, ctx:ipdrawParser.Stat_varAssignmentContext):
        pass


    # Enter a parse tree produced by ipdrawParser#stat_varDeclaration.
    def enterStat_varDeclaration(self, ctx:ipdrawParser.Stat_varDeclarationContext):
        pass

    # Exit a parse tree produced by ipdrawParser#stat_varDeclaration.
    def exitStat_varDeclaration(self, ctx:ipdrawParser.Stat_varDeclarationContext):
        pass


    # Enter a parse tree produced by ipdrawParser#stat_pause.
    def enterStat_pause(self, ctx:ipdrawParser.Stat_pauseContext):
        pass

    # Exit a parse tree produced by ipdrawParser#stat_pause.
    def exitStat_pause(self, ctx:ipdrawParser.Stat_pauseContext):
        pass


    # Enter a parse tree produced by ipdrawParser#stat_interactador.
    def enterStat_interactador(self, ctx:ipdrawParser.Stat_interactadorContext):
        pass

    # Exit a parse tree produced by ipdrawParser#stat_interactador.
    def exitStat_interactador(self, ctx:ipdrawParser.Stat_interactadorContext):
        pass


    # Enter a parse tree produced by ipdrawParser#penCmd_pos.
    def enterPenCmd_pos(self, ctx:ipdrawParser.PenCmd_posContext):
        pass

    # Exit a parse tree produced by ipdrawParser#penCmd_pos.
    def exitPenCmd_pos(self, ctx:ipdrawParser.PenCmd_posContext):
        pass


    # Enter a parse tree produced by ipdrawParser#penCmd_color.
    def enterPenCmd_color(self, ctx:ipdrawParser.PenCmd_colorContext):
        pass

    # Exit a parse tree produced by ipdrawParser#penCmd_color.
    def exitPenCmd_color(self, ctx:ipdrawParser.PenCmd_colorContext):
        pass


    # Enter a parse tree produced by ipdrawParser#penCmd_orientation.
    def enterPenCmd_orientation(self, ctx:ipdrawParser.PenCmd_orientationContext):
        pass

    # Exit a parse tree produced by ipdrawParser#penCmd_orientation.
    def exitPenCmd_orientation(self, ctx:ipdrawParser.PenCmd_orientationContext):
        pass


    # Enter a parse tree produced by ipdrawParser#penCmd_thickness.
    def enterPenCmd_thickness(self, ctx:ipdrawParser.PenCmd_thicknessContext):
        pass

    # Exit a parse tree produced by ipdrawParser#penCmd_thickness.
    def exitPenCmd_thickness(self, ctx:ipdrawParser.PenCmd_thicknessContext):
        pass


    # Enter a parse tree produced by ipdrawParser#penCmd_pressure.
    def enterPenCmd_pressure(self, ctx:ipdrawParser.PenCmd_pressureContext):
        pass

    # Exit a parse tree produced by ipdrawParser#penCmd_pressure.
    def exitPenCmd_pressure(self, ctx:ipdrawParser.PenCmd_pressureContext):
        pass


    # Enter a parse tree produced by ipdrawParser#penCmd_down.
    def enterPenCmd_down(self, ctx:ipdrawParser.PenCmd_downContext):
        pass

    # Exit a parse tree produced by ipdrawParser#penCmd_down.
    def exitPenCmd_down(self, ctx:ipdrawParser.PenCmd_downContext):
        pass


    # Enter a parse tree produced by ipdrawParser#penCmd_up.
    def enterPenCmd_up(self, ctx:ipdrawParser.PenCmd_upContext):
        pass

    # Exit a parse tree produced by ipdrawParser#penCmd_up.
    def exitPenCmd_up(self, ctx:ipdrawParser.PenCmd_upContext):
        pass


    # Enter a parse tree produced by ipdrawParser#penCmd_forward.
    def enterPenCmd_forward(self, ctx:ipdrawParser.PenCmd_forwardContext):
        pass

    # Exit a parse tree produced by ipdrawParser#penCmd_forward.
    def exitPenCmd_forward(self, ctx:ipdrawParser.PenCmd_forwardContext):
        pass


    # Enter a parse tree produced by ipdrawParser#penCmd_backward.
    def enterPenCmd_backward(self, ctx:ipdrawParser.PenCmd_backwardContext):
        pass

    # Exit a parse tree produced by ipdrawParser#penCmd_backward.
    def exitPenCmd_backward(self, ctx:ipdrawParser.PenCmd_backwardContext):
        pass


    # Enter a parse tree produced by ipdrawParser#penCmd_left.
    def enterPenCmd_left(self, ctx:ipdrawParser.PenCmd_leftContext):
        pass

    # Exit a parse tree produced by ipdrawParser#penCmd_left.
    def exitPenCmd_left(self, ctx:ipdrawParser.PenCmd_leftContext):
        pass


    # Enter a parse tree produced by ipdrawParser#penCmd_right.
    def enterPenCmd_right(self, ctx:ipdrawParser.PenCmd_rightContext):
        pass

    # Exit a parse tree produced by ipdrawParser#penCmd_right.
    def exitPenCmd_right(self, ctx:ipdrawParser.PenCmd_rightContext):
        pass


    # Enter a parse tree produced by ipdrawParser#penCmd_pause.
    def enterPenCmd_pause(self, ctx:ipdrawParser.PenCmd_pauseContext):
        pass

    # Exit a parse tree produced by ipdrawParser#penCmd_pause.
    def exitPenCmd_pause(self, ctx:ipdrawParser.PenCmd_pauseContext):
        pass


    # Enter a parse tree produced by ipdrawParser#varAssignment.
    def enterVarAssignment(self, ctx:ipdrawParser.VarAssignmentContext):
        pass

    # Exit a parse tree produced by ipdrawParser#varAssignment.
    def exitVarAssignment(self, ctx:ipdrawParser.VarAssignmentContext):
        pass


    # Enter a parse tree produced by ipdrawParser#varDeclaration.
    def enterVarDeclaration(self, ctx:ipdrawParser.VarDeclarationContext):
        pass

    # Exit a parse tree produced by ipdrawParser#varDeclaration.
    def exitVarDeclaration(self, ctx:ipdrawParser.VarDeclarationContext):
        pass


    # Enter a parse tree produced by ipdrawParser#expr_parenthesis.
    def enterExpr_parenthesis(self, ctx:ipdrawParser.Expr_parenthesisContext):
        pass

    # Exit a parse tree produced by ipdrawParser#expr_parenthesis.
    def exitExpr_parenthesis(self, ctx:ipdrawParser.Expr_parenthesisContext):
        pass


    # Enter a parse tree produced by ipdrawParser#expr_var.
    def enterExpr_var(self, ctx:ipdrawParser.Expr_varContext):
        pass

    # Exit a parse tree produced by ipdrawParser#expr_var.
    def exitExpr_var(self, ctx:ipdrawParser.Expr_varContext):
        pass


    # Enter a parse tree produced by ipdrawParser#expr_bool.
    def enterExpr_bool(self, ctx:ipdrawParser.Expr_boolContext):
        pass

    # Exit a parse tree produced by ipdrawParser#expr_bool.
    def exitExpr_bool(self, ctx:ipdrawParser.Expr_boolContext):
        pass


    # Enter a parse tree produced by ipdrawParser#expr_comparison.
    def enterExpr_comparison(self, ctx:ipdrawParser.Expr_comparisonContext):
        pass

    # Exit a parse tree produced by ipdrawParser#expr_comparison.
    def exitExpr_comparison(self, ctx:ipdrawParser.Expr_comparisonContext):
        pass


    # Enter a parse tree produced by ipdrawParser#expr_mul.
    def enterExpr_mul(self, ctx:ipdrawParser.Expr_mulContext):
        pass

    # Exit a parse tree produced by ipdrawParser#expr_mul.
    def exitExpr_mul(self, ctx:ipdrawParser.Expr_mulContext):
        pass


    # Enter a parse tree produced by ipdrawParser#expr_int.
    def enterExpr_int(self, ctx:ipdrawParser.Expr_intContext):
        pass

    # Exit a parse tree produced by ipdrawParser#expr_int.
    def exitExpr_int(self, ctx:ipdrawParser.Expr_intContext):
        pass


    # Enter a parse tree produced by ipdrawParser#expr_point.
    def enterExpr_point(self, ctx:ipdrawParser.Expr_pointContext):
        pass

    # Exit a parse tree produced by ipdrawParser#expr_point.
    def exitExpr_point(self, ctx:ipdrawParser.Expr_pointContext):
        pass


    # Enter a parse tree produced by ipdrawParser#expr_sum.
    def enterExpr_sum(self, ctx:ipdrawParser.Expr_sumContext):
        pass

    # Exit a parse tree produced by ipdrawParser#expr_sum.
    def exitExpr_sum(self, ctx:ipdrawParser.Expr_sumContext):
        pass


    # Enter a parse tree produced by ipdrawParser#expr_or.
    def enterExpr_or(self, ctx:ipdrawParser.Expr_orContext):
        pass

    # Exit a parse tree produced by ipdrawParser#expr_or.
    def exitExpr_or(self, ctx:ipdrawParser.Expr_orContext):
        pass


    # Enter a parse tree produced by ipdrawParser#expr_REAL.
    def enterExpr_REAL(self, ctx:ipdrawParser.Expr_REALContext):
        pass

    # Exit a parse tree produced by ipdrawParser#expr_REAL.
    def exitExpr_REAL(self, ctx:ipdrawParser.Expr_REALContext):
        pass


    # Enter a parse tree produced by ipdrawParser#expr_string.
    def enterExpr_string(self, ctx:ipdrawParser.Expr_stringContext):
        pass

    # Exit a parse tree produced by ipdrawParser#expr_string.
    def exitExpr_string(self, ctx:ipdrawParser.Expr_stringContext):
        pass


    # Enter a parse tree produced by ipdrawParser#expr_and.
    def enterExpr_and(self, ctx:ipdrawParser.Expr_andContext):
        pass

    # Exit a parse tree produced by ipdrawParser#expr_and.
    def exitExpr_and(self, ctx:ipdrawParser.Expr_andContext):
        pass


    # Enter a parse tree produced by ipdrawParser#expr_not.
    def enterExpr_not(self, ctx:ipdrawParser.Expr_notContext):
        pass

    # Exit a parse tree produced by ipdrawParser#expr_not.
    def exitExpr_not(self, ctx:ipdrawParser.Expr_notContext):
        pass


    # Enter a parse tree produced by ipdrawParser#if.
    def enterIf(self, ctx:ipdrawParser.IfContext):
        pass

    # Exit a parse tree produced by ipdrawParser#if.
    def exitIf(self, ctx:ipdrawParser.IfContext):
        pass


    # Enter a parse tree produced by ipdrawParser#until.
    def enterUntil(self, ctx:ipdrawParser.UntilContext):
        pass

    # Exit a parse tree produced by ipdrawParser#until.
    def exitUntil(self, ctx:ipdrawParser.UntilContext):
        pass


    # Enter a parse tree produced by ipdrawParser#print.
    def enterPrint(self, ctx:ipdrawParser.PrintContext):
        pass

    # Exit a parse tree produced by ipdrawParser#print.
    def exitPrint(self, ctx:ipdrawParser.PrintContext):
        pass


    # Enter a parse tree produced by ipdrawParser#pause.
    def enterPause(self, ctx:ipdrawParser.PauseContext):
        pass

    # Exit a parse tree produced by ipdrawParser#pause.
    def exitPause(self, ctx:ipdrawParser.PauseContext):
        pass


    # Enter a parse tree produced by ipdrawParser#interactador.
    def enterInteractador(self, ctx:ipdrawParser.InteractadorContext):
        pass

    # Exit a parse tree produced by ipdrawParser#interactador.
    def exitInteractador(self, ctx:ipdrawParser.InteractadorContext):
        pass


    # Enter a parse tree produced by ipdrawParser#point.
    def enterPoint(self, ctx:ipdrawParser.PointContext):
        pass

    # Exit a parse tree produced by ipdrawParser#point.
    def exitPoint(self, ctx:ipdrawParser.PointContext):
        pass



del ipdrawParser