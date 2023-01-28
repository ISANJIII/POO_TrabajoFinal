Class {
	#name : #'Realizar_Prestamo',
	#superclass : #'Opciones_Usuario',
	#instVars : [
		'botonPrestamo',
		'elegirLibro',
		'terminarElegir',
		'error'
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
		self realizarPrestamo_bibliteca: (dictionary at:(listaBInteres  selectedItem)).
	self removeMorph: botonPrestamo;removeMorph: listaBInteres .
		]
	]

]

{ #category : #initialization }
Realizar_Prestamo >> initialize [ 
super initialize .
registro position:(760@480).
self agregarBotones .

]

{ #category : #'as yet unclassified' }
Realizar_Prestamo >> realizarPrestamo_bibliteca: biblio [
|lista listaLibro prest  contadorLibro contadorAudio puedePrestamo terminarPrestamo|.
contadorLibro :=0.
contadorAudio :=0.
puedePrestamo :=true.
terminarPrestamo :=true.
"advertencias"
error:=StringMorph new.
error contents:''.
error position:self position+ (270@200).

""
prest:=Prestamo crearPFPrest:(Date today)  yUsuario:UsuarioRecibido.
"creo un Dictionary donde le paso el nombre de la biblioteca y la biblioteca a la cual corresponde el nombre" 
prest addDependent: self.
self update:(prest getColLibro).
lista :=Dictionary new.
(biblio getColLibro)do:[:libro|	lista at:(libro aTexto)put:libro].
listaLibro:=SearchMorph new.
listaLibro extent:410@60;searchList: (lista keys). 
listaLibro position:self position + (50@120).
listaLibro ghostText: 'SELECCIONA EL LIBRO A ELIMINAR'.
"boton"
elegirLibro  :=BotonAccion crearBoton_nomb: 'Agregar a Presta' yDimension:115@20  yColor: Color pink.
elegirLibro  position: self position + (370@415).
terminarElegir   :=BotonAccion crearBoton_nomb: 'Terminar' yDimension:115@20  yColor: Color pink.
terminarElegir  position: self position + (240@415).
"añadir al morph"
self addMorph:elegirLibro;addMorph:listaLibro;addMorph:terminarElegir.
"accion boton"

(biblio verUsuarioRealizoPrestamo: UsuarioRecibido )ifTrue: [  
	error contents:'EL USUARIO YA REALIZO UN PRESTAMO'.
	self addMorph:error.
	terminarPrestamo :=false.
	] ifFalse: [
	elegirLibro mouseAction: [  
		"veo el item seleccionado no es nulo"
	(listaLibro selectedItem isNotNil)ifTrue:[
		(UsuarioRecibido getTipo)ifTrue: [ 
			(((lista at:(listaLibro selectedItem )))getTipo)ifTrue: [  
				"esLibro"
				(contadorLibro >=5)ifTrue:[
					"supero el max"
					puedePrestamo :=false.
					error contents:'supero el maximo de libros'.
					]	ifFalse: [
							contadorLibro :=contadorLibro +1.				 
						 ]
				] ifFalse: [  
				"es audio libro"
				error contents:'El Libro elegido no esta disponible para Usuario no plus'.
				puedePrestamo :=false.
				]
			 ] ifFalse: [ 
			"usuario plus"
			((lista at:(listaLibro selectedItem))getTipo)ifTrue: [  
				"esLibro"
				(contadorLibro >=5)ifTrue:[
					"supero el max"
					puedePrestamo :=false. 
					error contents:'supero el maximo de libros'.
					]ifFalse: [ 
						contadorLibro :=contadorLibro +1.
					 ]
				
				] ifFalse: [  
				"es audio libro"
				(contadorAudio  >=5)ifTrue:[
					"supero el max"
					puedePrestamo :=false.
					error contents:'supero el maximo de Audiolibros'.
					]ifFalse:[
					contadorAudio :=contadorAudio +1.
					]			
				]	
			 ].
		self addMorph:error.
		(puedePrestamo)ifTrue:[
			self removeMorph:error.
   prest agregarLibroPrestamo: (lista at:(listaLibro selectedItem )).
	lista removeKey: (listaLibro  selectedItem)  . 
	listaLibro searchList: (lista keys). 
			].
		puedePrestamo :=true.

	].
].
	].

"ya elegi todos los libros"
terminarElegir mouseAction: [
	terminarPrestamo ifTrue:[
		(biblio registrarPrestamoUsuario: (prest getUsuarioP) clibros: (prest getColLibro)).
		]. 
		
				self cerrar.
		 ].



]
