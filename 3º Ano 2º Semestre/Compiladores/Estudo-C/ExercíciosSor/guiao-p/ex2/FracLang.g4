grammar FracLang;

program: (command?';')* EOF;

command: assignment
       | display
       ;

assignment: ID '<=' expr;

display: 'display' expr;

expr: '(' expr ')'                  #ExprParent
    | op = ('+'|'-') expr                #ExprPosNeg
    | expr op = ('*'|':') expr           #ExprMultDiv
    | expr op = ('+'|'-') expr           #ExprAddSub
    | FRAC                          #ExprFrac
    | 'reduce' expr                 #ExprReduce
    | 'read' STRING                 #ExprInput
    | ID                            #ExprID
    ;


ID: [a-z]+;
FRAC: NUMBER ('/' NUMBER)?;
STRING: '"' .*? '"';
NUMBER: [0-9]+;


COMMENT: [ \t\n\r] -> skip;
WS: '--'.*? '\n' -> skip;
ERROR: .;