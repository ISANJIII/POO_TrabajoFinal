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
para los usuarios plus el tipo usuario es false.

Esta variable sirve para ver cuando este tiene que volver a pagar y este es cada 30 dias despues de haber creado un usuario plus.
    Instance Variables
	fechaVencimientoCuota:		<Date>


"
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

{ #category : #propios }
UsuarioPlus >> comparar_DNI: numDni [
|puedeRealizarPrest|.
"polimorfismo por refinamiento"
puedeRealizarPrest:=super comparar_DNI: numDni.

(puedeRealizarPrest)ifTrue:[
	(self vencioCuota)ifTrue:[
		"vencio la cuota entonces no puede realizar el prestamo ya que no esta al dia"
		puedeRealizarPrest :=false.
		]. 
	].
^puedeRealizarPrest .
]

{ #category : #propios }
UsuarioPlus >> iniciarFechaVencimientoCuota [
"cuando se crea una instancia de usuarioPlus la fechaVencimientoCuota es la fecha actual 
donde se crea mas 30 dias"
fechaVencimientoCuota := Date today + 30 days.
]

{ #category : #propios }
UsuarioPlus >> vencioCuota [
"vencio"
^ (Date today> fechaVencimientoCuota) .
]
