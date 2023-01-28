"
Esta clase esta compuesto por:
    Instance Variables
	apellido:		<string>
	colBibibliotecaInter:		<Biblitoca>
	contraseña:		<string>
	dni:		<string>
	fechaMulta:		<Date>
	nombre:		<string>
	tipoUsuario:		<boolean>
para los usuarios no plus el tipo usuario es true.


"
Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'colBibibliotecaInter',
		'nombre',
		'fechaMulta',
		'apellido',
		'tipoUsuario',
		'dni',
		'contraseña'
	],
	#category : #'Trabajo_Final_POO-Modelo'
}

{ #category : #'as yet unclassified' }
Usuario class >> crearU_nombre: nomb yApellido:ape yDni:numDni yContraseña:pass [
|usuario|.
usuario :=self new.
usuario inicializadorUsuario_nombre: nomb yApellido:ape yDni:numDni yContraseña:pass.
usuario cambiarTipo: true.
^usuario .
]

{ #category : #propios }
Usuario >> aTexto [
|texto tipo a b|.
tipo:='USUARIO PLUS'.
a:=self verMulta.
(a)ifTrue:[b:='tiene multa'.]ifFalse: [b:='no tiene multa'].
tipoUsuario ifTrue: [ tipo:='USUARIO NO PLUS' ].
texto:='Nombre: ',nombre asString,String cr,'Apellido: ',apellido asString ,String cr,'DNI: ',dni asString,String cr,tipo ,String cr,'Cantidad de Bibliotecas Agregadas: ',(colBibibliotecaInter size)asString,String cr,'Fecha para la posible entrega:', fechaMulta asString ,String cr, b,String cr. 
^texto . 
]

{ #category : #propios }
Usuario >> actualizarColBiblioteca: unaCol [
"esto lo hago para cuando hago un cambio de usuario este mantenga la misma coleccion de biblioteca que tuvo interes"
colBibibliotecaInter:=unaCol .

]

{ #category : #propios }
Usuario >> agregarBibliotecaInteres:unaBiblio [
colBibibliotecaInter add:unaBiblio.
self changed:colBibibliotecaInter.

]

{ #category : #propios }
Usuario >> agregarFechaPosibleMulta:unaFecha [
fechaMulta :=unaFecha asDate.
]

{ #category : #propios }
Usuario >> buscarUsuario_Dni: num yContraseña: password [ 

^ (((dni)=num)&((contraseña)=password)). 
]

{ #category : #propios }
Usuario >> cambiarTipo: tipoU [
tipoUsuario :=tipoU .
self changed.
]

{ #category : #propios }
Usuario >> comparar_DNI: numDni [
|realizoPrest|.
realizoPrest :=false.
"este metodo se usa para saber si el numDni que viene por parametro que se lo envia la clase prestamo es igual al dni del usuario... osea si es igual es porque ya realizo un prestamo"
(dni = numDni )ifTrue: [ realizoPrest :=true ].
^realizoPrest .

]

{ #category : #Visualizadores }
Usuario >> getApellido [
^apellido .
]

{ #category : #Visualizadores }
Usuario >> getBibliotecaInteres [
^colBibibliotecaInter .
]

{ #category : #Visualizadores }
Usuario >> getContraseña [
"lo implemente para cuando cree un nuevo usuario este mantenga la misma contraseña"
^contraseña .
]

{ #category : #Visualizadores }
Usuario >> getDni [
^dni.
]

{ #category : #Visualizadores }
Usuario >> getNombre [ 
^nombre .
]

{ #category : #Visualizadores }
Usuario >> getTipo [ 
^tipoUsuario.
]

{ #category : #Inicializador }
Usuario >> inicializadorUsuario_nombre: nomb yApellido:ape yDni:numDni yContraseña:pass [
colBibibliotecaInter :=OrderedCollection new.
nombre := nomb.
apellido :=ape.
dni :=numDni .
contraseña :=pass .

]

{ #category : #propios }
Usuario >> verMulta [
| estaMultado |.
estaMultado := false.
(fechaMulta isNil)ifTrue: [
	"osea no esta multado"
	 estaMultado := false ] ifFalse: [
	((fechaMulta) < (Date today)) ifTrue: [
		"ya termino la multa"
		estaMultado := true
	] ifFalse: [
		estaMultado := false
	]
].
^ estaMultado
]
