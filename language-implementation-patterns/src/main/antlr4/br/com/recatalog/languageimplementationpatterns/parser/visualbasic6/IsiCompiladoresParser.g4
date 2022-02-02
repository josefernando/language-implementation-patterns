parser grammar IsiCompiladoresParser;

options {tokenVocab=IsiCompiladoresLexer;}

startRule : stat EOF
;

stat: cmd+ EOF
;

cmd:   cmdIf
       | cmdPrint 
       | endOfCmd
;

cmdIf : // IF expr THEN cmd ELSE cmd endOfCmd
       // | IF expr THEN endOfCmd+ (block | else ) endOfCmd
        IF expr THEN ( cmd ELSE cmd | endOfCmd+ blockif blockElse* ) endOfCmd
; 

cmdPrint : PRINT endOfCmd*
;

blockif : block
;

blockElse : ELSE endOfCmd+ block
;

block :      cmd+
;

expr :
	ID
	| NUMBER
;


endOfCmd :
NEWLINE
;