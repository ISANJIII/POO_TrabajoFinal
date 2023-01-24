Class {
	#name : #Prestamo,
	#superclass : #Object,
	#instVars : [
		'colLibro',
		'usuarioPrestamo',
		'fecha_Entrega',
		'fecha_Prestamo'
	],
	#category : #'Trabajo_Final_POO-Modelo'
}

{ #category : #'as yet unclassified' }
Prestamo class >> crearPFPrest:fecha yUsuario: usuario [
|prest|.
prest:=self new.
prest inicializadorPrestamo_UsuarioPrestamo:usuario  fecha_Prestamo:fecha.
^prest.

]

{ #category : #'as yet unclassified' }
Prestamo class >> crearP_ColLibro:cLibro yFPrest:fecha yUsuario: usuario [
|prest|.
prest:=self new.
prest inicializadorPrestamo_colLibro:cLibro yUsuarioPrestamo:usuario fecha_Prestamo:fecha.
^prest.

]

{ #category : #toString }
Prestamo >> aTexto [ 
|texto|.
texto:='Usuario prestamo: ', ((usuarioPrestamo)getNombre),String cr, 'CANTIDAD LIBRO PRESTAMO: ',(colLibro size)asString,String cr,'Fecha del prestamo: ',((fecha_Prestamo)asString),String cr   .
^texto .
]

{ #category : #'as yet unclassified' }
Prestamo >> agregarLibroPrestamo:unLibro [
colLibro add:unLibro.
self changed: colLibro .
]

{ #category : #'as yet unclassified' }
Prestamo >> getColLibro [ 
^colLibro.
]

{ #category : #'as yet unclassified' }
Prestamo >> getUsuarioP [
^usuarioPrestamo.
]

{ #category : #'as yet unclassified' }
Prestamo >> inicializadorPrestamo_UsuarioPrestamo:uPres  fecha_Prestamo:fPres [
colLibro :=OrderedCollection new.
"usuarioPrestamo:=Usuario new."
usuarioPrestamo :=uPres.
fecha_Prestamo :=fPres.
]

{ #category : #'as yet unclassified' }
Prestamo >> inicializadorPrestamo_colLibro:colL yUsuarioPrestamo:uPres  fecha_Prestamo:fPres [
colLibro :=OrderedCollection new.
usuarioPrestamo:=Usuario new.
colLibro :=colL .
usuarioPrestamo :=uPres.
fecha_Prestamo :=fPres.
]

{ #category : #'as yet unclassified' }
Prestamo >> verEstadoUsuario: unUsuario [
"veo si el usuario se encuentra en el prestamo"
^(usuarioPrestamo  puedeRealizarPrestamo:( unUsuario getDni )).
]
