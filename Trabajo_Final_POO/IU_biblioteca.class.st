Class {
	#name : #'IU_biblioteca',
	#superclass : #VentanaO,
	#instVars : [
		'bibliotecaSistema',
		'registrarBibliteca',
		'volverMenuPrincipal'
	],
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #'as yet unclassified' }
IU_biblioteca >> agregarBotones [ 

bibliotecaSistema:=BotonAccion crearBoton_nomb: 'MODIFICAR BIBLIOTECA' yDimension:400@50  yColor: Color pink.
registrarBibliteca:=BotonAccion crearBoton_nomb: 'REGISTRAR BIBLIOTECA' yDimension:400@50  yColor: Color pink.
volverMenuPrincipal:=BotonAccion crearBoton_nomb: 'VOLVER AL MENU' yDimension:100@30  yColor: Color pink.
"POSICION Y AÑADIR AL MORPH"

self addMorph: bibliotecaSistema ; addMorph: registrarBibliteca;addMorph:volverMenuPrincipal. 
registrarBibliteca position:50@155.
bibliotecaSistema position: registrarBibliteca position + (0@80).

"ACCION BOTON"

registrarBibliteca mouseAction: [ Registrar_Biblioteca crearOpcion_titulo: 'Registrar Biblioteca' ySistema: MiSistema.
	"self cerrar."  ].
bibliotecaSistema mouseAction: [ Elegir_Biblioteca crearOpcion_titulo: 'MODIFICAR BIBLIOTECA' ySistema: MiSistema .
	"self cerrar. "].
volverMenuPrincipal mouseAction: [  MenuPrincipal crearMenu_sistema:MiSistema. self cerrar].
]

{ #category : #initialization }
IU_biblioteca >> initialize [ 
super initialize .
self agregarBotones .

]
