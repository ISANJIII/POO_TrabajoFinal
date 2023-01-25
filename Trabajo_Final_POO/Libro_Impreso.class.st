Class {
	#name : #'Libro_Impreso',
	#superclass : #Libro,
	#instVars : [
		'cantidad_Paginas'
	],
	#category : #'Trabajo_Final_POO-Modelo'
}

{ #category : #'as yet unclassified' }
Libro_Impreso class >> crearLibroImpreso_nombre:n yEditorial:ed yAnio_Edicion:aEd [ 
|libro|.
libro:=self new.
libro inicializadorLibro_nombre: n yEditorial:ed  yAnio_Edicion:aEd.
^libro. 
]

{ #category : #toString }
Libro_Impreso >> aTexto [ 
|text|.
text:=super aTexto.
text:=text,'LIBRO IMPRESO',String cr.
^text.
]
