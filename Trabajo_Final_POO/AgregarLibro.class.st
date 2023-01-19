Class {
	#name : #AgregarLibro,
	#superclass : #VentanaO,
	#instVars : [
		'datoNombre',
		'datoEditorial',
		'datoAnioEd',
		'botonAgregar',
		'tipoLibro'
	],
	#classVars : [
		'biblioRecibida'
	],
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #'as yet unclassified' }
AgregarLibro class >> crear_BibliotecaRecibida:biblio [
biblioRecibida :=biblio .
]

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
tipoLibro extent:200@20;searchList: tipos;ghostText: 'Seleccione el tipo'.
"agrego a la ventana"
self addMorph: datoNombre  ;addMorph: datoEditorial ; addMorph: datoAnioEd;addMorph: tipoLibro .
"posicion"
datoNombre position: 50@50.
datoEditorial position: datoNombre position + (0@50).
datoAnioEd position: datoEditorial position + (0@50).
tipoLibro position: datoAnioEd position + (0@50).



]

{ #category : #'as yet unclassified' }
AgregarLibro >> agregarTitulo [
|titulo1 titulo2 titulo3 titulo4|.
titulo1 :='Ingrese el nombre' asMorph .
titulo2:='Ingrese la editorial' asMorph .
titulo3:='ingrese el Año de edicion' asMorph.
titulo4 :='Seleccione el tipo del libro' asMorph.

self addMorph:titulo1;addMorph:titulo2;addMorph:titulo3; addMorph: titulo4.

titulo1 position: datoNombre position-(0@20).
titulo2 position: datoEditorial position-(0@20).
titulo3 position: datoAnioEd  position-(0@20).
titulo4 position: tipoLibro position-(0@20).

]

{ #category : #accessing }
AgregarLibro >> botonAgregar [

|tada|.
tada:=StringMorph new.
tada contents:'hola'.

botonAgregar :=BotonAccion crearBoton_nomb: 'AGREGAR' yDimension:100@20  yColor: Color pink.
botonAgregar position: 385@415.
self addMorph:botonAgregar. 

botonAgregar mouseAction: [ 
(datoNombre isNotEmpty  & datoEditorial isNotEmpty & datoAnioEd isNotEmpty & tipoLibro isNotNil)ifTrue: [ 
	((tipoLibro selectedItem)= 'Libro fisico')ifTrue:[
		self addMorph: tada.
		]. 
	
	
	
	 ]. 
].
]

{ #category : #initialization }
AgregarLibro >> initialize [ 
super initialize.
self fondoParaMiVentana: 'C:\Users\asdf\Downloads\marcos\marco2.png'.
self agregarCampos ;agregarTitulo;botonAgregar .
]

{ #category : #'as yet unclassified' }
AgregarLibro >> recibirBiblioteca:biblio [ 
biblioRecibida :=biblio .
]
