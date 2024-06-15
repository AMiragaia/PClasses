grammar StrLang;

program: command* EOF;

command: assign                     #AssignCommand
       | display                    #PrintCommand
       ;

assign: e1 = expr ':' e2 = expr;

display: 'print' expr ;

expr: '(' expr ')'                  #ExprParent
    | 'input' expr                  #ExprInput
    | expr '+' expr                 #ExprConcact
    | expr '-' expr                 #ExprRemove
    | 'trim' expr                   #ExprRemoveWS
    | expr '/' expr '/' expr        #ExprReplace
    | STRING                        #ExprString
    | ID                            #ExprID
    ;

ID: [a-zA-Z0-9]+;

STRING: '"' .*? '"';

WS: [ \t\n\r] -> skip;
COMMENT: '//'.*? '\n' -> skip;
ERROR: .;
