Class {
	#name : #'Elegir_Biblioteca',
	#superclass : #VentanaO,
	#instVars : [
		'listaBibliteca',
		'botonSeleccionar'
	],
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #'as yet unclassified' }
Elegir_Biblioteca >> botonLista [
|lista|.
"creo un diccionario y va estar compuesto por el nombre de la biblioteca y la instancia de la biblioteca"
lista:=Dictionary new.

(miSistema getBibliotecas) do:[:biblioteca| lista at:(biblioteca getNombreEstablecimiento)put:biblioteca].

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
|vent |.
(lista at:(listaBibliteca  selectedItem)) changed.
vent:=AgregarLibro crearOpcion_titulo:(listaBibliteca  selectedItem) yBiblioteca:(lista at:(listaBibliteca  selectedItem)).
        self cerrar.
        ].
    ].
]

{ #category : #initialization }
Elegir_Biblioteca >> initialize [ 
super initialize .
self fondoParaMiVentana: 'C:\Users\asdf\Downloads\marcos\marco2.png'.
self botonLista .
]
