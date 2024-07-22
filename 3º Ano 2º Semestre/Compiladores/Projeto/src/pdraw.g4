grammar pdraw;

program: stat* EOF;

stat:   penTypeDef          #stat_PenTypeDef
    |   penAssignment       #stat_PenAssign

    |   penAction           #stat_PenAcio
    
    |   varAssignment       #stat_VarAssign
    |   varDeclaration      #stat_VarDeclaration

    |   execution           #stat_Exec

    |   canvasDef           #stat_CanvasDef
    |   print               #stat_Print

    |   canvas_color        #stat_canvas_color

    |   penAlter            #stat_PenAlter
    |   pause               #stat_Pause

    |   if                  #stat_if
    |   function_declaration            #stat_function_declaration
    |   function            #stat_function
    |   canvas_select       #stat_canvas_select

    |   until               #stat_Until
    |   for_loop            #stat_For
    
    |   expr                #stat_Expr
    |   '{' stat* '}'       #stat_Curly
    ;




Type:       ('real'|'int'|'point'|'bool'|'string');

penAttribute:  'color' '='? Color ';'                               #penAttribute_color
        |   'position' '='? expr ';'                                #penAttribute_position
        |   'orientation' '='? expr penRotateUnits=('º'|'rad')? ';' #penAttribute_orientation
        |   'thickness' '='? expr ';'                               #penAttribute_thickness
        |   'pressure' '='? expr ';'                                #penAttribute_pressure
        ; 

penOptions: 'forward' expr                              #penOptions_forward
        |   'backward' expr                             #penOptions_backward
        |   'up'                                        #penOptions_up
        |   'down'                                      #penOptions_down
        |   'left' expr penRotateUnits=('º'|'rad')?     #penOptions_left       //se as unidades não estiverem explícitas, dar default para graus
        |   'right' expr penRotateUnits=('º'|'rad')?    #penOptions_right
        |   'pause' expr                                #penOptions_pause
        ;

penTypeDef:     'define' 'pen' Id '{' penAttribute+ '}' ';';

penAction:      Id (penOptions)+';'; 


canvasDef:      'define' 'canvas' Id String+ expr ';';

penAssignment:  'pen' Id '=' 'new' Id? ';';


varAssignment:   Type? Id ('=' expr) (',' Id '=' expr)* ';'?;

varDeclaration:  Type Id (',' Id)* ';' ;


print:          (id= Id | id_class= Id | s= String+ ) '->' 'stdout' ';' ;

penAlter:       Id '<-' penAttribute;

execution:      Id (',' Id)* '<-' 'execute'  String+  ';';

pause:          'pause' expr ';';



if: 'if' '(' expr ')' stat ';'?;

canvas_select:  'pen' Id 'select' 'canvas' Id ';';

canvas_color:   'canvas' Id 'color' '<-' Color ';'?;




function_declaration:       'def' 'function' Id '(' (Type Id (',' Type Id)*)? ')' stat ';'?;

function:       'functionador' Id '(' (expr (',' expr)*)? ')' ';'?;



until:          'until' '(' expr ')'
                    stat
                ';'?;

for_loop:       'for' '(' 
                    varAssignment ';'
                    expr ';'
                    varAssignment ')'
                    stat
                ';'?;




expr:       Type '(' expr ')'                                                                                    #expr_conversion
            |   '(' expr ')'                                                                                     #expr_parenthesis
            |   'not' expr                                                                                       #expr_bool_not
            |   expr op=('=='|'<='|'<'|'>='|'>'|'!=') expr                                                       #expr_bool_comparison
            |   expr op=('*'|'/'|'//'|'%'|'**'|'\\') expr                                                             #expr_mult
            |   expr op=('+'|'-') expr                                                                           #expr_sum
            |   expr 'and' expr                                                                                  #expr_bool_and         
            |   expr op=('or'|'xor') expr                                                                        #expr_bool_or_xor
            |   'stdin' String+                                                                                  #expr_stdin
            |   Real                                                                                             #expr_real
            |   Int                                                                                              #expr_int
            |   point                                                                                            #expr_point
            |   Id                                                                                          #expr_var
            |   Bool                                                                                             #expr_bool
            |   String+                                                                                          #expr_string
            ;




Int: ('-')? [0-9]+;
Real: ('-')? ([0-9]+ ('.' [0-9]+)?);
Bool: ('true'|'false');
point: '(' expr ',' expr ')';
Color: ('red'|'orange'|'pink'|'white'|'black'|'gray'|'blue'|'cyan'|'lime'|'yellow'|'green'|ColorHex);
ColorHex: '#'[0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f];




Id: [a-zA-Z] [a-zA-Z0-9_]*;
String:  '"' ('\n' | '\t' | '\\' | ~["\\])* '"';




Comma: ';';
Newline: ('\r'? '\n') -> skip;
Comment: '%' .*? (Newline | EOF) -> skip;
Whitespace: [ \t]+ -> skip;
