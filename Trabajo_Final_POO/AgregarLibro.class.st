Class {
	#name : #AgregarLibro,
	#superclass : #'Opciones_Biblioteca',
	#instVars : [
		'datoNombre',
		'datoEditorial',
		'datoAnioEd',
		'botonAgregar',
		'tipoLibro',
		'datoNombreA',
		'datoApellido',
		'botonTipo',
		'datoExtre'
	],
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #'as yet unclassified' }
AgregarLibro >> agregarCampos [ 
|tipos|.
tipos:=OrderedCollection new.
tipos add:'Libro fisico'.
tipos add:'Libro electronico'.
tipos add:'Libro impreso'.
tipos add:'Audio Libro'.

"declaro el tipo a los campos"
datoNombre:=IntroducirDato crearDialogo_tamanio: 150@10.
datoEditorial:=IntroducirDato crearDialogo_tamanio: 150@10.
datoAnioEd :=IntroducirDato crearDialogo_tamanio: 150@10.
tipoLibro :=SearchMorph new.
tipoLibro extent:140@20;searchList: tipos;ghostText: 'Seleccione el tipo'.
"agrego a la ventana"
self addMorph: datoNombre  ;addMorph: datoEditorial ; addMorph: datoAnioEd;addMorph: tipoLibro .
"posicion"
datoNombre position: self position + (50@50).
datoEditorial position: datoNombre position + (0@50).
datoAnioEd position: datoEditorial position + (0@50).
tipoLibro position: datoAnioEd position + (0@50).



]

{ #category : #'as yet unclassified' }
AgregarLibro >> agregarTitulo [
|titulo1 titulo2 titulo3 titulo4|.
titulo1 :='Ingrese el nombre' asMorph .
titulo2:='Ingrese la editorial' asMorph .
titulo3:='ingrese el Año de edicion |YYYY-MM-DD' asMorph.
titulo4 :='Seleccione el tipo del libro' asMorph.

self addMorph:titulo1;addMorph:titulo2;addMorph:titulo3; addMorph: titulo4.

titulo1 position: datoNombre position-(0@20).
titulo2 position: datoEditorial position-(0@20).
titulo3 position: datoAnioEd  position-(0@20).
titulo4 position: tipoLibro position-(0@20).

]

{ #category : #accessing }
AgregarLibro >> botonAgregar [
""
botonTipo:=BotonAccion crearBoton_nomb: '→' yDimension:20@15  yColor: Color pink.
botonTipo position: tipoLibro position +(150@2). 
botonAgregar :=BotonAccion crearBoton_nomb: 'AGREGAR' yDimension:100@20  yColor: Color pink.
botonAgregar position: 385@415.
self addMorph:botonAgregar.
self addMorph:botonTipo.

botonAgregar mouseAction: [ 
(datoNombre isNotEmpty  & datoEditorial isNotEmpty & datoAnioEd isNotEmpty & tipoLibro isNotNil)ifTrue: [
	
	(MiSistema verSiEsFecha:(datoAnioEd input) )ifTrue:[
			 "es una fecha"
	|libro|.
	((tipoLibro selectedItem)='Libro fisico')ifTrue:[
		libro:=Libro crearLibro_nombre: (datoNombre input) yEditorial:(datoEditorial input)  yAnio_Edicion: (datoAnioEd input).
	BiblioRe agregarLibro: libro.
		].	
	((tipoLibro selectedItem)= 'Libro electronico')ifTrue:[
		BiblioRe agregarLibro: (Libro_Electronico crearLibroElectronico_nombre:(datoNombre input)  yEditorial:(datoEditorial input)  yAnio_Edicion:(datoAnioEd input) ).	
		]. 
	((tipoLibro selectedItem)= 'Libro impreso')ifTrue:[
		BiblioRe agregarLibro: (Libro_Impreso crearLibroImpreso_nombre:(datoNombre input)  yEditorial:(datoEditorial input)  yAnio_Edicion:(datoAnioEd input) ).
		]. 
	((tipoLibro selectedItem)= 'Audio Libro')ifTrue:[
		BiblioRe agregarLibro: (Audio_Libro crearAudioLibro_nombre:(datoNombre input)  yEditorial:(datoEditorial input)  yAnio_Edicion:(datoAnioEd input) ) .	
		].  	
	 ]. 
"limpio"
datoNombre clear.
datoEditorial clear.
datoAnioEd clear.
		
		
		
		]ifFalse:[
		"no es una fecha"
		
		
		
		
		].
	



].
]

{ #category : #initialization }
AgregarLibro >> initialize [ 
super initialize.
BiblioRe addDependent: self.
self update: (BiblioRe getColLibro ).
self agregarCampos ;agregarTitulo;botonAgregar.

]
