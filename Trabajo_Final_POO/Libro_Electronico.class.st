Class {
	#name : #'Libro_Electronico',
	#superclass : #Libro,
	#instVars : [
		'formato'
	],
	#category : #'Trabajo_Final_POO-Modelo'
}

{ #category : #'as yet unclassified' }
Libro_Electronico class >> crearLibroElectronico_nombre:n yEditorial:ed yAnio_Edicion:aEd yFormato:form [
|libro|.
libro:=self new.
libro inicializadorLibro_nombre: n yEditorial:ed  yAnio_Edicion:aEd.
libro agregarFormato: form.
^libro. 
]

{ #category : #toString }
Libro_Electronico >> aTexto [ 
|text|.
text:=super aTexto.
text:=text,'LIBRO ELECTRONICO',String cr.
^text.
]

{ #category : #'as yet unclassified' }
Libro_Electronico >> agregarFormato:format [
formato:=format. 
]
