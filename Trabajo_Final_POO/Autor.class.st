Class {
	#name : #Autor,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'apellido'
	],
	#category : #'Trabajo_Final_POO-Modelo'
}

{ #category : #'as yet unclassified' }
Autor class >> crearAutor_nombre: nomb yApellido: ape [
|autor|.
autor:= self new.
autor inicializadorAutor: nomb yApellido: ape.
^autor.
]

{ #category : #Visualizadores }
Autor >> getNombre [ 
^nombre .
]

{ #category : #'as yet unclassified' }
Autor >> inicializadorAutor:name yApellido:surname [
nombre:=name.
apellido := surname .

]
