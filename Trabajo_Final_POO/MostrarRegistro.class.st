Class {
	#name : #MostrarRegistro,
	#superclass : #RubScrolledTextMorph,
	#instVars : [
		'listaBibliteca'
	],
	#category : #'Trabajo_Final_POO-Elementos'
}

{ #category : #'as yet unclassified' }
MostrarRegistro class >> crearRegistro_Dimension: unaDimension yPosicion:unaPos [

	| registro |
	registro := self new.
	registro extent: unaDimension;position:unaPos;
		"solo de lectura"
		beReadOnly.
	^ registro.
]
