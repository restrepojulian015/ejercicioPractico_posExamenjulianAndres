//Función Para Inicializar el menu
funcion menu
	Escribir "Bienvendido al menú"
	Escribir "1) Registro de Atletas"
	Escribir "2) Registro de tiempos"
	Escribir "3) Ranking"
	EScribir "4) Salir"
FinFuncion

//Función que me permite ingresar los Códigos y el segundo dato
Funcion aumentar = agregar(arr,ind,cod,nom)
	arr[ind,1] = cod
	arr[ind,2] = nom
	aumentar = ind + 1
FinFuncion

//Función Para verificar el código
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
	//num es el número con que se incia la matriz atletas que será utilizada en la opción 1 del menú
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
				//Opción uno se compone de una verificación Para saber si el código ya está y una función
				//que agregar el código y el atleta en la matriz atletas
				repetir
					Escribir "Ingresa Por favor el Código y el Nombre"
					leer cod,nom
					//Función para la verificación del código
					indx = verificacion(atletas,num,cod)
					si(indx = 0)
						//funciòn que me guarda el código y el nombre
						num = agregar(atletas,num,cod,nom)
						Redimensionar atletas[num,2]
					SiNo
						Escribir "El Código ya existe con otro usuario"
					FinSi
					Escribir"¿Quierés ingresar otro atleta?"
					leer salir
					salir = Minusculas(salir)
				Hasta Que salir = "no" 
			2:
				//Opción que me perimite agregar los tiempos a la matrix tiemposDeAtletas, guarda el código y el tiempo
				//tiempo que hizo el Atleta, si el Código no se encuentra en la matrix Atletas no te permite agregar el tiempo
				repetir 
					Escribir "Ingresa por favor el Código y luego el tiempo"
					leer cod,tiempos
					// Función para verificar que el Código este registrado
					id = verificacion(atletas,num,cod)
					si (id = 0 ) Entonces
						Escribir "El Código no se encuentra en la base Atletas, por favor crear el Código"
					SiNo
						//Función Para agregar los tiempos
						tiem = agregar(tiemposDeAtleta,tiem,cod,tiempos)
						Redimensionar tiemposDeAtleta[tiem,2]
					FinSi
					
					EScribir "¿Quierés Ingresar otro tiempo?"
					leer salir2 
					salir2 = Minusculas(salir2)
				Hasta Que salir2 = "no"
			3:
				//Opción que me permite Organizar los còdigos y los nombres según el menor tiempo
				//adicional, hace las operaciones de promedio e ingresa los valores en la matrix Ran
				Dimensionar ran[num,3]
				para i=1 hasta num con paso 1 Hacer
					//varibles Para hacer las operaciones
					dato1 = 0
					suma = 0
					division = 0
					contador = 0
					guardar = ""
					//Recorre la matrix tiemposDeAtleta buscando el Código que se encuentra
					// en la matrix atletas
					para j=1 hasta tiem con paso 1 Hacer
						si atletas[i,1] = tiemposDeAtleta[j,1] Entonces
							
							contador = contador + 1
							dato1 = ConvertirANumero(tiemposDeAtleta[j,2])
							suma = suma + dato1
						FinSi
					FinPara
					//Valida la división por cero para Evitar el error
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
					Escribir  "Código: ",ran[i,1]
					Escribir "Nombre: ",ran[i,2]
					Escribir "Tiempo Promedio: ",ran[i,3]
					
				FinPara
			De Otro Modo:
				si(respuesta < 1 o respuesta > 4) Entonces
					Escribir "Ingresa una opción correcta"
				FinSi
		FinSegun
	Hasta Que respuesta = 4
	
FinAlgoritmo