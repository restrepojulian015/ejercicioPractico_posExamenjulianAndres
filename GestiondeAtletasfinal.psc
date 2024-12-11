//Funci�n Para Inicializar el menu
funcion menu
	Escribir "Bienvendido al men�"
	Escribir "1) Registro de Atletas"
	Escribir "2) Registro de tiempos"
	Escribir "3) Ranking"
	EScribir "4) Salir"
FinFuncion

//Funci�n que me permite ingresar los C�digos y el segundo dato
Funcion aumentar = agregar(arr,ind,cod,nom)
	arr[ind,1] = cod
	arr[ind,2] = nom
	aumentar = ind + 1
FinFuncion

//Funci�n Para verificar el c�digo
funcion indx = verificacion(arr,num,cod)
	indx = 0 
	para i=1 hasta num con paso 1 Hacer
		si cod = arr[i,1] Entonces
			indx = i
		FinSi
	FinPara
FinFuncion

//Funcion principal
Algoritmo GestiondeAtletas
	//num es el n�mero con que se incia la matriz atletas que ser� utilizada en la opci�n 1 del men�
	num = 1
	tiem = 1
	Dimensionar atletas[num,2]
	Dimensionar tiemposDeAtleta[tiem,2]
	//repetir que me perimte agregar datos o mostrar en ranking hasta que el usuario quiera salir
	repetir 
		menu()
		leer respuesta
		segun respuesta hacer
			1:
				//Opci�n uno se compone de una verificaci�n Para saber si el c�digo ya est� y una funci�n
				//que agregar el c�digo y el atleta en la matriz atletas
				repetir
					Escribir "Ingresa Por favor el C�digo y el Nombre"
					leer cod,nom
					//Funci�n para la verificaci�n del c�digo
					indx = verificacion(atletas,num,cod)
					si(indx = 0)
						//funci�n que me guarda el c�digo y el nombre
						num = agregar(atletas,num,cod,nom)
						Redimensionar atletas[num,2]
					SiNo
						Escribir "El C�digo ya existe con otro usuario"
					FinSi
					Escribir"�Quier�s ingresar otro atleta?"
					leer salir
					salir = Minusculas(salir)
				Hasta Que salir = "no" 
			2:
				//Opci�n que me perimite agregar los tiempos a la matrix tiemposDeAtletas, guarda el c�digo y el tiempo
				//tiempo que hizo el Atleta, si el C�digo no se encuentra en la matrix Atletas no te permite agregar el tiempo
				repetir 
					Escribir "Ingresa por favor el C�digo y luego el tiempo"
					leer cod,tiempos
					// Funci�n para verificar que el C�digo este registrado
					id = verificacion(atletas,num,cod)
					si (id = 0 ) Entonces
						Escribir "El C�digo no se encuentra en la base Atletas, por favor crear el C�digo"
					SiNo
						//Funci�n Para agregar los tiempos
						tiem = agregar(tiemposDeAtleta,tiem,cod,tiempos)
						Redimensionar tiemposDeAtleta[tiem,2]
					FinSi
					
					EScribir "�Quier�s Ingresar otro tiempo?"
					leer salir2 
					salir2 = Minusculas(salir2)
				Hasta Que salir2 = "no"
			3:
				//Opci�n que me permite Organizar los c�digos y los nombres seg�n el menor tiempo
				//adicional, hace las operaciones de promedio e ingresa los valores en la matrix Ran
				Dimensionar ran[num,3]
				para i=1 hasta num con paso 1 Hacer
					//varibles Para hacer las operaciones
					dato1 = 0
					suma = 0
					division = 0
					contador = 0
					guardar = ""
					//Recorre la matrix tiemposDeAtleta buscando el C�digo que se encuentra
					// en la matrix atletas
					para j=1 hasta tiem con paso 1 Hacer
						si atletas[i,1] = tiemposDeAtleta[j,1] Entonces
							
							contador = contador + 1
							dato1 = ConvertirANumero(tiemposDeAtleta[j,2])
							suma = suma + dato1
						FinSi
					FinPara
					//Valida la divisi�n por cero para Evitar el error
					si contador = 0 y suma = 0 Entonces
						division = 0 
						guardar = ConvertirATexto(division)
					SiNo
						division = suma/contador
						guardar = ConvertirATexto(division)
					FinSi
					
					ran[i,1] = atletas[i,1]
					ran[i,2] = atletas[i,2]
					ran[i,3] = guardar
				FinPara
				
				para i = 1 hasta num con paso 1 Hacer
					variable1 = 0 
					variable2 = 0
					para j = i hasta num Con Paso 1 Hacer
						variable1 = ConvertirANumero(ran[i,3])
						varible2 = ConvertirANumero(ran[j,3])
						a1 = ran[i,1]
						a2 = ran[i,2]
						a3 = ran[i,3]
						
						b1 = ran[j,1]
						b2 = ran[j,2]
						b3 = ran[j,3]
						si variable1 < variable2 Entonces
							ran[i,1] = a1
							ran[i,2] = a2
							ran[i,3] = a3
							
							ran[j,1] = b1
							ran[j,2] = b2
							ran[j,3] = b3
						SiNo
							
							ran[i,1] = b1
							ran[i,2] = b2
							ran[i,3] = b3
							
							ran[j,1] = a1
							ran[j,2] = a2
							ran[j,3] = a3
							
						FinSi
					FinPara
				FinPara
				para i = 2 hasta num 
					Escribir  "C�digo: ",ran[i,1]
					Escribir "Nombre: ",ran[i,2]
					Escribir "Tiempo Promedio: ",ran[i,3]
					
				FinPara
			De Otro Modo:
				si(respuesta < 1 o respuesta > 4) Entonces
					Escribir "Ingresa una opci�n correcta"
				FinSi
		FinSegun
	Hasta Que respuesta = 4
	
FinAlgoritmo