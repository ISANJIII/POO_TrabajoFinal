Class {
	#name : #BotonAccion,
	#superclass : #SimpleButtonMorph,
	#instVars : [
		'bloque',
		'bloqueAccion'
	],
	#category : #'Trabajo_Final_POO-Elementos'
}

{ #category : #'as yet unclassified' }
BotonAccion class >> crearBoton_nomb:nom yDimension: dimen yColor: col [ 
|boton|.
boton:= self new.
boton inicializadorBoton_name: nom yDimension:dimen  yColor: col.
^boton .
]

{ #category : #'as yet unclassified' }
BotonAccion >> inicializadorBoton_name: nomb yDimension: dim yColor:col [

self label:nomb  .
self extent: dim.
self color: (Color pink alpha: 0.5).


]

{ #category : #'as yet unclassified' }
BotonAccion >> initialize [

super initialize.

self color:Color red.
]

{ #category : #'event handling' }
BotonAccion >> mouseAction: aBlock [
bloqueAccion  := aBlock.

]

{ #category : #'event handling' }
BotonAccion >> mouseUp: unEvento [
super mouseUp: unEvento.
bloqueAccion value.
]
