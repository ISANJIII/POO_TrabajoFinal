Class {
	#name : #MenuPrincipal,
	#superclass : #BorderedMorph,
	#instVars : [
		'botonUsuario',
		'botonBiblioteca',
		'botonCerrar',
		'miSistema'
	],
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #'as yet unclassified' }
MenuPrincipal class >> crear [
|menu|.
menu:=self new.
menu agregarSistema: Sistema_Gestor crearSistemaAUsar.
menu openCenteredInWorld.
]

{ #category : #'as yet unclassified' }
MenuPrincipal class >> crearMenu_sistema:sis [
|menu|.
menu:=self new.
menu agregarSistema: sis.
menu openCenteredInWorld.
]

{ #category : #'as yet unclassified' }
MenuPrincipal >> agregarSistema: unSistema [
miSistema  :=unSistema.
]

{ #category : #propios }
MenuPrincipal >> cerrar [ 
self delete.
]

{ #category : #'as yet unclassified' }
MenuPrincipal >> fondoParaMiVentana [
|fondo|.
fondo:=(Form fromFileNamed: 'C:\Users\asdf\Downloads\marcos\marco1.png') asMorph.
self extent: fondo extent .
	self addMorphBack: fondo.

]

{ #category : #initialization }
MenuPrincipal >> initialize [ 

super initialize .
self fondoParaMiVentana.
self mostrarBotonesyTitulos .
]

{ #category : #'as yet unclassified' }
MenuPrincipal >> mostrarBotonesyTitulos [
|titulo|
"titulo"
titulo:='Sistema Gestor' asMorph.
"botones"
botonUsuario:=BotonAccion crearBoton_nomb: 'USUARIO' yDimension:400@50  yColor: Color pink .
botonBiblioteca:=BotonAccion crearBoton_nomb: 'BIBLIOTECA' yDimension:400@50  yColor: Color pink .
botonCerrar  := BotonAccion crearBoton_nomb: ' X' yDimension: 25@25 yColor: Color white .
"agrego al morf"
self addMorph:botonUsuario.
self addMorph: botonBiblioteca .
self addMorph: botonCerrar .
self addMorph: titulo.
"elijo una posicion"
botonCerrar position: 450@13.
botonUsuario position: 50@155.
botonBiblioteca  position: botonUsuario position + (0@80).
titulo position: 200@15.
"acciones"
botonBiblioteca mouseAction: [ IU_biblioteca   crearOpcion_titulo: 'BIBLIOTECA' ySistema: miSistema  .self cerrar.].
botonUsuario mouseAction: [IU_usuario crearOpcion_titulo: 'USUARIO' ySistema: miSistema   .self cerrar.].
botonCerrar mouseAction: [ self cerrar.].

]
