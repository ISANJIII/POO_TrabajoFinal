Class {
	#name : #'Devolver_Prestamo',
	#superclass : #'Opciones_Usuario',
	#instVars : [
		'elegirBiblioteca',
		'botonDevolver'
	],
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #initialization }
Devolver_Prestamo >> buscarBiblioteca [ 
|dicBiblio listaBInteres|.
"un variable que se usara para tener el nombre de las bibliotecas que este marco como interes"
dicBiblio :=Dictionary new.
(UsuarioRecibido getBibliotecaInteres)do:[:bInteres| dicBiblio at:(bInteres getNombreEstablecimiento )put:bInteres].

listaBInteres:=SearchMorph new.
listaBInteres extent:400@60;searchList: (dicBiblio keys). 
listaBInteres position:50@50.
listaBInteres ghostText: 'SELECCIONE LA BIBLIOTECA A DEVOLVER PRESTAMO'.

elegirBiblioteca:=BotonAccion crearBoton_nomb: 'PRESTAMO' yDimension:100@20 yColor: Color pink.
elegirBiblioteca position: 385@415.
botonDevolver :=BotonAccion crearBoton_nomb: 'Devolver' yDimension:100@20 yColor: Color pink.

self addMorph:listaBInteres;addMorph:elegirBiblioteca.

(listaBInteres isNotNil)ifTrue:[
	
	elegirBiblioteca mouseAction: [  
		self devolverPrestamo_Biblioteca: (dicBiblio at:(listaBInteres  selectedItem)).
		self removeMorph: elegirBiblioteca;removeMorph: listaBInteres.
		]
	
	].
]

{ #category : #'as yet unclassified' }
Devolver_Prestamo >> devolverPrestamo_Biblioteca:unaBiblio [
|texto listaPrestamo prestamo |.
""

""
listaPrestamo:= MostrarRegistro crearRegistro_Dimension: 300@250 yPosicion: (self position+(100@60)).
listaPrestamo borderWidth: 2.
texto:=StringMorph new.
texto contents:''.
texto position:(self position+(100@60)).
self addMorph:botonDevolver.
botonDevolver position:self position+(385@415).
self addMorph:texto.
"veo si el usaurio realizo un prestamo en esta biblioteca"
(unaBiblio verUsuarioRealizoPrestamo: UsuarioRecibido )ifTrue:[
	"si encontro "
prestamo :=unaBiblio devolverPrestamo_Usuario: UsuarioRecibido.
listaPrestamo borderColor: Color pink.
listaPrestamo setText:(prestamo aTexto),String cr,'LIBROS INCLUIDOS',String cr,(MiSistema colATexto:(prestamo getColLibro)).
	self addMorph:listaPrestamo.
	"accion botonDevolver"
 botonDevolver mouseAction: [  
	unaBiblio eliminarPrestamoActivo: prestamo .
	self cerrar.
	].	
	
	
	
	]ifFalse:[
	texto contents:'EL USUARIO NO REALIZO EL PRESTAMO EN ESTA BIBLIOTECA'.
	self addMorph:texto.
	].



]

{ #category : #initialization }
Devolver_Prestamo >> initialize [ 
super initialize.
self buscarBiblioteca .
]
