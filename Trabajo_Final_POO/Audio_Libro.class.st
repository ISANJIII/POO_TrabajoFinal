Class {
	#name : #'Audio_Libro',
	#superclass : #Libro,
	#instVars : [
		'duracion'
	],
	#category : #'Trabajo_Final_POO-Modelo'
}

{ #category : #'as yet unclassified' }
Audio_Libro class >> crearAudioLibro_nombre:n yEditorial:ed yAnio_Edicion:aEd [ 
|libro|.
libro:=self new.
libro inicializadorLibro_nombre: n yEditorial:ed  yAnio_Edicion:aEd.
libro setTipo: false.
^libro. 
]

{ #category : #toString }
Audio_Libro >> aTexto [ 
|text|.
text:=super aTexto.
text:=text,'AUDIO LIBRO',String cr.
^text.
]
