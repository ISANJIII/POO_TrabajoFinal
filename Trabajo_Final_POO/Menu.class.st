Class {
	#name : #Menu,
	#superclass : #BorderedMorph,
	#instVars : [
		'titulo',
		'cerrar',
		'origen',
		'minimizar',
		'opcionA',
		'opcionB',
		'opcionC',
		'opcionD',
		'opcionE',
		'opcionF',
		'opcionG',
		'opcionH'
	],
	#classVars : [
		'miSistema'
	],
	#category : #'Trabajo_Final_POO-Modelo'
}

{ #category : #propios }
Menu >> cerrar [ 
self delete .
]

{ #category : #'as yet unclassified' }
Menu >> fondoParaMiVentana [
|fondo|.
fondo:=(Form fromFileNamed: 'C:\Users\asdf\Downloads\marcos\marco1.png') asMorph.
self extent: fondo extent.
	self addMorphBack: fondo.

]

{ #category : #initialization }
Menu >> initialize [ 

super initialize .

miSistema := Sistema_Gestor crearSistemaAUsar  .
miSistema changed.
self fondoParaMiVentana .

titulo:='MENÚ DE OPCIONES' asMorph .
"creo botones"
cerrar := BotonAccion crearBoton_nomb: ' X' yDimension: 25@25 yColor: Color white .
minimizar := BotonAccion crearBoton_nomb:' _'  yDimension:25@25   yColor:  Color white.
opcionA :=BotonAccion crearBoton_nomb: 'Agregar Bibliotecas y su material disponible' yDimension:450@40  yColor: Color white.
opcionB  :=BotonAccion crearBoton_nomb:'Registrar usuarios'  yDimension: 450@40  yColor:Color white .
opcionC :=BotonAccion crearBoton_nomb:'Solicitar Préstamo'  yDimension:450@40   yColor:Color white .
opcionD :=BotonAccion crearBoton_nomb:'Devolver Préstamo'  yDimension: 450@40  yColor:Color white .
opcionE :=BotonAccion crearBoton_nomb:'Solicitar cambio de usuario'  yDimension:450@40   yColor:Color white .
opcionF :=BotonAccion crearBoton_nomb:'agregar o eliminar elementos de la biblioteca'  yDimension: 450@40  yColor:Color white .
opcionG :=BotonAccion crearBoton_nomb: 'Ver la información de un usuario dado' yDimension:450@40   yColor:Color white .
opcionH :=BotonAccion crearBoton_nomb:'Ver la información de una biblioteca dada'  yDimension:450@40   yColor: Color white.

"añado al morph"
self addMorph: cerrar .
self addMorph:titulo.
self addMorph:minimizar.
self addMorph: opcionA .
self addMorph: opcionB .
self addMorph: opcionC .
self addMorph: opcionD .
self addMorph: opcionE .
self addMorph: opcionF .
self addMorph: opcionG .
self addMorph: opcionH .

"elijo la posicion de los botones x@y"
cerrar position: 450@13.
titulo position: 200@15.
minimizar position: cerrar position - (30@0).
opcionA position: self position + (25@40) .
opcionB position: opcionA position + (0@50) .
opcionC position: opcionB position + (0@50) .
opcionD position: opcionC position + (0@50) .
opcionE position: opcionD position + (0@50) .
opcionF position: opcionE position + (0@50) .
opcionG position: opcionF position + (0@50) .
opcionH position: opcionG position + (0@50) .
"accion de los botones"
cerrar mouseAction: [ self cerrar ].
minimizar  mouseAction: [ self minimizar  ].
opcionA mouseAction: [ Registrar_Biblioteca crearOpcion_titulo: 'Agregar Bibliotecas y su material disponible' ySistema:miSistema.
	].
opcionB mouseAction: [ Registrar_Usuario crearOpcion_titulo: 'Registrar usuarios' ySistema:miSistema].
opcionC mouseAction: [ EliminarLibro crearOpcion_titulo: 'Registrar usuarios' ySistema:miSistema].
opcionD mouseAction: [ OpcionD crearOpcion_titulo: 'Registrar usuarios' ySistema:miSistema].
opcionE mouseAction: [ Opciones_Biblioteca crearOpcion_titulo: 'Registrar usuarios' ySistema:miSistema].
opcionF mouseAction: [ OpcionF crearOpcion_titulo: 'Registrar usuarios' ySistema:miSistema].
opcionG mouseAction: [ OpcionG crearOpcion_titulo: 'Registrar usuarios' ySistema:miSistema].
opcionH mouseAction: [ OpcionH crearOpcion_titulo: 'Registrar usuarios' ySistema:miSistema].
]

{ #category : #propios }
Menu >> minimizar [
self collapse .
]
