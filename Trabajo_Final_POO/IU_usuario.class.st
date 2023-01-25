Class {
	#name : #'IU_usuario',
	#superclass : #VentanaO,
	#instVars : [
		'botonIniciarSesion',
		'botonRegistrarse'
	],
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #'as yet unclassified' }
IU_usuario >> agregarBotones [
botonIniciarSesion :=BotonAccion crearBoton_nomb: 'INICIAR SESION' yDimension:400@50  yColor: Color pink.
botonRegistrarse :=BotonAccion crearBoton_nomb: 'REGISTRARSE' yDimension:400@50  yColor: Color pink.
"POSICION Y AÑADIR AL MORPH"
self addMorph: botonIniciarSesion.
self addMorph: botonRegistrarse.
botonIniciarSesion position:50@155.
botonRegistrarse position: botonIniciarSesion position + (0@80).
"accion botones"
botonIniciarSesion mouseAction: [ IniciarSesion_Usuario crearOpcion_titulo: 'Iniciar Sesion' ySistema:  MiSistema ].
botonRegistrarse  mouseAction: [ Registrar_Usuario crearOpcion_titulo: 'Registrar usuarios' ySistema:MiSistema ].

]

{ #category : #initialization }
IU_usuario >> initialize [
super initialize.
self fondoParaMiVentana: 'C:\Users\asdf\Downloads\marcos\marco9.png'.
self agregarBotones.
]
