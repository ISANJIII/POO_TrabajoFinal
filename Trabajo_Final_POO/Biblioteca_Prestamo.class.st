Class {
	#name : #'Biblioteca_Prestamo',
	#superclass : #'Opciones_Biblioteca',
	#instVars : [
		'elegirLibro',
		'terminarElegir'
	],
	#classVars : [
		'UsuarioPres'
	],
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #'as yet unclassified' }
Biblioteca_Prestamo class >> crearOpcion_titulo: tit yBiblioteca: b yUsuario:u [
|opcion|.
opcion:=self new.
UsuarioPres :=u.
BiblioRe :=b.
opcion agregarTitulo: tit.
opcion openCenteredInWorld.
]

{ #category : #initialization }
Biblioteca_Prestamo >> initialize [ 
super initialize.
self realizarPrestamo_bibliteca .
]

{ #category : #'as yet unclassified' }
Biblioteca_Prestamo >> realizarPrestamo_bibliteca [
|lista listaLibro colLibroElegidos  |.
"creo un Dictionary donde le paso el nombre de la biblioteca y la biblioteca a la cual corresponde el nombre" 
self update:(BiblioRe getPrestamo) .
lista :=Dictionary new.
colLibroElegidos :=OrderedCollection new.
(BiblioRe getColLibro)do:[:libro|	lista at:(libro aTexto)put:libro].
listaLibro:=SearchMorph new.
listaLibro extent:410@60;searchList: (lista keys). 
listaLibro position:self position + (50@120).
listaLibro ghostText: 'SELECCIONA EL LIBRO A ELIMINAR'.
"boton"
elegirLibro  :=BotonAccion crearBoton_nomb: 'Agregar a Presta' yDimension:115@20  yColor: Color pink.
elegirLibro  position: self position + (360@415).

terminarElegir   :=BotonAccion crearBoton_nomb: 'Terminar' yDimension:115@20  yColor: Color pink.
terminarElegir  position: self position + (250@415).


"añadir al morph"
self addMorph:elegirLibro;addMorph:listaLibro;addMorph:terminarElegir.
"accion boton"
elegirLibro mouseAction: [  
		"veo el item seleccionado no es nulo"
	(listaLibro selectedItem isNotNil)ifTrue:[
	colLibroElegidos add:(lista at:( listaLibro selectedItem )).
	lista removeKey: (listaLibro  selectedItem)  . 
	listaLibro searchList: (lista keys). 
	].].
""
terminarElegir mouseAction: [ 
		BiblioRe registrarPrestamoUsuario: UsuarioPres  clibros: colLibroElegidos .
		 ].

]
