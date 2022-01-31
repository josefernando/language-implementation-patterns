parser grammar IsiCompiladoresParser;

options {tokenVocab=IsiCompiladoresLexer;}

startRule : stat EOF
;

stat: cmds
;

cmds :   cmdIf
       | cmdPrint
;

cmdIf : IF expr THEN block (ELSE block )* 
;

cmdPrint : PRINT
;

block :
      cmds+
;

expr :
	ID
	| NUMBER
;