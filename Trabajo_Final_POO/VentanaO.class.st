"
Esta clase cuando se crea se le tiene que pasar como parametro al contructor el titulo de esta venta y el sistema
"
Class {
	#name : #VentanaO,
	#superclass : #BorderedMorph,
	#instVars : [
		'cerrar',
		'registro',
		'listaRegistro',
		'colB'
	],
	#classVars : [
		'miSistema'
	],
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #'as yet unclassified' }
VentanaO class >> crearOpcion_titulo: tit ySistema: sistem [
|opcion|.
opcion:=self new.
opcion agregarSistema: sistem.
opcion agregarTitulo: tit.
opcion openCenteredInWorld.

]

{ #category : #'as yet unclassified' }
VentanaO class >> crearVentana_titulo: tit [ 
|opcion|.
opcion:=self new.
opcion agregarTitulo: tit.

opcion openInWorld .
]

{ #category : #'as yet unclassified' }
VentanaO >> agregarSistema: sis [
miSistema :=sis.
]

{ #category : #'as yet unclassified' }
VentanaO >> agregarTitulo: tit [

	| titulo |
	titulo := tit asMorph.
	self addMorph: titulo.
	titulo position: 200@15.
	
]

{ #category : #'as yet unclassified' }
VentanaO >> botonRegistro [ 
^ self subclassResponsibility.
]

{ #category : #propios }
VentanaO >> cerrar [ 
self delete.
]

{ #category : #'as yet unclassified' }
VentanaO >> fondoParaMiVentana:ruta [
|fondo|.
fondo:=(Form fromFileNamed: ruta) asMorph.
self extent: fondo extent.
	self addMorphBack: fondo.
]

{ #category : #initialization }
VentanaO >> initialize [ 
super initialize .
""
colB:=StringMorph new.
""
cerrar := BotonAccion crearBoton_nomb: ' X' yDimension: 25@25 yColor: Color white .
self addMorph: cerrar.
cerrar position: 450@13.
"registro de una coleccion"
registro := MostrarRegistro crearRegistro_Dimension: 220@200 yPosicion: 260@40.
registro setText:''.
registro borderWidth: 2.
registro borderColor: Color pink.
"accion de botones"
cerrar mouseAction: [ self cerrar ].
]

{ #category : #updating }
VentanaO >> update: unObjeto [
"en Smalltalk Pharo significa que un objeto se hace de solo lectura, lo que significa que su estado no se puede modificar. Una vez que un objeto se hace de solo lectura, cualquier intento de cambiar su estado generará una excepción."
registro setText:''.
(unObjeto isEmpty) ifTrue: [
	registro setText: 'Esperando datos'.]
ifFalse:[
		colB contents: (miSistema colATexto: unObjeto). 
		registro setText:(miSistema colATexto: unObjeto)asString.
		colB contents: (miSistema colATexto: unObjeto).
		
		
].
self addMorph:registro.

]
