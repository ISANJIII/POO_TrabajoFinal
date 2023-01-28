"
Esta clase esta relacionada con los prestamos que el usuario crea y los libros que este contiene.
	Esta clase contiene las siguientes:
    Instance Variables
	colLibro:		<Libro>
	colPrestamoActivo:		<Prestamo>
	colPrestamoInactivo:		<Prestamo>
	diasParaPrestar:		<int>
	direccion:		<string>
	identificador:		<string>
	nombre:		<string>
	nombre_Representante:		<string>
	telefono_Contacto:		<string>
cuando un usuario realiza un prestamo este pasa a una coleccion de prestamos activos y cuando lo devuelve este pasas a una coleccion de prestamo inactivos al pasar a esta coleccion se modifica la fecha del prestamo osea se modifica la fecha_entrega el cual tendra Date today. Y luego al usuario se  le enviara un mensaje para asignar un valor a fecha_multa el cual es utilizado con el Date today y sumando el diasParaPrestar.
"
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

{ #category : #propios }
Biblioteca >> aTexto [ 
|texto|.
texto :=''.
texto:='Identificador: ',identificador asString,String cr,'Direccion: ',direccion asString ,String cr,'Nombre Establecimiento: ',nombre asString,String cr,'Num Contacto: ',telefono_Contacto asString,String cr, 'Nombre Representante',nombre_Representante asString,String cr, 'Cantidad de libros registrados: ', (colLibro size)asString,String cr, 'Prestamos activo: ', (colPrestamoActivo  size)asString,String cr,'Prestamos inactivo: ', (colPrestamoInactivo size)asString,String cr,'Dias para prestar: ', diasParaPrestar ,String cr. 
^texto.
]

{ #category : #propios }
Biblioteca >> agregarLibro: unLibro [

colLibro add: unLibro  .
self changed:colLibro.


]

{ #category : #propios }
Biblioteca >> agregarPrestamo: unPrestamo [

colPrestamoActivo add: unPrestamo .
self changed:colPrestamoActivo.
]

{ #category : #propios }
Biblioteca >> biblioteca_ID: unID [

^(unID = identificador).
]

{ #category : #propios }
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

{ #category : #propios }
Biblioteca >> devolverPrestamo_Usuario: unUsuario [ 
"devuelve la instancia del prestamo que hizo el usuario"
^(colPrestamoActivo) select: [:pres| pres verEstadoUsuario: unUsuario] thenCollect: [:each | each].
]

{ #category : #propios }
Biblioteca >> eliminarLibro:unLibro [
colLibro remove:unLibro.
self changed: colLibro .
]

{ #category : #propios }
Biblioteca >> eliminarPrestamoActivo:unPrest [
"elimino un prestamo para pasarlo aun colPrestamoInactivo"
|dias|.
dias:=(diasParaPrestar)asNumber.
colPrestamoActivo remove:unPrest.
"modifico la entrega"
unPrest fechaEntrega.
(unPrest noContieneAudioLibro )ifTrue:[
	dias:=(dias/2)truncated .
	].
(unPrest getUsuarioP)agregarFechaPosibleMulta:(((unPrest getFechaPrestamo)asDate) + (dias days)).
colPrestamoInactivo add:unPrest.
self changed:colPrestamoActivo.
self changed:colPrestamoInactivo.
]

{ #category : #observadores }
Biblioteca >> getColLibro [

^colLibro.
]

{ #category : #observadores }
Biblioteca >> getId [
^identificador .
]

{ #category : #observadores }
Biblioteca >> getNombreEstablecimiento [
^nombre asString .
]

{ #category : #observadores }
Biblioteca >> getPrestamo [
^ colPrestamoActivo .
]

{ #category : #Inicializador }
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

{ #category : #propios }
Biblioteca >> metodoAux_Crear:cLibro yUsuario:unUsuario [
|nuevoPrest|.
((cLibro notEmpty ) & ((cLibro size)<=5))ifTrue:[
nuevoPrest :=Prestamo crearP_ColLibro: cLibro  yFPrest:(Date today) yUsuario: unUsuario .
self agregarPrestamo: nuevoPrest.	
	].


]

{ #category : #propios }
Biblioteca >> registrarPrestamoUsuario: unUsuario clibros: unaColLibros [ 
|instancia |.
"si devuelve true puede hacer el prestamo"
(unUsuario verMulta)ifFalse:[
	"esto deveria devolver nulo para que pueda realizar la promo"
	(colPrestamoActivo isEmpty)ifTrue:[
		self crearPrestamo_Usuario: unUsuario  yColLibro: unaColLibros .
		]ifFalse:[
		"si ver estadoUsuario es true no puede hacer prestamo"
	instancia :=((colPrestamoActivo)select:[:prest|(prest verEstadoUsuario: unUsuario)]).	
	((instancia size)=0)ifTrue:[
		self crearPrestamo_Usuario: unUsuario  yColLibro: unaColLibros .].	
		]
		].	


]

{ #category : #propios }
Biblioteca >> verUsuarioRealizoPrestamo:unUsuario [
^(((colPrestamoActivo )select:[:prest|(prest verEstadoUsuario: unUsuario)])isNotEmpty).
]
