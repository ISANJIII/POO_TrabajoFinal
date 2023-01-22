Class {
	#name : #'Opciones_Biblioteca',
	#superclass : #VentanaO,
	#classVars : [
		'BiblioRe'
	],
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #'as yet unclassified' }
Opciones_Biblioteca class >> crearOpcion_titulo: tit yBiblioteca: b [
|opcion|.
opcion:=self new.
opcion recibirBiblioteca: b.
opcion agregarTitulo: tit.
opcion openCenteredInWorld.
]

{ #category : #initialization }
Opciones_Biblioteca >> initialize [
super initialize.
self fondoParaMiVentana: 'C:\Users\asdf\Downloads\marcos\marco6.png'.
]

{ #category : #'as yet unclassified' }
Opciones_Biblioteca >> recibirBiblioteca:biblio [ 
BiblioRe :=biblio .
]
