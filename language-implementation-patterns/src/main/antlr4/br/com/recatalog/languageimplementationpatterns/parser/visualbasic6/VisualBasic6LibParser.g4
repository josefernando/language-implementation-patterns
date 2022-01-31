parser grammar VisualBasic6LibParser;

options {tokenVocab=VisualBasic6LibLexer;}

startRule : definifion+ EOF ;

definifion : lib | clasz
;

lib : LIBRARY ;

clasz : CLASS ;
