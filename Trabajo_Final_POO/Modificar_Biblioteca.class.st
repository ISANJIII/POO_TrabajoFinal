Class {
	#name : #'Modificar_Biblioteca',
	#superclass : #VentanaO,
	#instVars : [
		'listaBibliteca',
		'botonSeleccionar'
	],
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #'as yet unclassified' }
Modificar_Biblioteca >> botonLista [
|instancia lista|.
lista:=Dictionary new.
instancia :=(miSistema getBibliotecas).
"instancia do:[:i| lista add:(i aTexto) ]."
(miSistema getBibliotecas) do:[:i| lista at:(i getNombreEstablecimiento)put:i].

listaBibliteca:=SearchMorph new.
listaBibliteca extent:400@60;searchList: (lista keys). 
listaBibliteca position:50@50.
listaBibliteca ghostText: 'SELECCIONA LA BIBLIOTECA A MODIFICAR'.



botonSeleccionar :=BotonAccion crearBoton_nomb: 'SELECCIONAR' yDimension:100@20  yColor: Color pink.
botonSeleccionar position: 385@415.
self addMorph:listaBibliteca.
self addMorph: botonSeleccionar .

(listaBibliteca isNotNil) ifTrue:[
	botonSeleccionar mouseAction: [  
		
AgregarLibro crearOpcion_titulo:(listaBibliteca  selectedItem) yBiblioteca:(lista at:(listaBibliteca  selectedItem)).

self cerrar.			
		].
	


	].
]

{ #category : #initialization }
Modificar_Biblioteca >> initialize [ 
super initialize .
self fondoParaMiVentana: 'C:\Users\asdf\Downloads\marcos\marco2.png'.
self botonLista .
]
