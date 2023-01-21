Class {
	#name : #Libro,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'editorial',
		'anio_Edicion',
		'tipo'
	],
	#category : #'Trabajo_Final_POO-Modelo'
}

{ #category : #'as yet unclassified' }
Libro class >> crearLibro_nombre:n yEditorial:ed yAnio_Edicion:aEd [
|libro|.
libro:=self new.
libro inicializadorLibro_nombre: n yEditorial:ed  yAnio_Edicion:aEd.

^libro. 
]

{ #category : #toString }
Libro >> aTexto [ 
|text|.
text:='Nombre: ', nombre asString, String cr, 'Editorial: ',editorial asString, String cr, 'Año edicion: ',(anio_Edicion asString), String cr.
^text.
]

{ #category : #'as yet unclassified' }
Libro >> getTipo [
^tipo .
]

{ #category : #'as yet unclassified' }
Libro >> inicializadorLibro_nombre:name yEditorial:editor yAnio_Edicion:anioEd [
nombre:=name.
editorial:=editor.
anio_Edicion:=anioEd.   
tipo :=true.
]

{ #category : #initialization }
Libro >> setTipo: cambioTipo [ 
tipo:=cambioTipo .

]