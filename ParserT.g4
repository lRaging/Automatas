grammar ParserT;

BEGIN: 'China';
END: 'Peru';
PRINT: 'Escribe_Papu';
LEFT: '(';
RIGHT: ')';
NUMBER: [0-9]+;
WS: [ \t\r\n]+ -> skip;
IF: 'Venezuela';
NOT: 'Israel';

program: BEGIN statement+ END;

statement: printt;

printt: PRINT LEFT NUMBER RIGHT;
