grammar ipdraw;

program: stat* EOF;

stat: penCommand        #stat_penCmd
    | if                #stat_if
    | until             #stat_Until
    | print             #stat_print
    | '{' stat* '}'     #stat_Curly
    | varAssignment     #stat_varAssignment
    | varDeclaration    #stat_varDeclaration
    | pause             #stat_pause
    | interactador      #stat_interactador
    ;

Color: ('red'|'orange'|'pink'|'white'|'black'|'gray'|'blue'|'cyan'|'lime'|'yellow'|'green'|RGBHex);
penCommand: 'position' '='? point ';'    #penCmd_pos
    |       'color' '='? Color ';'                                      #penCmd_color
    |       'orientation' '='? expr penRotateUnits=('º'|'rad')?  ';'    #penCmd_orientation
    |       'thickness' '='? expr ';'                                   #penCmd_thickness
    |       'pressure' '='? expr ';'                                    #penCmd_pressure
    |       'down' ';'                                                  #penCmd_down
    |       'up' ';'                                                    #penCmd_up
    |       'forward' expr ';'                                          #penCmd_forward
    |       'backward' expr ';'                                         #penCmd_backward
    |       'left' expr penRotateUnits=('º'|'rad')?  ';'                #penCmd_left
    |       'right' expr penRotateUnits=('º'|'rad')?  ';'               #penCmd_right
    |       'pause' expr ';'                                            #penCmd_pause
    ;

TYPE: 'int'|'real'|'string'|'bool'|'point';     // mover esta regra léxica da linha 67 para aqui fez com que os erros de line 10:4 extraneous input 'i' expecting '=' desaparecessem quando corria o código p1.pdraw com o p1.ipdraw abaixo
varAssignment:   TYPE? ID ('=' expr) (',' ID '=' expr)* ';'?;
varDeclaration:  TYPE ID (',' ID)* ';' ;

expr: '(' expr ')'                                       #expr_parenthesis
    | op=('not'|'!') expr                                #expr_not
    | expr op=('and'|'&&') expr                          #expr_and
    | expr op=('or'|'||'|'xor') expr                     #expr_or
    | expr op=('=='|'!='|'<='|'<'|'>='|'>') expr         #expr_comparison
    | expr op=('*'|'/'|'//'|'%'|'\\'|'**') expr               #expr_mul
    | expr op=('+'|'-') expr                             #expr_sum
    | REAL                                               #expr_REAL
    | INT                                                #expr_int
    | BOOL                                               #expr_bool
    | ID                                                 #expr_var
    | point                                              #expr_point
    | STRING                                             #expr_string
    ;


if: 'if' '(' expr ')' stat ';'?;

until:          'until' '(' expr ')'
                    stat
                ';'?; 


print:          (id= ID | s= STRING+ ) '->' 'stdout' ';' ;


pause:          'pause' expr ';';


interactador:   'interactador' ';'? ;


point: '(' expr ',' expr ')';

ID: [a-zA-Z_][a-zA-Z_0-9]*;
INT: ('-')? [0-9]+;
REAL: ('-')? [0-9]+ '.' [0-9]+;
BOOL: 'true' | 'false';
STRING: '"' (~["\r\n\\] | '\\' .)* '"';
//TYPE: 'bool'|'int'|'real'|'string'|'point';

RGBHex: '#'[0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f];




Comment: '%' ~('\n')* '\n'? -> skip;
WS: [ \t\r\n]+ -> skip;


/* position (10,10); % set pen position
down;
forward 10;
left 45º;
backward 5;
right 45º;
forward 100;


int i = 10;
until(i < 10) {
    left PI / 4;
    forward 150;
    left PI / 4;
    forward 400;

    i = i + 1;
} */
