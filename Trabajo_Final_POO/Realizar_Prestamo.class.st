Class {
	#name : #'Realizar_Prestamo',
	#superclass : #'Opciones_Usuario',
	#instVars : [
		'botonPrestamo',
		'elegirLibro',
		'terminarElegir',
		'errorMulta',
		'errorUsuario',
		'errorMax',
		'errorMaxAudio'
	],
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #'as yet unclassified' }
Realizar_Prestamo >> agregarAdvertencia [
errorMulta:=StringMorph new .
errorUsuario:=StringMorph new .
errorMax:=StringMorph new .
errorMaxAudio :=StringMorph new .
errorMulta contents:'El usuario se encuentra con una multa'.
errorUsuario contents:'El libro es solo para los usuario plus'.
errorMax contents:'Supero el limite'.
errorMaxAudio contents:'Supero el limite de audioLibro'.
"posicion"
errorMulta position:(760@500)+ (40@0).
]

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
registro position:(760@500).
self agregarBotones .

]

{ #category : #'as yet unclassified' }
Realizar_Prestamo >> realizarPrestamo_bibliteca: biblio [
|lista listaLibro prest|.

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
elegirLibro  position: self position + (360@415).

terminarElegir   :=BotonAccion crearBoton_nomb: 'Terminar' yDimension:115@20  yColor: Color pink.
terminarElegir  position: self position + (250@415).


"añadir al morph"
self addMorph:elegirLibro;addMorph:listaLibro;addMorph:terminarElegir.
"accion boton"
elegirLibro mouseAction: [  
		"veo el item seleccionado no es nulo"
	(listaLibro selectedItem isNotNil)ifTrue:[
		
		"(UsuarioRecibido getTipo)ifTrue:[
			
			((listaLibro selectedItem )getTipo)
			
			]ifFalse:[
			
			
		
			]."
		
		prest agregarLibroPrestamo: (lista at:(listaLibro selectedItem )).
	lista removeKey: (listaLibro  selectedItem)  . 
	listaLibro searchList: (lista keys). 
	
	
	
	].
].
terminarElegir mouseAction: [ 
		"(biblio registrarPrestamoUsuario: (prest getUsuarioP) clibros: (prest getColLibro))ifTrue:["
			biblio agregarPrestamo: prest .
			
		"	]ifFalse:[
			""puede ser que el usuario tenga una multa o bien este tenga en la coleccion de libros prestamos tenga mas de 5 libros o tiene un audio libro siendo este un usuario normal""
			]."
		 ].



]
