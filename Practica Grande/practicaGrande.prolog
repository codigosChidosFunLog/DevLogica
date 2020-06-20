% Desarrollo una gramatica bnf (como la del video) para validar una 
% direccion ipv4 asi como una mascara de red.
% https://es.wikipedia.org/wiki/M%C3%A1scara_de_red#Tabla_de_m%C3%A1scaras_de_red
% Realice la implementacion de dicha gramatica en prolog donde
% se pueda validar la cadena donde esta esa ip o mascara ejemplo

%ip("192.168.1.1").
%true.
%ip("256.168.1.1").
%false.
%maskR("255.255.255.0").
%true.
%maskR("255.255.255.1").
%false.
%maskR("255.255.0.255").
%false.

latom_lstring([],[]).
latom_lstring([F|C],R) :- latom_lstring(C,S), atom_string(F,SF), append([SF],S,R).

preparar_string(Str,LS) :-
	string(Str),
	string_chars(Str,LAC),
	latom_lstring(LAC,LS).

digito(N) :-
		N == "1"; N == "2"; N == "3"; N == "4"; N == "5";
		N == "6"; N == "7"; N == "8"; N == "9"; N == "0".

r4(N) :- N == "0"; N == "1"; N == "2"; N == "3"; N == "4".
r5(N) :- N == "0"; N == "1"; N == "2"; N == "3"; N == "4"; N == "5".

digitos_5([F|[]]) :- r5(F).

digitos([F|[]]) :- digito(F).
digitos([F|C]) :- digito(F), digitos(C).

inicio_a([F|C]) :- F == "1", digitos(C).
inicio_b([F|C]) :- 	F == "2", segundo_a(C);
					F == "2", segundo_b(C).

segundo_a([F|C]) :- F == "5", digitos_5(C).
segundo_b([F|C]) :- r4(F), digitos(C).

octeto(N) :- 	digito(N);
				string_length(N,R), R == 2, preparar_string(N,L), digitos(L);
				string_length(N,R), R == 3, preparar_string(N,L), inicio_a(L);
				string_length(N,R), R == 3, preparar_string(N,L), inicio_b(L).

octetos([F|[]]) :- octeto(F).
octetos([F|C]) :- octeto(F), octetos(C).

oct_mas1(N) :- N == "0".
oct_mas2(N) :- N == "128".
oct_mas3(N) :- N == "192".
oct_mas4(N) :- N == "224".
oct_mas5(N) :- N == "240".
oct_mas6(N) :- N == "248".
oct_mas7(N) :- N == "252".
oct_mas8(N) :- N == "254".
oct_mas9(N) :- N == "255".

octetos_mas1([F|[]]) :- oct_mas1(F).
octetos_mas1([F|C]) :- oct_mas1(F), octetos_mas1(C).

octetos_mas2([F|[]]) :- oct_mas2(F).
octetos_mas2([F|C]) :- oct_mas2(F), octetos_mas1(C).

octetos_mas3([F|[]]) :- oct_mas3(F).
octetos_mas3([F|C]) :- oct_mas3(F), octetos_mas1(C).

octetos_mas4([F|[]]) :- oct_mas4(F).
octetos_mas4([F|C]) :- oct_mas4(F), octetos_mas1(C).

octetos_mas5([F|[]]) :- oct_mas5(F).
octetos_mas5([F|C]) :- oct_mas5(F), octetos_mas1(C).

octetos_mas6([F|[]]) :- oct_mas6(F).
octetos_mas6([F|C]) :- oct_mas6(F), octetos_mas1(C).

octetos_mas7([F|[]]) :- oct_mas7(F).
octetos_mas7([F|C]) :- oct_mas7(F), octetos_mas1(C).

octetos_mas8([F|[]]) :- oct_mas8(F).
octetos_mas8([F|C]) :- oct_mas8(F), octetos_mas1(C).

octetos_mas9([F|[]]) :- oct_mas9(F).
octetos_mas9([F|C]) :- 	oct_mas9(F), octetos_mas9(C);
						oct_mas9(F), octetos_mas8(C);
						oct_mas9(F), octetos_mas7(C);
						oct_mas9(F), octetos_mas6(C);
						oct_mas9(F), octetos_mas5(C);
						oct_mas9(F), octetos_mas4(C);
						oct_mas9(F), octetos_mas3(C);
						oct_mas9(F), octetos_mas2(C);
						oct_mas9(F), octetos_mas1(C).

octetos_mas(L) :-	octetos_mas9(L);
					octetos_mas8(L);
					octetos_mas7(L);
					octetos_mas6(L);
					octetos_mas5(L);
					octetos_mas4(L);
					octetos_mas3(L);
					octetos_mas2(L);
					octetos_mas1(L).

ip(N) :- split_string(N,".","",L), octetos(L).
mascara(N) :- N == "0.".
mascara(N) :- split_string(N,".","",L), octetos_mas(L).
