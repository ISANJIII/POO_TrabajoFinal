Class {
	#name : #EliminarLibro,
	#superclass : #'Opciones_Biblioteca',
	#instVars : [
		'botonEliminar',
		'listaLibro'
	],
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #'as yet unclassified' }
EliminarLibro >> botonEliminar [
|lista texto|.
texto:=StringMorph new.
texto contents:'*SI TODOS LOS LIBROS YA FUERON ELIMINADOS SE CIERRA LA VENTANA'.
"creo un Dictionary donde le paso el nombre de la biblioteca y la biblioteca a la cual corresponde el nombre"
lista :=Dictionary new.
(biblioRe getColLibro)do:[:libro|	lista at:(libro aTexto)put:libro].
	listaLibro:=SearchMorph new.
listaLibro extent:410@60;searchList: (lista keys). 
listaLibro position:40@250.
listaLibro ghostText: 'SELECCIONA EL LIBRO A ELIMINAR'.
"ACCION BOTON"
botonEliminar :=BotonAccion crearBoton_nomb: 'ELIMINAR' yDimension:100@20  yColor: Color pink.
botonEliminar position: 385@415.
texto position: botonEliminar position - (370@30).
"agregar a la ventana actual lo siguientes morphs"
self addMorph: botonEliminar .
self addMorph: listaLibro .
self addMorph:texto.

botonEliminar mouseAction: [
	
	(listaLibro selectedItem isNotNil)ifTrue:[
		"veo el item seleccionado no es nulo"
	
	biblioRe eliminarLibro: (lista at:(listaLibro  selectedItem)).
	lista removeKey: (listaLibro  selectedItem)  . 
	listaLibro searchList: (lista keys). 
	]ifFalse:[
	"es nulo"
   self delete.
	].	
	].



]

{ #category : #initialization }
EliminarLibro >> initialize [
super initialize.
self fondoParaMiVentana: 'C:\Users\asdf\Downloads\marcos\marco4.png'.
biblioRe addDependent:self .
self update: (biblioRe getColLibro ).
self botonEliminar .

]
