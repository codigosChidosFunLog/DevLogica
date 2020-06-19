"""
	https://www.computrabajo.com.mx/ofertas-de-trabajo/oferta-de-trabajo-de-desarrollador-batch-exp-sistemas-abiertos-en-queretaro-601BC72F6CEBB0F761373E686DCF3405
	En una empresa solicitan Lic./Ing. en Sistemas, Computación o afín.
	con los siguientes requisitos:
	• Oracle BBDD

	• SQL y PL/SQL

	• Linux

	• Unix

	• Shell (Linux - Unix)

	• C++, Proc*C y Tuxedo V12 o anteriores

	• Visual Basic 6.0

	• Java (Frameworks) , Web Services y Micro Servicios APIs
	
	Realizar un programa que realice preguntas al usuario
	y que apartir de sus respuestas evalue si es cadidato o no
	
	(usen conjuntos)

"""

Requisitos = {
	"Oracle","SQL/PL","Linux","Unix","Shell","C++",
	"Proc*C","TuxedoV12", "VB6", "Java","WebServices","MicroServicios"
}

cumple = set()

Requiere = list(Requisitos);

print("Responda a cada requisito si lo cumple con un si, de lo contrario con un no")

def pregunta(lista):
	if not lista:
		return[]
	else:
		print(lista[0])
		ans = input().lower()
		if ans == "si":
			cumple.add(lista[0])
		pregunta(lista[1:])

pregunta(Requiere)

print("En caso de que le falten 4 requisitos o mas no sera considerado para el trabajo")

faltan = Requisitos - cumple
falta = len(faltan)
if falta < 4:
	print("Felicidades, es usted un candidato para el trabajo")
	print("Le sugerimos trabajar en los requisitos restantes, a fin de mejorar su oportunidad")
else:
	print("Lo sentimos, pero no es apto para el trabajo")
	print("A usted le faltan los siguientes requisitos")
print(faltan)


