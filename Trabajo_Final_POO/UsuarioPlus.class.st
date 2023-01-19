Class {
	#name : #UsuarioPlus,
	#superclass : #Usuario,
	#classInstVars : [
		'fechaVencimientoCuota'
	],
	#category : #'Trabajo_Final_POO-Modelo'
}

{ #category : #'as yet unclassified' }
UsuarioPlus class >> crearUsuarioPlus_nombre: nomb yApellido:ape yDni:numDni yContraseña:pass [
|usuarioP|.
usuarioP :=self new.
usuarioP inicializadorUsuario_nombre: nomb yApellido:ape yDni:numDni yContraseña:pass.
usuarioP cambiarTipo: false.
^usuarioP.
]
