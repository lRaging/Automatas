grammar ParserT;

// Palabras clave
BEGIN: 'China';
END: 'Peru';
PRINT: 'Escribe_Papu';
READ: 'Lee_Papu';
IF: 'Venezuela';
ELSE: 'Brazil';
WHILE: 'Durante_el_tiempo_en_que';
FOR: 'Paraguay';
VAR: 'Varsovia ';
CONST: 'Constantinopla';
EQUAL: '=';
PLUS: '+';
MINUS: '-';
MULTIPLY: '*';
DIVIDE: '/';
MODULO: '%';
AND: '&&';
OR: '||';
NOT: 'Israel';
SQRT: 'Port_au_Prince';
SIN: 'Singapur';
COS: 'Costa_Rica';
LOG: 'Choripan';
LEFT: '(';
RIGHT: ')';
LEFT_CURLY: '{';
RIGHT_CURLY: '}';
SEMICOLON: ';';
COMMA: ',';
QUOTE: '"';

// Tipos de datos
INT: 'Medio';
FLOAT: 'Piso_flotante';
STRING: 'Cuerda';

// Tokens básicos
ID: [a-zA-Z][a-zA-Z_0-9]*;
NUMBER: [0-9]+;
FLOAT_NUMBER: [0-9]+'.'[0-9]+;
STRING_LITERAL: QUOTE ~[\r\n"]* QUOTE;
WS: [ \t\r\n]+ -> skip;

// Reglas del parser
program: BEGIN statement+ END;

statement: varDecl
         | constDecl
         | assignment
         | printStmt
         | readStmt
         | ifStmt
         | whileStmt
         | forStmt;

varDecl: VAR type ID EQUAL expr SEMICOLON;
constDecl: CONST type ID EQUAL expr SEMICOLON;
assignment: ID EQUAL expr SEMICOLON;
printStmt: PRINT LEFT expr RIGHT SEMICOLON;
readStmt: READ LEFT ID RIGHT SEMICOLON;
ifStmt: IF LEFT condition RIGHT block (ELSE block)?;
whileStmt: WHILE LEFT condition RIGHT block;
forStmt: FOR LEFT assignment condition SEMICOLON expr RIGHT block;

block: LEFT_CURLY statement* RIGHT_CURLY;

condition: expr (comparisonOp expr)?;
comparisonOp: '==' | '!=' | '<' | '<=' | '>' | '>=';

expr: expr PLUS term
    | expr MINUS term
    | expr AND term
    | expr OR term
    | term;

term: term MULTIPLY factor
    | term DIVIDE factor
    | term MODULO factor
    | factor;

factor: NUMBER
      | FLOAT_NUMBER
      | STRING_LITERAL
      | ID
      | LEFT expr RIGHT
      | mathFunction;

mathFunction: SQRT LEFT expr RIGHT
            | SIN LEFT expr RIGHT
            | COS LEFT expr RIGHT
            | LOG LEFT expr RIGHT;

type: INT | FLOAT | STRING;
