lexer grammar VisualBasic6PreDefinedLexer;

//@lexer::members {
// public static final int HIDDEN_WHITESPACE = 1;
// public static final int HIDDEN_COMMENTS = 2;
//}

options
{
	language = Java;
}

tokens {
	IDENTIFIER,
	VALUE
}

//======================================  keyword ===================================
LPAREN_CHAR : '(' ;
RPAREN_CHAR	: ')';

DOT_CHAR : '.' ;

ACCESS : A C C E S S ;
CONST : C O N S T ;
CLAZZ : C L A S S ;
ENUM : E N U M ;
LIB : L I B R A R Y ;
PARENT : P A R E N T ;
PROPERTY : P R O P E R T Y ;
REMARKS : R E M A R K S ;
SYMBOL : S Y M B O L ;
VARIABLE : V A R I A B L E ;

COMMENT1 :  '\\' (~[\n\r])*? ('\r'? '\n') -> skip
;

IDENTIFIER1 : START_IDENTIFIER_CHAR MIDDLE_IDENTIFIER_CHAR* { setType(IDENTIFIER);}
 ;

NEW_LINE1 : '\r'? '\n' -> skip
;

WS1 : [ \t]+ -> skip
;

fragment MIDDLE_IDENTIFIER_CHAR : [a-zA-Z0-9_];

fragment START_IDENTIFIER_CHAR : [a-zA-Z_];

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
