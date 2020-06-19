%Ejercicio String prolog

%Es simple realicen el analizador léxico que realice en los ultimos
%dos videos

latom_lstring([],[]).
latom_lstring([F|C],R) :- latom_lstring(C,S), atom_string(F,SF), append([SF],S,R).

preparar_string(Term,LS) :-
	atom(Term),
	atom_string(Term,Str),
	preparar_string(Str,LS).

preparar_string(Str,LS) :-
	string(Str),
	string_chars(Str,LAC),
	latom_lstring(LAC,LS).

digito(N) :-
			N == "1"; N == "2"; N == "3"; N == "4"; N == "5";
			N == "6"; N == "7"; N == "8"; N == "9"; N == "0".

digitos([F|[]]) :- digito(F).
digitos([F|C]) :- digito(F), digitos(C).

signo("+").
signo("-").
operador("/").
operador("*").
operador(O) :- signo(O).

numerosing([F|C]) :- signo(F), digitos(C).
numerosing([F|C]) :- digitos([F|C]).

secuencianum([F|[]]) :- preparar_string(F,LS), numerosing(LS).
secuencianum([F|C]) :- preparar_string(F,LS), numerosing(LS), secuencianum(C).

operacion([F|C]) :- operador(F), secuencianum(C).

abre_parentesis(["("|_]).
cierra_parentesis([_|C]) :- append(_,[")"],C).

expresion([F|C]) :- abre_parentesis([F|_]),
				cierra_parentesis([_|C]),
				append(OP,[_],C),
				operacion(OP).
