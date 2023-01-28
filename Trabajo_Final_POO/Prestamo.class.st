"
Esta clase cuenta con los siguientes atributos:

    Instance Variables
	colLibro:		<Object>
	fecha_Entrega:		<Object>
	fecha_Prestamo:		<Object>
	usuarioPrestamo:		<Usuario>

Esta clase esta compuesto por la coleccion de libro que este quiere pedir como prestamo el cual solo puede ser 1-5 libros, al crear un prestamo con audio libros se crea un prestamo aparte. Un Usuario solo puede realizar un prestamo a la vez por biblioteca al mismo tiempo...A que me refiero con esto? me refiero a que si este es un usuario plus y realiza un prestamo realizado con libros y estos libros alguno son de tipo audio libro se crearan 2 prestamos solo si estos fueron pedido a la vez.
"
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

{ #category : #propios }
Prestamo >> aTexto [ 
|texto|.
texto:='Usuario prestamo: ', ((usuarioPrestamo)getNombre),String cr, 'CANTIDAD LIBRO PRESTAMO: ',(colLibro size)asString,String cr,'Fecha del prestamo: ',((fecha_Prestamo)asString),String cr,'Fecha de Entrega: ',((fecha_Entrega )asString),String cr.
^texto .
]

{ #category : #propios }
Prestamo >> agregarLibroPrestamo:unLibro [
colLibro add:unLibro.
self changed: colLibro .
]

{ #category : #propios }
Prestamo >> fechaEntrega [
fecha_Entrega :=(Date today)asString.
]

{ #category : #observadores }
Prestamo >> getColLibro [ 
^colLibro.
]

{ #category : #observadores }
Prestamo >> getFechaPrestamo [
^fecha_Prestamo .
]

{ #category : #observadores }
Prestamo >> getUsuarioP [
^usuarioPrestamo.
]

{ #category : #Inicializador }
Prestamo >> inicializadorPrestamo_UsuarioPrestamo:uPres  fecha_Prestamo:fPres [
colLibro :=OrderedCollection new.
"usuarioPrestamo:=Usuario new."
usuarioPrestamo :=uPres.
fecha_Prestamo :=fPres.
]

{ #category : #Inicializador }
Prestamo >> inicializadorPrestamo_colLibro:colL yUsuarioPrestamo:uPres  fecha_Prestamo:fPres [
colLibro :=OrderedCollection new.
usuarioPrestamo:=Usuario new.
colLibro :=colL .
usuarioPrestamo :=uPres.
fecha_Prestamo :=fPres.
]

{ #category : #propios }
Prestamo >> noContieneAudioLibro [
^colLibro anySatisfy:[:libro| libro getTipo].
]

{ #category : #propios }
Prestamo >> verEstadoUsuario: unUsuario [
"veo si el usuario se encuentra en el prestamo"
^(usuarioPrestamo  comparar_DNI:( unUsuario getDni )).
]
