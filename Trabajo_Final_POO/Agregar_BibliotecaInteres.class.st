Class {
	#name : #'Agregar_BibliotecaInteres',
	#superclass : #'Opciones_Usuario',
	#instVars : [
		'botonAgregar',
		'listaBiblioteca'
	],
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #accessing }
Agregar_BibliotecaInteres >> botonAgregar [
|lista |.
lista:=Dictionary new.
"creo un dictionary "
listaBiblioteca :=SearchMorph new.
"este dictionary va estar compuesto por bibliotecas del sistema"
(miSistema getBibliotecas)do:[:biblioteca| lista at:(biblioteca getNombreEstablecimiento  )put:biblioteca].
listaBiblioteca extent:410@60;searchList: (lista keys). 
listaBiblioteca position:40@250.
listaBiblioteca ghostText: 'SELECCIONA UNA BIBLIOTECA'.
"Accion boton"
botonAgregar :=BotonAccion crearBoton_nomb: 'AGREGAR' yDimension:100@20  yColor: Color pink.
botonAgregar position: 385@415.
"agregar a la ventana actual lo siguientes morphs"
self addMorph: listaBiblioteca.
self addMorph:botonAgregar.

botonAgregar mouseAction: [ 
	"veo si se marco una opcion"
	(listaBiblioteca selectedItem isNotNil)ifTrue:[
		usuarioRecibido agregarBibliotecaInteres: (lista at:(listaBiblioteca selectedItem)).
		lista removeKey: (listaBiblioteca selectedItem).
		listaBiblioteca searchList: (lista keys).
		]ifFalse:[
		"ya se agrego todas las biblioteca registradas en el sistema"
		self cerrar.
		].
	
	 ]


]

{ #category : #initialization }
Agregar_BibliotecaInteres >> initialize [ 

super initialize .
usuarioRecibido  addDependent:self .
self update:(usuarioRecibido getBibliotecaInteres).
self botonAgregar .
]
