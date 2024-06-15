grammar CalcComplex;

program: (command?';')* EOF;

command: display
       | assign
       ;

display: 'output' expr;

assign: expr '=>' ID;

expr: '(' expr ')'                  #ExprParent
    | op = ('+'|'-') expr           #ExprUnary
    | expr op = ('*'|':') expr      #ExprMultDiv
    | expr op = ('+'|'-') expr      #ExprAddSub
    | 'input' STRING                #ExprInput
    | COMPLEX                       #ExprComplex
    | NUMBER                        #ExprNumber
    | ID                            #ExprID
    ;

COMPLEX: NUMBER? ('+'|'-')? NUMBER? 'i';
STRING: '"'.?NUMBER*'"';
ID: [a-z]([a-z0-9]+)?;
NUMBER: [0-9]+;

WS: [ \t\r\n] -> skip;
COMMENT: '##'.*? '\n' -> skip;
ERROR: .;