"
La clase libro esta compuesto por:

    Instance Variables
	anio_Edicion:		<string>
	editorial:		<string>
	nombre:		<string>
	tipo:		<boolean>
El cual hereda de la super-clase solo que este clase cuenta con otro atributo mas que es : 
	 Instance Variables
	duracion:		<Object>
Y la variable tipo en este tipo de instancias pasa a falso para poder diferenciar cuando se haga el prestamo.
		
Esta variable esta compuesto por 3 subclases y esta superclase corresponde a un libro fisico original osea no es lo mismo que un libro impreso. Pero cuando el usuario realiza un prestamo dependiendo del tipo de usuario que sea plus o no plus la variable de instancia cambia en AudioLibro debido a que al realizar el prestamo los libros fisico, impreso y electronico cuantan para un prestamo en cambio el AudioLibro cuenta para otro prestamo.

"
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

{ #category : #propios }
Audio_Libro >> aTexto [ 
|text|.
text:=super aTexto.
text:=text,'AUDIO LIBRO',String cr.
^text.
]
