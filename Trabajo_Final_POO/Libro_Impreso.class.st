Class {
	#name : #'Libro_Impreso',
	#superclass : #Libro,
	#instVars : [
		'cantidad_Paginas'
	],
	#category : #'Trabajo_Final_POO-Modelo'
}

{ #category : #'as yet unclassified' }
Libro_Impreso class >> crearLibroImpreso_nombre:n yEditorial:ed yAnio_Edicion:aEd yCantidad_Pagina:cPag [
|libro|.
libro:=self new.
libro inicializadorLibro_nombre: n yEditorial:ed  yAnio_Edicion:aEd.
libro agregarCantidad_paginas: cPag.
^libro. 
]

{ #category : #'as yet unclassified' }
Libro_Impreso >> agregarCantidad_paginas:cantPaginas [
cantidad_Paginas:=cantPaginas . 
]
