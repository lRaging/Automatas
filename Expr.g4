grammar Expr;

prog:   (statement NEWLINE)* ;
statement:  assignment
        |   printStatement
        |   ifStatement
        |   whileStatement
        |   forStatement
        ;

assignment: Varsovia Type ID '=' expr ';' ;

printStatement: Escribe_Papu '(' STRING ',' expr ')' ';' ;

ifStatement: Venezuela '(' expr ')' '{' statement* '}'
           | Brazil '{' statement* '}' ;

whileStatement: Durante_el_tiempo_en_que '(' expr ')' '{' statement* '}' ;

forStatement: Paraguay '(' ID '=' expr ':' expr ':' expr ')' '{' statement* '}' ;

expr:   expr ('*'|'/') expr
    |   expr ('+'|'-') expr
    |   INT
    |   ID
    |   '(' expr ')'
    ;

STRING: '"' ~("\"\r\n")* '"' ;
INT: [0-9]+ ;
ID: [a-zA-Z]+ ;
Varsovia: 'Varsovia';
Escribe_Papu: 'Escribe_Papu';
Venezuela: 'Venezuela';
Brazil: 'Brazil';
Durante_el_tiempo_en_que: 'Durante_el_tiempo_en_que';
Paraguay: 'Paraguay';
NEWLINE: [\r\n]+ ;
WS: [ \t]+ -> skip ;
