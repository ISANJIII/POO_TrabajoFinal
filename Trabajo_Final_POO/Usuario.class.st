Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'colBibibliotecaInter',
		'nombre',
		'multado',
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

{ #category : #toString }
Usuario >> aTexto [
|texto tipo|.
tipo:='USUARIO PLUS'.
tipoUsuario ifTrue: [ tipo:='USUARIO NO PLUS' ].
texto:='Nombre: ',nombre asString,String cr,'Apellido: ',apellido asString ,String cr,'DNI: ',dni asString,String cr,tipo ,String cr,'Cantidad de Bibliotecas Agregadas: ',(colBibibliotecaInter size)asString,String cr. 
^texto .
]

{ #category : #'as yet unclassified' }
Usuario >> actualizarColBiblioteca: unaCol [
"esto lo hago para cuando hago un cambio de usuario este mantenga la misma coleccion de biblioteca que tuvo interes"
colBibibliotecaInter:=unaCol .

]

{ #category : #'as yet unclassified' }
Usuario >> agregarBibliotecaInteres:unaBiblio [
colBibibliotecaInter add:unaBiblio.
self changed:colBibibliotecaInter.

]

{ #category : #'as yet unclassified' }
Usuario >> buscarUsuario_Dni: num yContraseña: password [ 

^ (((dni)=num)&((contraseña)=password)). 
]

{ #category : #'as yet unclassified' }
Usuario >> cambiarTipo: tipoU [
tipoUsuario :=tipoU .
self changed.
]

{ #category : #'as yet unclassified' }
Usuario >> getApellido [
^apellido .
]

{ #category : #'as yet unclassified' }
Usuario >> getBibliotecaInteres [
^colBibibliotecaInter .
]

{ #category : #'as yet unclassified' }
Usuario >> getContraseña [
"lo implemente para cuando cree un nuevo usuario este mantenga la misma contraseña"
^contraseña .
]

{ #category : #'as yet unclassified' }
Usuario >> getDni [
^dni.
]

{ #category : #Visualizadores }
Usuario >> getNombre [ 
^nombre .
]

{ #category : #'as yet unclassified' }
Usuario >> getTipo [ 
^tipoUsuario.
]

{ #category : #'as yet unclassified' }
Usuario >> inicializadorUsuario_nombre: nomb yApellido:ape yDni:numDni yContraseña:pass [
colBibibliotecaInter :=OrderedCollection new.
nombre := nomb.
apellido :=ape.
dni :=numDni .
contraseña :=pass .
"no esta multado"
multado :=false.
]

{ #category : #'as yet unclassified' }
Usuario >> realizoPrestamo_DNI: numDni [
|realizoPrest|.
realizoPrest :=false.
"este metodo se usa para saber si el numDni que viene por parametro que se lo envia la clase prestamo es igual al dni del usuario... osea si es igual es porque ya realizo un prestamo"
(dni = numDni )ifTrue: [ realizoPrest :=true ].
^realizoPrest .

]

{ #category : #'as yet unclassified' }
Usuario >> verMulta [
"El sistema multa con una suspensión de k dias al usuario que se retrasa en la devolución de los libros, es decir que por esa cantidad de días no podrá solicitar nuevos préstamos.
si es falso es porque no esta multado.
"

^multado .
]
