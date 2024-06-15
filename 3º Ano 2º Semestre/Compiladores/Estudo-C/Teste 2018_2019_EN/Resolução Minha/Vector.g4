grammar Vector;

program: (command?';')* EOF;

command: print | assign;

print: 'show' expr;

assign: expr '->' ID;

expr: '('expr')'                        #ExprParent
    | op = ('+'|'-') expr               #ExprUnary
    | expr '*' expr                     #ExprMult
    | expr'.'expr                       #ExprInternalProduct
    | expr op = ('+'|'-') expr          #ExprAddSub
    | VECTOR                            #ExprVector
    | REAL                              #ExprReal
    | ID                                #ExprID
    ;

VECTOR: '['REAL(',' REAL)*']';

REAL: NUMBER ('.' NUMBER)? ;

ID: [a-z]+(NUMBER)?;
NUMBER:[0-9]+;

WS: [ \t\r\n] ->  skip;
COMMENT: '#'.*? '\n' -> skip;
ERROR: .;
