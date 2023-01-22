Class {
	#name : #'Acciones_Usuario',
	#superclass : #'Opciones_Usuario',
	#instVars : [
		'botonTipo',
		'botonDevolver',
		'botonAgregar',
		'botonPrestamo'
	],
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #'as yet unclassified' }
Acciones_Usuario >> agregarBotones [ 
|text1 |.
text1:='NO PLUS' .

(usuarioRecibido getTipo) ifTrue:[
	"si es verdadero es no plus"
	text1:='PLUS' 
	].
botonAgregar :=BotonAccion crearBoton_nomb: 'AGREGAR BIBLIOTECA' yDimension:400@50  yColor: Color pink.
botonTipo :=BotonAccion crearBoton_nomb: ('CAMBIAR A USUARIO ',text1) yDimension:400@50  yColor: Color pink.
botonPrestamo :=BotonAccion crearBoton_nomb: 'REALIZAR PRESTAMO' yDimension:400@50  yColor: Color pink.
botonDevolver :=BotonAccion crearBoton_nomb: 'DEVOLVER PRESTAMO' yDimension:400@50  yColor: Color pink.

botonAgregar position:50@70.
botonTipo position: botonAgregar position +(0@80).
botonPrestamo position: botonTipo position +(0@80).
botonDevolver  position: botonPrestamo position +(0@80).
self addMorph:botonAgregar.

"si es cero es porque es un usuario nuevo"
((usuarioRecibido getBibliotecaInteres)isEmpty)ifFalse:[
	self addMorph:botonTipo;addMorph:botonPrestamo;addMorph:botonDevolver
	].

botonAgregar mouseAction: [  Agregar_BibliotecaInteres crearOpcion_titulo: ('Agregar biblioteca de interes a ',usuarioRecibido getNombre)  yUsuario: usuarioRecibido.
	].
"si quiero cambiar el tipo"
botonTipo mouseAction: [
"	miSistema cambiarTipoUsuario_Usuario: usuarioRecibido ."
	
	self cerrar.
	 
		 ].
	

]

{ #category : #initialization }
Acciones_Usuario >> initialize [ 
super initialize.
self agregarBotones .
]
