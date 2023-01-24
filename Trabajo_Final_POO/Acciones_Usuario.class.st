Class {
	#name : #'Acciones_Usuario',
	#superclass : #'Opciones_Usuario',
	#instVars : [
		'botonTipo',
		'botonDevolver',
		'botonAgregar',
		'botonPrestamo',
		'botonInformacion'
	],
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #'as yet unclassified' }
Acciones_Usuario >> agregarBotones [ 
|nota|.

nota:=StringMorph new.
nota contents:'CUANDO SE CAMBIA DE USUARIO A USUARIO PLUS DEBE VOLVER A INICIAR SESION'.
botonTipo :=BotonAccion crearBoton_nomb: ('CAMBIAR EL TIPO DE USUARIO') yDimension:400@50  yColor: Color pink.
botonAgregar :=BotonAccion crearBoton_nomb: 'AGREGAR BIBLIOTECA' yDimension:400@50  yColor: Color pink.

botonPrestamo :=BotonAccion crearBoton_nomb: 'REALIZAR O DEVOLVER PRESTAMO' yDimension:400@50  yColor: Color pink.
botonDevolver :=BotonAccion crearBoton_nomb: 'DEVOLVER PRESTAMO' yDimension:400@50  yColor: Color pink.
botonInformacion :=BotonAccion crearBoton_nomb: 'INFORMACION SOBRE USUARIO' yDimension:400@50  yColor: Color pink.
botonAgregar position:50@40.
botonPrestamo position: botonAgregar position +(0@80).
botonDevolver  position: botonPrestamo position +(0@80).
botonTipo position: botonDevolver position +(0@80).
botonInformacion position: botonTipo position +(0@80).
nota position:botonInformacion position +(0@80)-(30@0).
    self addMorph:botonAgregar; addMorph:botonTipo;addMorph:botonPrestamo;addMorph:botonDevolver;addMorph:nota;addMorph: botonInformacion .

botonAgregar mouseAction: [  Agregar_BibliotecaInteres crearOpcion_titulo: ('Agregar biblioteca de interes a ',UsuarioRecibido getNombre)  yUsuario: UsuarioRecibido.
    self changed:UsuarioRecibido.

    ].
"si quiero cambiar el tipo"
botonTipo mouseAction: [
    MiSistema cambiarTipoUsuario_Usuario: UsuarioRecibido .
    self cerrar.
         ].
    botonPrestamo mouseAction: [
        Realizar_Prestamo crearOpcion_titulo: ('Prestamo')  yUsuario: UsuarioRecibido.

        ].
    botonInformacion mouseAction: [ 
        Informacion_Usuario crearOpcion_titulo: 'INFORMACION SOBRE USUARIO' yUsuario: UsuarioRecibido .

         ].

]

{ #category : #initialization }
Acciones_Usuario >> initialize [ 

super initialize.
self agregarBotones.

]
