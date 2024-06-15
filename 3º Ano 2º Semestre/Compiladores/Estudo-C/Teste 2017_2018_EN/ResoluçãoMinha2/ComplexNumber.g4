grammar ComplexNumber;

program: (command?';')* EOF;

command: print | assign;

print: 'output' expr;

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

STRING: '"'ID'"';

COMPLEX: NUMBER? ('+'|'-')? NUMBER? 'i'; 
ID: [a-z]([a-zA-Z0-9]+)?;
NUMBER: [0-9]+;

WS: [ \t\r\n] -> skip;
COMMENT: '##'.*? '\n' -> skip;
ERROR:.;