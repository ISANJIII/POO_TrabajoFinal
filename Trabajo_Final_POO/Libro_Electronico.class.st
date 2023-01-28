"
La clase libro esta compuesto por:

    Instance Variables
	anio_Edicion:		<string>
	editorial:		<string>
	nombre:		<string>
	tipo:		<boolean>
El cual hereda de la super-clase solo que este clase cuenta con otro atributo mas que es : 
	 Instance Variables
	formato:		<Object>
		
Esta variable esta compuesto por 3 subclases y esta superclase corresponde a un libro fisico original osea no es lo mismo que un libro impreso. Pero cuando el usuario realiza un prestamo dependiendo del tipo de usuario que sea plus o no plus la variable de instancia cambia en AudioLibro debido a que al realizar el prestamo los libros fisico, impreso y electronico cuantan para un prestamo en cambio el AudioLibro cuenta para otro prestamo.



"
Class {
	#name : #'Libro_Electronico',
	#superclass : #Libro,
	#instVars : [
		'formato'
	],
	#category : #'Trabajo_Final_POO-Modelo'
}

{ #category : #'as yet unclassified' }
Libro_Electronico class >> crearLibroElectronico_nombre:n yEditorial:ed yAnio_Edicion:aEd [ 
|libro|.
libro:=self new.
libro inicializadorLibro_nombre: n yEditorial:ed  yAnio_Edicion:aEd.
^libro. 
]

{ #category : #propios }
Libro_Electronico >> aTexto [ 
|text|.
text:=super aTexto.
text:=text,'LIBRO ELECTRONICO',String cr.
^text.
]
