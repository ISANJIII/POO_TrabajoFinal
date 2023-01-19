Class {
	#name : #BotonSeleccionar,
	#superclass : #CheckboxMorph,
	#category : #'Trabajo_Final_POO-Elementos'
}

{ #category : #'as yet unclassified' }
BotonSeleccionar class >> crearBSeleccionar_Nombre: unNombre tamanio: unTamanio [

	| temp aux |
	temp := self new.
	aux := StringMorph contents: unNombre.
	temp
		label: unNombre;
		color;
		extent: 100 @ 20.
		
	^ temp
]

{ #category : #accessing }
BotonSeleccionar >> color: col [ 
labelMorph color: col.
]

{ #category : #accessing }
BotonSeleccionar >> verEstado [
"si fue seleccionado o no"
^ self buttonMorph selected
]
