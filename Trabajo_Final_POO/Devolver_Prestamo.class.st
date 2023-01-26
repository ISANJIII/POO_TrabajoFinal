Class {
	#name : #'Devolver_Prestamo',
	#superclass : #'Opciones_Usuario',
	#instVars : [
		'elegirBiblioteca',
		'botonDevolver1',
		'botonDevolver2'
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
botonDevolver1 :=BotonAccion crearBoton_nomb: 'Devolver' yDimension:100@20 yColor: Color pink.
botonDevolver2 :=BotonAccion crearBoton_nomb: 'Devolver' yDimension:100@20 yColor: Color pink.
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
|texto listaPrestamo prestamo listaPrestAudio |.
""
""
listaPrestamo:= MostrarRegistro crearRegistro_Dimension: 220@250 yPosicion: (self position+(30@60)).
listaPrestamo borderWidth: 2.
listaPrestamo borderColor: Color pink.
listaPrestAudio:= MostrarRegistro crearRegistro_Dimension: 220@250 yPosicion: (self position+(255@60)).
listaPrestAudio borderColor: Color pink.
listaPrestAudio borderWidth: 2.
"self addMorph:listaPrestamo.
self addMorph:listaPrestAudio."
texto:=StringMorph new.
texto contents:''.
texto position:(self position+(100@60)).

botonDevolver1 position:self position+(15@415).
botonDevolver2 position:self position+(385@415).
self addMorph:texto.
"veo si el usaurio realizo un prestamo en esta biblioteca"
(unaBiblio verUsuarioRealizoPrestamo: UsuarioRecibido )ifTrue:[
	"si encontro "
prestamo :=unaBiblio devolverPrestamo_Usuario: UsuarioRecibido.
(prestamo isNotEmpty) ifTrue:[
	
		listaPrestamo setText:((prestamo at:1) aTexto),String cr,'LIBROS INCLUIDOS1',String cr,(MiSistema colATexto:((prestamo at:1)getColLibro)).
			self addMorph: listaPrestamo; addMorph:botonDevolver1 .
		botonDevolver1 mouseAction: [ 
			unaBiblio eliminarPrestamoActivo: (prestamo at:1).
			self removeMorph: listaPrestamo.
			 ].		
			(prestamo size=2)ifTrue:[
		listaPrestAudio setText:((prestamo at:2) aTexto),String cr,'LIBROS INCLUIDOS',String cr,(MiSistema colATexto:((prestamo at:2)getColLibro)).
		self addMorph: listaPrestAudio; addMorph:botonDevolver2 .
		botonDevolver2 mouseAction: [ 
			unaBiblio eliminarPrestamoActivo: (prestamo at:2).
			self removeMorph: listaPrestAudio.
			 ].				
				].
	
		
		
	
			
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
