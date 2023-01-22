Class {
	#name : #'Registrar_Usuario',
	#superclass : #VentanaO,
	#instVars : [
		'botonRegistrar',
		'datoNombre',
		'datoApellido',
		'datoDni',
		'cajaOpcion',
		'datoContraseña',
		'listaItems'
	],
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #accessing }
Registrar_Usuario >> agregarBotones [
|temp|.
temp:= RubScrolledTextMorph  new.
"en Smalltalk Pharo significa que un objeto se hace de solo lectura, lo que significa que su estado no se puede modificar. Una vez que un objeto se hace de solo lectura, cualquier intento de cambiar su estado generará una excepción."
temp beReadOnly .
temp  position:190@280; extent:140@45.
""
botonRegistrar := BotonAccion crearBoton_nomb: 'REGISTRAR' yDimension:100@20  yColor: Color pink.
self addMorph:botonRegistrar.
botonRegistrar position: 385@415.
"registro addDependent: self."

botonRegistrar mouseAction: [  
	
	((datoNombre isNotEmpty ) & (datoApellido isNotEmpty ) & (datoDni isNotEmpty) & (datoContraseña isNotEmpty))
	"se rellenaron todos las casillas"
	ifTrue:[
		|usuario|.
		(cajaOpcion  verEstado) ifTrue:[
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
]

{ #category : #'as yet unclassified' }
Registrar_Usuario >> agregarTitulos [
|titulo1 titulo2 titulo3 titulo4 titulo5 titulo6|.
titulo1 :='Ingrese el nombre' asMorph .
titulo2 :='Ingrese el apellido' asMorph .
titulo3 :='Ingrese el DNI' asMorph .
titulo4 :='Marque si quiere ser plus ' asMorph .
titulo5 :='Ingrese una contraseña' asMorph .
titulo6 :='Ingrese sus Biblioteca de interes' asMorph .
self
addMorph:titulo1;addMorph:titulo2;addMorph:titulo3;addMorph:titulo4;addMorph:titulo5;addMorph:titulo6.
titulo1 position: datoNombre position-(0@20).
titulo2 position: datoApellido position-(0@20).
titulo3 position: datoDni position-(0@20).
titulo4 position: cajaOpcion  position-(0@20).
titulo5 position: datoContraseña position-(0@20).
titulo6 position: listaItems position -(0@20).
]

{ #category : #initialization }
Registrar_Usuario >> initialize [ 
| pos |.
super initialize.
self fondoParaMiVentana:'C:\Users\asdf\Downloads\marcos\marco3.png'.

"creo los campos para introducir datos"
pos:=50@50.
cajaOpcion := BotonSeleccionar crearBSeleccionar_Nombre: 'Desea ser plus' tamanio: 20@20.
datoNombre := IntroducirDato crearDialogo_tamanio: 150@10.
datoApellido :=IntroducirDato crearDialogo_tamanio: 150@10.
datoDni :=IntroducirDato crearDialogo_tamanio: 150@10.
datoContraseña:=IntroducirDato crearDialogo_tamanio: 150@10.
listaItems  := SearchMorph new.
"listaRegistro extent: 380@30 ;searchList: (miSistema getBibliotecasNombres)."
self
addMorph:datoNombre;addMorph:datoApellido;addMorph:datoDni;addMorph:datoContraseña;addMorph:listaItems;addMorph: cajaOpcion.
"posicion"
datoNombre position: pos.
datoApellido position: datoNombre position + (0@50).
datoDni position: datoApellido position + (0@50).
datoContraseña position: datoDni position + (0@50).
cajaOpcion position: datoContraseña position + (0@50).
listaItems position: cajaOpcion position +(0@50).
"ESTA CLASE DEPENDE DE miSistema que es una instancia que recibe por parametro de la clase Sistema_gestor"
MiSistema addDependent: self.
"cargo los usuarios que tengo registrado"
self update: (MiSistema getColUsuario).
self agregarBotones.
self agregarTitulos .

]
