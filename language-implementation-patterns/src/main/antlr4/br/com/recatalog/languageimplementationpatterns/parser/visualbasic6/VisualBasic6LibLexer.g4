lexer grammar VisualBasic6LibLexer;

ACCESS : A C C E S S ;
CLASS : C L A S S  ;
END_CLASS : E N D  WS C L A S S ;
LIBRARY : L I B R A R Y  ;
LOCATION : L O C A T I O N  ;
MEMBER_OF : M E M B E R  WS  O F ;
PROPERTY : P R O P E R T Y ;
REMARKS :  R E M A R K S   ;
SUB : S U B ;

//
ANY : A N Y ; 
BOOLEAN : B O O L E A N ;
BYTE : B Y T E ; 
COLLECTION : C O L L E C T I O N ;
DATE : D A T E  ;
DOUBLE : D O U B L E ;
INTEGER : I N T E G E R ;  
LONG :  L O N G ;
OBJECT : O B J E C T ;  
SINGLE : S I N G L E ;  
STRING : S T R I N G ;  
VARIANT : V A R I A N T ; 

LPAREN_CHAR : '(' ;
RPAREN_CHAR : ')' ;
LSQUAREBRACKET_CHAR :  '[' ;
RSQUAREBRACKET_CHAR : ']' ;
COMMA_CHAR : ',' ;

ID : NAME_START_CHAR NAME_CHAR*  ;

NEWLINE : '\r'? '\n' -> skip ;

WS : [ \t]+ { skip(); pushMode(ValueMode) ;} ; 

mode ValueMode;
NEWLINE2 : '\r'? '\n' {skip(); popMode();};

WS2 : [ \t]+ -> skip ;

VALUE : ~[\n\r]+  ;

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