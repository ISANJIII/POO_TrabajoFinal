Class {
	#name : #'Agregar_BibliotecaInteres',
	#superclass : #'Opciones_Usuario',
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #initialization }
Agregar_BibliotecaInteres >> initialize [ 

super initialize .
self update:(usuarioRecibido getBibliotecaInteres).
]
