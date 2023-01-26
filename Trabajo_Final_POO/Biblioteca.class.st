Class {
	#name : #Biblioteca,
	#superclass : #Object,
	#instVars : [
		'identificador',
		'colPrestamoActivo',
		'direccion',
		'nombre',
		'telefono_Contacto',
		'nombre_Representante',
		'diasParaPrestar',
		'colLibro',
		'colPrestamoInactivo'
	],
	#category : #'Trabajo_Final_POO-Modelo'
}

{ #category : #'as yet unclassified' }
Biblioteca class >> crearBiblioteca_id: ident yDireccion: dir yNombre: nomb yTelContacto: numC yRepresentante: nomR yDiasParaPrestar: dPrestar [
|biblioteca|.
biblioteca :=self new.
biblioteca inicializadorBiblioteca_id: ident yDireccion: dir yNombre: nomb yTelContacto: numC yRepresentante: nomR yDiasParaPrestar: dPrestar.
^biblioteca .
]

{ #category : #toString }
Biblioteca >> aTexto [ 
|texto|.
texto :=''.
texto:='Identificador: ',identificador asString,String cr,'Direccion: ',direccion asString ,String cr,'Nombre Establecimiento: ',nombre asString,String cr,'Num Contacto: ',telefono_Contacto asString,String cr, 'Nombre Representante',nombre_Representante asString,String cr, 'Cantidad de libros registrados: ', (colLibro size)asString,String cr, 'Prestamos activo: ', (colPrestamoActivo  size)asString,String cr,'Prestamos inactivo: ', (colPrestamoInactivo size)asString,String cr. 
^texto.
]

{ #category : #'as yet unclassified' }
Biblioteca >> agregarLibro: unLibro [

colLibro add: unLibro  .
self changed:colLibro.


]

{ #category : #'as yet unclassified' }
Biblioteca >> agregarPrestamo: unPrestamo [

colPrestamoActivo add: unPrestamo .
self changed:colPrestamoActivo.
]

{ #category : #'as yet unclassified' }
Biblioteca >> biblioteca_ID: unID [

^(unID = identificador).
]

{ #category : #'as yet unclassified' }
Biblioteca >> crearPrestamo_Usuario: unUsuario yColLibro: unaColLibro [
|cLibro cAudioLibro|.
"separo los libros general y AudioLibro"
cLibro:=colLibro select:[:libro| libro getTipo].
cAudioLibro:=colLibro reject:[:libro| libro getTipo].
""
self metodoAux_Crear: cLibro yUsuario: unUsuario .

(unUsuario getTipo  )ifFalse:[
	"es plus"
	self metodoAux_Crear: cAudioLibro yUsuario: unUsuario .
	].


]

{ #category : #'as yet unclassified' }
Biblioteca >> devolverPrestamo_Usuario: unUsuario [ 
"devuelve la instancia del prestamo que hizo el usuario"
^(colPrestamoActivo) select: [:pres| pres verEstadoUsuario: unUsuario] thenCollect: [:each | each].
]

{ #category : #'as yet unclassified' }
Biblioteca >> eliminarLibro:unLibro [
colLibro remove:unLibro.
self changed: colLibro .
]

{ #category : #'as yet unclassified' }
Biblioteca >> eliminarPrestamoActivo:unPrest [
|dias|.
dias:=(diasParaPrestar)asNumber.
colPrestamoActivo remove:unPrest.
"modifico la entrega"
unPrest fechaEntrega.
(unPrest noContieneAudioLibro )ifTrue:[
	dias:=(dias/2)truncated .
	].
(unPrest getUsuarioP)agregarFechaPosibleMulta: (((unPrest getFechaPrestamo)asDate) + (dias days )).
colPrestamoInactivo add:unPrest.
self changed:colPrestamoActivo.
self changed:colPrestamoInactivo.
]

{ #category : #'as yet unclassified' }
Biblioteca >> getColLibro [

^colLibro.
]

{ #category : #'as yet unclassified' }
Biblioteca >> getId [
^identificador .
]

{ #category : #'as yet unclassified' }
Biblioteca >> getNombreEstablecimiento [
^nombre asString .
]

{ #category : #'as yet unclassified' }
Biblioteca >> getPrestamo [
^ colPrestamoActivo .
]

{ #category : #'as yet unclassified' }
Biblioteca >> inicializadorBiblioteca_id: ident yDireccion: dir yNombre: nomb yTelContacto: numC yRepresentante: nomR yDiasParaPrestar: dPrestar [
colLibro :=OrderedCollection new.
colPrestamoActivo :=OrderedCollection new.
colPrestamoInactivo :=OrderedCollection new.
identificador :=ident.
direccion := dir.
nombre := nomb.
telefono_Contacto := numC.
nombre_Representante := nomR .
diasParaPrestar :=dPrestar.

]

{ #category : #'as yet unclassified' }
Biblioteca >> metodoAux_Crear:cLibro yUsuario:unUsuario [
|nuevoPrest|.
((cLibro notEmpty ) & ((cLibro size)<=5))ifTrue:[
nuevoPrest :=Prestamo crearP_ColLibro: cLibro  yFPrest:(Date today) yUsuario: unUsuario .
self agregarPrestamo: nuevoPrest.	
	].


]

{ #category : #'as yet unclassified' }
Biblioteca >> registrarPrestamoUsuario: unUsuario clibros: unaColLibros [ 
|instancia booleano|.
booleano :=false.
"si devuelve true puede hacer el prestamo"
(unUsuario verMulta )ifFalse:[
	"esto deveria devolver nulo para que pueda realizar la promo"
	(colPrestamoActivo isEmpty)ifTrue:[
		self crearPrestamo_Usuario: unUsuario  yColLibro: unaColLibros .
		booleano :=	true.
		]ifFalse:[
		"si ver estadoUsuario es true no puede hacer prestamo"
	instancia :=((colPrestamoActivo)select:[:prest|(prest verEstadoUsuario: unUsuario)]).	
	((instancia size)=0)ifTrue:[
		booleano :=true.
		self crearPrestamo_Usuario: unUsuario  yColLibro: unaColLibros .].	
		]
		].	


]

{ #category : #'as yet unclassified' }
Biblioteca >> verUsuarioRealizoPrestamo:unUsuario [
^(((colPrestamoActivo )select:[:prest|(prest verEstadoUsuario: unUsuario)])isNotEmpty).
]
