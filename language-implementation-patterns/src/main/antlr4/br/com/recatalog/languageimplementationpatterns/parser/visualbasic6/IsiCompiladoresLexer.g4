lexer grammar IsiCompiladoresLexer;
        
 tokens {
    IDENTIFIER,
 	NUMBER
 }       
//======================================  keyword ===================================
ELSE :  E L S E ;
IF : I F ;
PRINT : P R I N T ;
THEN : T H E N ;

HASH_CHAR : '#' ;
AMP_CHAR : '&' ;
NOT_CHAR : '!' ;
PERCENT_CHAR :  '%' ;
AT_CHAR : '@' ;
DOLAR_CHAR : '$' ;

COLON_CHAR : ':' ;
SEMI_CHAR : ',' ;
SEMI_COLON_CHAR : ';' ;
DOT_CHAR :   '.' ;
LPAREN_CHAR : '(' ;
RPAREN_CHAR1 : ')' ;
EXPONENT_CHAR : '^' ;
PLUS_CHAR : '+' ;
MINUS_CHAR : '-' ;
MULT_CHAR : '*' ;
DIV_CHAR : '/' ;
MOD_CHAR : '\\' ;
EQUAL_CHAR : '=' ;
LT_CHAR : '<' ;
LE_CHAR : '<=' ;
GT_CHAR : '>' ;
GE_CHAR : '>=' ;
NOT_EQUAL : '<>' ;
PARAM_EQUALS : ':=' ;


INT : DIGIT+  {setType(NUMBER);}  ;                                     

FLOAT     : DIGIT+ '.' DIGIT*   {setType(NUMBER);};

EXPONENTIAL : DIGIT+ [Ee] [+-] DIGIT+ {setType(NUMBER);};

ID : NAME_START_CHAR NAME_CHAR* ; // {setType(IDENTIFIER);} ;

NEWLINE : '\r'? '\n' -> skip ;

WS : [ \t] -> skip ;

fragment
 LETTER : [a-zA-Z]
        | '\u00C3'  // Ã 
        | '\u00C7'  // Ç
        | '\u00D5'  // Õ    
        | '\u00E3'  // �
        | '\u00E2'  // � 
        | '\u00C2'  // �
        | '\u00F5'  // �
        | '\u00FA'  // �
        | '\u00DA'  // �                  
        | '\u00E7'  // �
        ;

fragment
 DIGIT : [0-9] ;

fragment
 NAME_CHAR : NAME_START_CHAR
	        |  DIGIT
	;

fragment
NAME_START_CHAR : [a-zA-Z_]
        | '\u00C3'  // �
        | '\u00C7'  // �
        | '\u00D5'  // �     
        | '\u00E3'  // �
        | '\u00E2'  // �
        | '\u00C2'  // �
        | '\u00F5'  // �
        | '\u00FA'  // �
        | '\u00DA'  // �                  
        | '\u00E7'  // �
        ;

// case insensitive chars
fragment A:('a'|'A');
fragment B:('b'|'B');
fragment C:('c'|'C');
fragment D:('d'|'D');
fragment E:('e'|'E');
fragment F:('f'|'F');
fragment G:('g'|'G');
fragment H:('h'|'H');
fragment I:('i'|'I');
fragment J:('j'|'J');
fragment K:('k'|'K');
fragment L:('l'|'L');
fragment M:('m'|'M');
fragment N:('n'|'N');
fragment O:('o'|'O');
fragment P:('p'|'P');
fragment Q:('q'|'Q');
fragment R:('r'|'R');
fragment S:('s'|'S');
fragment T:('t'|'T');
fragment U:('u'|'U');
fragment V:('v'|'V');
fragment W:('w'|'W');
fragment X:('x'|'X');
fragment Y:('y'|'Y');
fragment Z:('z'|'Z');