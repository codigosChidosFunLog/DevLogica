"""
# Programación  Lógica



# Modus ponendo ponens

"el modo que, al afirmar, afirma"

P → Q. P ∴ Q


Se puede encadenar usando algunas variables

P → Q. 
Q → S. 
S → T. P ∴ T

Ejercicio 
Defina una funcion que resuelva con verdadero o falso segun corresponada

Laura esta en Queretaro
Alena esta en Paris
Claudia esta en San Francisco
Queretaro esta en Mexico
Paris esta en Francia
San Francisco esta en EUA
Mexico esta en America
Francia esta en Europa
EUA esta en America

def esta(E1,E2):
	pass


print(esta("Alena","Europa"))
# true

print(esta("Laura","America"))
# true

print(esta("Laura","Europa"))
# false



"""

Base = [
	["Laura","Queretaro"],
	["Alena","Paris"],
	["Claudia","San Francisco"],
	["Queretaro","Mexico"],
	["Paris","Francia"],
	["San Francisco","EUA"],
	["Mexico","America"],
	["Francia","Europa"],
	["EUA","America"]
]

def esta(E1,E2, Base):
	if not Base:
		return False
	else:
		if E1 == Base[0][0]:
			if E2 == Base[0][1]:
				return True
			else:
				return esta(Base[0][1],E2,Base[1:])
		else:
			return esta(E1,E2,Base[1:])


print(esta("Alena","Europa",Base))

print(esta("Laura","America",Base))

print(esta("Laura","Europa",Base))
