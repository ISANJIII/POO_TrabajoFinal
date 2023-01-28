Class {
	#name : #'Modificar_bibliteca',
	#superclass : #'Opciones_Biblioteca',
	#instVars : [
		'botonAgregar',
		'botonEliminar'
	],
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #'as yet unclassified' }
Modificar_bibliteca >> agregarBotones [

	botonAgregar := BotonAccion
		                crearBoton_nomb: 'AGREGAR LIBROS A LA BIBLIOTECA'
		                yDimension: 400 @ 50
		                yColor: Color pink.
	botonEliminar := BotonAccion
		                 crearBoton_nomb: 'ELIMINAR LIBROS DE LA BIBLIOTECA'
		                 yDimension: 400 @ 50
		                 yColor: Color pink.
	"POSICION Y AÑADIR AL MORPH"
	self
		addMorph: botonAgregar;
		addMorph: botonEliminar.
	botonAgregar position: 50 @ 155.
	botonEliminar position: botonAgregar position + (0 @ 80).

	"ACCION BOTON"

	botonAgregar mouseAction: [ 
		AgregarLibro
			crearOpcion_titulo: BiblioRe getNombreEstablecimiento
			yBiblioteca: BiblioRe ].
	self cerrar.
	botonEliminar mouseAction: [ 
		EliminarLibro
			crearOpcion_titulo: BiblioRe getNombreEstablecimiento
			yBiblioteca: BiblioRe.

		self cerrar ]
]

{ #category : #initialization }
Modificar_bibliteca >> initialize [ 
super initialize .
self agregarBotones .
]
