Class {
	#name : #'Audio_Libro',
	#superclass : #Libro,
	#instVars : [
		'duracion'
	],
	#category : #'Trabajo_Final_POO-Modelo'
}

{ #category : #'as yet unclassified' }
Audio_Libro class >> crearAudioLibro_nombre:n yEditorial:ed yAnio_Edicion:aEd yDuracion:durac [
|libro|.
libro:=self new.
libro inicializadorLibro_nombre: n yEditorial:ed  yAnio_Edicion:aEd.
libro agregarDuracion: durac.
libro setTipo: false.
^libro. 
]

{ #category : #'as yet unclassified' }
Audio_Libro >> agregarDuracion:dur [
duracion:=dur.
]
