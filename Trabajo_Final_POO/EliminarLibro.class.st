Class {
	#name : #EliminarLibro,
	#superclass : #'Opciones_Biblioteca',
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #'as yet unclassified' }
EliminarLibro >> botonEliminar [
||.

]

{ #category : #'as yet unclassified' }
EliminarLibro >> elegirLibro [
||.

]

{ #category : #initialization }
EliminarLibro >> initialize [
super initialize.
biblioRe addDependent:self .
self update: (biblioRe getColLibro ).
self fondoParaMiVentana: 'C:\Users\asdf\Downloads\marcos\marco4.png'.
]
