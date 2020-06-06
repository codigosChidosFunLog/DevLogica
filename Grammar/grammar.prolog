%
%	Gramatica
%
%	<expr> ::= <op> <numero> <numero>
%	<op> ::= '-' | '+' | '/' | '*'
%	<numero> ::= 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
%	
%	
%	ejemplo 
%	+ 1 2
%	
%	Defina en prolog un predicado que permita validar la gramatica
%	Anterior
%	
%	expr("+",1,2).
%	true.
%
%	expr("+",11,2). % falso por que esta limitado a un solo numero
%	false.
%	
%	expr("/",10,5).
%	true.
%	
%	expr("+","*",2). 
%	false.
%	
%	Hay un predicado en prolog que te verifica si un atomo es un numero
%	number(2).
%	true.
%	
%	number('+').
%	false
%
%
op(-).
op(+).
op(/).
op(*).
numero(N) :- N == 1; N == 2; N == 3; N == 4; N == 5;
			 N == 6; N == 7; N == 8; N == 9; N == 0.
expr(A,B,C) :- op(A), numero(B), numero(C).
