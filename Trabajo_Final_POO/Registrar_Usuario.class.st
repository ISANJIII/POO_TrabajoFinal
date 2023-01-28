Class {
	#name : #'Registrar_Usuario',
	#superclass : #VentanaO,
	#instVars : [
		'botonRegistrar',
		'datoNombre',
		'datoApellido',
		'datoDni',
		'cajaOpcion',
		'datoContraseña'
	],
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #accessing }
Registrar_Usuario >> agregarBotones [
|error|.
error:=StringMorph new.
error contents:''.
error position:cajaOpcion position + (0@50).
self addMorph:error.
"en Smalltalk Pharo significa que un objeto se hace de solo lectura, lo que significa que su estado no se puede modificar. Una vez que un objeto se hace de solo lectura, cualquier intento de cambiar su estado generará una excepción."
""
botonRegistrar := BotonAccion crearBoton_nomb: 'REGISTRAR' yDimension:100@20  yColor: Color pink.
self addMorph:botonRegistrar.
botonRegistrar position: 385@415.
"registro addDependent: self."

botonRegistrar mouseAction: [  
	
	((datoNombre isNotEmpty ) & (datoApellido isNotEmpty ) & (datoDni isNotEmpty) & (datoContraseña isNotEmpty))
	"se rellenaron todos las casillas"
	ifTrue:[
		(MiSistema existeDni: (datoDni input))ifTrue:[
			"encontro un usuario ya registrado"
			error contents:'El usuario ya esta registrado'.
			self addMorph:error.
			]ifFalse:[
		|usuario|.
		(cajaOpcion verEstado) ifTrue:[
			self removeMorph: error.
			"selecciono osea quiere ser plus"
			usuario :=(UsuarioPlus crearUPlus_nombre:(datoNombre input )  yApellido: (datoApellido input) yDni:(datoDni input)  yContraseña:(datoContraseña input )).
			
					
			] ifFalse:[
			"no selecciono quiere ser usuario no plus"
			usuario :=(Usuario crearU_nombre:(datoNombre input )  yApellido: (datoApellido input) yDni:(datoDni input)  yContraseña:(datoContraseña input )).
						
			].	
			MiSistema agregarUsuario:usuario.
			Acciones_Usuario crearOpcion_titulo: (usuario getNombre) yUsuario: usuario .
self cerrar.	

			].
		
		].
	
	].
]

{ #category : #'as yet unclassified' }
Registrar_Usuario >> agregarTitulos [
|titulo1 titulo2 titulo3 titulo4 titulo5 |.
titulo1 :='Ingrese el nombre' asMorph .
titulo2 :='Ingrese el apellido' asMorph .
titulo3 :='Ingrese el DNI' asMorph .
titulo4 :='Marque si quiere ser plus ' asMorph .
titulo5 :='Ingrese una contraseña' asMorph .

self
addMorph:titulo1;addMorph:titulo2;addMorph:titulo3;addMorph:titulo4;addMorph:titulo5.
titulo1 position: datoNombre position-(0@20).
titulo2 position: datoApellido position-(0@20).
titulo3 position: datoDni position-(0@20).
titulo4 position: cajaOpcion  position-(0@20).
titulo5 position: datoContraseña position-(0@20).

]

{ #category : #initialization }
Registrar_Usuario >> initialize [ 
| pos |.
super initialize.
"creo los campos para introducir datos"
pos:=50@50.
cajaOpcion := BotonSeleccionar crearBSeleccionar_Nombre: 'Desea ser plus' tamanio: 20@20.
datoNombre := IntroducirDato crearDialogo_tamanio: 150@10.
datoApellido :=IntroducirDato crearDialogo_tamanio: 150@10.
datoDni :=IntroducirDato crearDialogo_tamanio: 150@10.
datoContraseña:=IntroducirDato crearDialogo_tamanio: 150@10.

self
addMorph:datoNombre;addMorph:datoApellido;addMorph:datoDni;addMorph:datoContraseña;addMorph: cajaOpcion.
"posicion"
datoNombre position: pos.
datoApellido position: datoNombre position + (0@50).
datoDni position: datoApellido position + (0@50).
datoContraseña position: datoDni position + (0@50).
cajaOpcion position: datoContraseña position + (0@50).
"ESTA CLASE DEPENDE DE miSistema que es una instancia que recibe por parametro de la clase Sistema_gestor"
MiSistema addDependent: self.
"cargo los usuarios que tengo registrado"
self update: (MiSistema getColUsuario).
self agregarBotones.
self agregarTitulos .

]
