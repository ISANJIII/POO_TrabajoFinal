Class {
	#name : #'Realizar_Prestamo',
	#superclass : #'Opciones_Usuario',
	#instVars : [
		'botonPrestamo',
		'elegirLibro',
		'terminarElegir'
	],
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #initialization }
Realizar_Prestamo >> agregarBotones [ 
|dictionary listaBInteres|.
"un variable que se usara para tener el nombre de las bibliotecas que este marco como interes"
dictionary :=Dictionary new.
(UsuarioRecibido getBibliotecaInteres)do:[:bInteres| dictionary at:(bInteres getNombreEstablecimiento )put:bInteres].

listaBInteres:=SearchMorph new.
listaBInteres extent:400@60;searchList: (dictionary keys). 
listaBInteres position:50@50.
listaBInteres ghostText: 'SELECCIONE LA BIBLIOTECA A REALIZAR EL PRESTAMO'.

botonPrestamo :=BotonAccion crearBoton_nomb: 'PRESTAMO' yDimension:100@20 yColor: Color pink.
botonPrestamo position: 385@415.
self addMorph:listaBInteres.
self addMorph:botonPrestamo.

(listaBInteres isNotNil)ifTrue:[
	botonPrestamo mouseAction: [  
		self removeMorph: botonPrestamo;removeMorph: listaBInteres .
	"	Biblioteca_Prestamo crearOpcion_titulo: 'biblio' yBiblioteca:(dictionary at:(listaBInteres  selectedItem))  yUsuario: UsuarioRecibido ."
		self realizarPrestamo_bibliteca: (dictionary at:(listaBInteres  selectedItem)).
	
		]
	]

]

{ #category : #initialization }
Realizar_Prestamo >> initialize [ 
super initialize .
"registro position:(760@500)."
self agregarBotones .

]

{ #category : #'as yet unclassified' }
Realizar_Prestamo >> realizarPrestamo_bibliteca: biblio [
|lista listaLibro colLibroElegidos a b|.
a:=StringMorph new.
a contents:'nulo'.
b:=StringMorph new.
b contents:'no nulo'.
"creo un Dictionary donde le paso el nombre de la biblioteca y la biblioteca a la cual corresponde el nombre" 
lista :=Dictionary new.
colLibroElegidos :=OrderedCollection new.
"colLibroElegidos :=nil."
(colLibroElegidos)ifNil:[self addMorph:a]ifNotNil: [ self addMorph:b ].

colLibroElegidos addDependent: self.
self update:colLibroElegidos.
(biblio getColLibro)do:[:libro|	lista at:(libro aTexto)put:libro].
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
	colLibroElegidos add:(lista at:(listaLibro selectedItem )).
	self changed: colLibroElegidos .
	lista removeKey: (listaLibro  selectedItem)  . 
	listaLibro searchList: (lista keys). 
	].].
""
terminarElegir mouseAction: [ 
		biblio registrarPrestamoUsuario: UsuarioRecibido clibros: colLibroElegidos .
		 ].



]
