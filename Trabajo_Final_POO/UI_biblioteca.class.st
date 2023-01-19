Class {
	#name : #'UI_biblioteca',
	#superclass : #VentanaO,
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #initialization }
UI_biblioteca >> initialize [ 
super initialize .
self fondoParaMiVentana:'C:\Users\asdf\Downloads\marcos\marco9.png'. 
self update: miSistema getBibliotecas .
]
