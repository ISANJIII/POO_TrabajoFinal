Class {
	#name : #'IniciarSesion_Usuario',
	#superclass : #VentanaO,
	#instVars : [
		'botonSesion',
		'ingresarDni',
		'ingresarContraseña'
	],
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #'as yet unclassified' }
IniciarSesion_Usuario >> agregarBotones [
|titulo2 titulo1 correcto incorrecto lista|.
lista:=Dictionary new.
(MiSistema getColUsuario)do:[:usuario| lista at:(usuario getDni)put:usuario].

incorrecto :=StringMorph new.
correcto :=StringMorph new.
titulo1:=StringMorph new.
titulo2 :=StringMorph new.

incorrecto contents:'Dni/contraseña incorrecto'.
correcto  contents:'✓'.
titulo1  contents:'Ingrese DNI'.
titulo2 contents:'Ingrese contraseña'.

 botonSesion :=BotonAccion crearBoton_nomb: 'INICIAR SESION' yDimension:100@20  yColor:Color pink. 
 botonSesion  position:385@415.

ingresarDni :=IntroducirDato crearDialogo_tamanio: 140@45.
ingresarContraseña := IntroducirDato crearDialogo_tamanio: 140@45.

self addMorph:ingresarDni; addMorph: ingresarContraseña ; addMorph:  botonSesion; addMorph: titulo1; addMorph: titulo2.

ingresarDni position: 50@155.
ingresarContraseña position: ingresarDni position + (0@80).
titulo1 position:ingresarDni position - (0@30).
titulo2 position:ingresarContraseña position - (0@30).

botonSesion mouseAction: [
	(MiSistema iniciarSesion_Dni:(ingresarDni input )  yContraseña:(ingresarContraseña input )) ifTrue: [
		"pudo ingresar a su cuenta"
Acciones_Usuario crearOpcion_titulo:'Opciones' yUsuario: (MiSistema devolverUsuario_dni:(ingresarDni input) ).
		self cerrar.
		]ifFalse: [
		self addMorph: incorrecto.
		incorrecto position:ingresarContraseña position + (0@80).  
		].
].







]

{ #category : #initialization }
IniciarSesion_Usuario >> initialize [ 
super initialize.
self agregarBotones .

]
