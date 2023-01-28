"
Esta clase corresponde a un autor el cual el sistema gestor tiene conocimiento de este. 
Esta compuesto por las siguientes variables de instancia:
	Nombre.
	Apellido.

	 
"
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

{ #category : #Inicializador }
Autor >> inicializadorAutor:name yApellido:surname [
nombre:=name.
apellido := surname .

]
