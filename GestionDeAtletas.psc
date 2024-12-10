
//función Para ingresar atletas
funcion aumento = agregarAtleta(arr,ind,cod,nomb)
	arr[ind,1] = cod
	arr[ind,2] = nomb
	aumento = ind + 1
FinFuncion

//función Para inicializar el menu
Funcion menu
	Escribir "Bienvenido al Menu"
	Escribir "------------------"
	Escribir "1) Para registro de Atletas"
	Escribir "2) Para registro de tiempos"
	Escribir "3) Ranking"
	Escribir "4) Para imprimir la información de los atletas"
	Escribir "5) Para Salir"
FinFuncion

//función Para ingresar los tiempos
funcion aumento =agregarTiempos(arr,indx,tiempo)
	arr[indx,3] = tiempo
	aumento = ind+1
FinFuncion

Algoritmo GestionDeAtletas
	num = 1
	Dimensionar atletas[num, 3]
	
	Escribir "Para elegir una opciòn digite /si/ para afirmar o /no/ para negar a menos que sea una opciòn númerica"
	Repetir
		menu()
		leer respuesta
		segun respuesta Hacer
			1: 
				//Estructura Para verificar que el código no este registrado con otro atleta o que ya esté registrado"
				repetir 
					EScribir "Dime el código del atleta y su nombre"
					leer codigo,nombre
					indx = 0
					para i = 1 hasta num con paso 1 hacer
						si(codigo = atletas[i,1]) Entonces
							indx= i 
						FinSi
					FinPara
					si(indx = 0 ) Entonces
						num = agregarAtleta(atletas,num,codigo,nombre)
						Redimensionar atletas[num,tiempos]
					SiNo
						Escribir "El atleta ya está en la base de datos"
					FinSi
					Escribir "¿Quierés ingresar otro atleta?"
					leer salida1
					salida1 = minusculas(salida1)
				Hasta Que salida1 ="no"
			2:
				//Estructura Para verificar que el código no este registrado con otro atleta o que ya esté registrado"
				repetir 
					EScribir "Dime el código del atleta"
					leer codigo
						indx = 0
						para i = 1 hasta num con paso 1+ paso hacer
							si(codigo = atletas[i,1]) Entonces
							indx= i 
							FinSi
						FinPara
						si(indx = 0 ) Entonces
							Escribir "El código no se encuentra en la base de datos"
						SiNo
							Repetir
								Escribir "Dime el tiempo que hizo el atleta"
								leer tiempo
								tiempos = agregarTiempos(atletas,indx,tiempo)
								Escribir "¿Quierés ingresar otro tiempo?"
								leer rep
								rep = Minusculas(rep)
							Hasta Que rep = "no"
						FinSi
					Escribir "¿Quierés ingresar otro atleta?"
					leer salida1
					salida1 = minusculas(salida1)
				Hasta Que salida1 ="no"
				para i = 1 hasta num con paso 1+ paso Hacer
					Escribir "1",atletas[i,tiempos-1]
				FinPara
				Escribir "1",atletas[1,tiempos-1]
		FinSegun
		
	Hasta Que respuesta = 5
	
	
FinAlgoritmo
