Class {
	#name : #'UI_biblioteca',
	#superclass : #VentanaO,
	#instVars : [
		'bibliotecaSistema',
		'registrarBibliteca'
	],
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #'as yet unclassified' }
UI_biblioteca >> agregarBotones [ 

bibliotecaSistema:=BotonAccion crearBoton_nomb: 'MODIFICAR BIBLIOTECA' yDimension:400@50  yColor: Color pink.
registrarBibliteca:=BotonAccion crearBoton_nomb: 'REGISTRAR BIBLIOTECA' yDimension:400@50  yColor: Color pink.

"POSICION Y AÑADIR AL MORPH"

self addMorph: bibliotecaSistema ; addMorph: registrarBibliteca .
registrarBibliteca position:50@155.
bibliotecaSistema position: registrarBibliteca position + (0@80).

"ACCION BOTON"

registrarBibliteca mouseAction: [ Registrar_Biblioteca crearOpcion_titulo: 'Registrar Biblioteca' ySistema: miSistema  ].
bibliotecaSistema mouseAction: [ Modificar_Biblioteca crearOpcion_titulo: 'MODIFICAR BIBLIOTECA' ySistema: miSistema   ].
]

{ #category : #initialization }
UI_biblioteca >> initialize [ 
super initialize .
self fondoParaMiVentana:'C:\Users\asdf\Downloads\marcos\marco9.png'. 
self agregarBotones .

]
