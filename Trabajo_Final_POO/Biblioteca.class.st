Class {
	#name : #Biblioteca,
	#superclass : #Object,
	#instVars : [
		'identificador',
		'colPrestamo',
		'direccion',
		'nombre',
		'telefono_Contacto',
		'nombre_Representante',
		'diasParaPrestar',
		'colLibro'
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
texto:='Identificador: ',identificador asString,String cr,'Direccion: ',direccion asString ,String cr,'Nombre Establecimiento: ',nombre asString,String cr,'Num Contacto: ',telefono_Contacto asString,String cr, 'Nombre Representante',nombre_Representante asString,String cr, 'Cantidad de libros registrados: ', (colLibro size)asString,String cr, 'Cantidad de prestamos: ', (colPrestamo  size)asString,String cr. 
^texto .
]

{ #category : #'as yet unclassified' }
Biblioteca >> agregarLibro: unLibro [

colLibro add: unLibro  .
self changed:colLibro.


]

{ #category : #'as yet unclassified' }
Biblioteca >> agregarPrestamo: unPrestamo [

colPrestamo add: unPrestamo .
self changed:colPrestamo.
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
Biblioteca >> eliminarLibro:unLibro [
colLibro remove:unLibro.
self changed: colLibro .
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
^ colPrestamo .
]

{ #category : #'as yet unclassified' }
Biblioteca >> inicializadorBiblioteca_id: ident yDireccion: dir yNombre: nomb yTelContacto: numC yRepresentante: nomR yDiasParaPrestar: dPrestar [
colLibro :=OrderedCollection new.
colPrestamo :=OrderedCollection new.
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
	(colPrestamo isEmpty)ifTrue:[
		self crearPrestamo_Usuario: unUsuario  yColLibro: unaColLibros .
		booleano :=	true.
		]ifFalse:[
		"si ver estadoUsuario es true no puede hacer prestamo"
	instancia :=((colPrestamo)select:[:prest|(prest verEstadoUsuario: unUsuario)]).	
	((instancia size)=0)ifTrue:[
		booleano :=true.
		self crearPrestamo_Usuario: unUsuario  yColLibro: unaColLibros .].	
		]
		].	


]

{ #category : #'as yet unclassified' }
Biblioteca >> verUsuarioRealizoPrestamo:unUsuario [
^(((colPrestamo)select:[:prest|(prest verEstadoUsuario: unUsuario)])isNotEmpty).
]
