grammar BigIntCal;

program: (command?';')* EOF;

command: show | assign;

show: 'show' expr;
assign: expr '->' ID;

expr: '('expr')'                    #ExprParent
    | expr 'mod' expr               #ExprMod
    | expr op = ('*'|'div') expr    #ExprMultDiv
    | expr op = ('+'|'-') expr      #ExprAddSub
    | NUMBER                        #ExprNumber
    | ID                            #ExprID
    ;

ID: [a-zA-Z]NUMBER*;
NUMBER: [0-9]+;

COMMENT: '#'.*? '\n' -> skip;
WS: [ \t\r\n] -> skip;
ERROR: .;