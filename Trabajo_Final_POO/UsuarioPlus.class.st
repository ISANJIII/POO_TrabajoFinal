Class {
	#name : #UsuarioPlus,
	#superclass : #Usuario,
	#instVars : [
		'fechaVencimientoCuota'
	],
	#classInstVars : [
		'fechaVencimientoCuota'
	],
	#category : #'Trabajo_Final_POO-Modelo'
}

{ #category : #'as yet unclassified' }
UsuarioPlus class >> crearUPlus_nombre: nomb yApellido:ape yDni:numDni yContraseña:pass [
|usuarioP|.
usuarioP :=self new.
usuarioP inicializadorUsuario_nombre: nomb yApellido:ape yDni:numDni yContraseña:pass.
usuarioP cambiarTipo: false.
usuarioP iniciarFechaVencimientoCuota.
^usuarioP.
]

{ #category : #'as yet unclassified' }
UsuarioPlus >> iniciarFechaVencimientoCuota [
"cuando se crea una instancia de usuarioPlus la fechaVencimientoCuota es la fecha actual 
donde se crea mas 30 dias"
fechaVencimientoCuota := Date today + 30 days.
]

{ #category : #'as yet unclassified' }
UsuarioPlus >> puedeRealizarPrestamo: numDni [
|puedeRealizarPrest|.
"polimorfismo por refinamiento"
puedeRealizarPrest:=super puedeRealizarPrestamo: numDni.

(puedeRealizarPrest)ifTrue:[
	(self vencioCuota)ifTrue:[
		"vencio la cuota entonces no puede realizar el prestamo ya que no esta al dia"
		puedeRealizarPrest :=false.
		]. 
	].
^puedeRealizarPrest .
]

{ #category : #'as yet unclassified' }
UsuarioPlus >> vencioCuota [
"vencio"
^ (Date today> fechaVencimientoCuota) .
]
