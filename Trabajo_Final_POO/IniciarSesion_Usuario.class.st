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
IniciarSesion_Usuario >> botonInciarSesion [
|titulo2 titulo1 correcto incorrecto |.
incorrecto:='Dni/contraseña incorrecto' asMorph.
correcto :='✓'asMorph.

titulo1:='Ingrese DNI' asMorph.
titulo2 :='Ingrese contraseña' asMorph.

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
	(miSistema iniciarSesion_Dni:((ingresarDni text)asString)  yContraseña:((ingresarContraseña  text)asString) )ifTrue: [self addMorph: correcto. correcto position:ingresarContraseña position + (0@80). ]ifFalse: [self addMorph: incorrecto. incorrecto position:ingresarContraseña position + (0@80).  ].].




]

{ #category : #initialization }
IniciarSesion_Usuario >> initialize [ 
super initialize.
self fondoParaMiVentana:'C:\Users\asdf\Downloads\marcos\marco3.png'.
self botonInciarSesion .

]