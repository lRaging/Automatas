grammar ParserT;

BEGIN: 'begin';
END: 'end';
PRINT: 'print';
LEFT: '(';
RIGHT: ')';
NUMBER : [0-9]+;
WS : [ \t\r\n]+ -> skip;

program   : BEGIN statement+ END;
          
statement : printt;

printt     : PRINT LEFT NUMBER RIGHT;