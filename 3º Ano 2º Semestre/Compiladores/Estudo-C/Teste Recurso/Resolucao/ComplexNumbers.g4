grammar ComplexNumbers;

program: (command?';')* EOF;

command: display | assignment;

display: 'display' expr;
assignment: ID '<=' expr;

expr: '(' expr ')'                  #ExprParent
    | op = ('+'|'-') expr           #ExprUnary
    | expr op = ('*'|':') expr      #ExprMultDiv
    | expr op = ('+'|'-') expr      #ExprSumSub
    | COMPLEX                       #ExprComplex
    | ID                            #ExprID
    | REAL                          #ExprReal
    ;

COMPLEX: REAL? ('+'|'-')? REAL? 'i';
ID: [a-zA-Z0-9]([0-9]+)?;
REAL: NUMBER('.'NUMBER)?;
NUMBER: [0-9]+;

WS: [ \t\r\n] -> skip;
COMMENT: '*COM*'.*? '\n' -> skip;
ERROR: .;