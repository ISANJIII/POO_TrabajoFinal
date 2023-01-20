Class {
	#name : #'Registrar_Biblioteca',
	#superclass : #VentanaO,
	#instVars : [
		'botonRegistrar',
		'datoIdentificador',
		'datoDireccion',
		'datoNombreE',
		'datoTelCont',
		'datoNombRepresentante',
		'datoDiasParaPrestar'
	],
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #'as yet unclassified' }
Registrar_Biblioteca >> agregarTitulos [
|titulo1 titulo2 titulo3 titulo4 titulo5 titulo6|.
titulo1 :='Ingrese el identificador' asMorph .
titulo2 :='Ingrese la direccion' asMorph .
titulo3 :='Ingrese el nombre del establecimiento' asMorph .
titulo4 :='Ingrese el numero de contacto ' asMorph .
titulo5 :='Ingrese el nombre del representante' asMorph .
titulo6 :='Ingrese los dias para prestar' asMorph .
self
addMorph:titulo1;addMorph:titulo2;addMorph:titulo3;addMorph:titulo4;addMorph:titulo5;addMorph:titulo6.
titulo1 position: datoIdentificador  position-(0@20).
titulo2 position: datoDireccion  position-(0@20).
titulo3 position: datoNombreE  position-(0@20).
titulo4 position: datoTelCont   position-(0@20).
titulo5 position: datoNombRepresentante  position-(0@20).
titulo6 position: datoDiasParaPrestar  position -(0@20).
]

{ #category : #'as yet unclassified' }
Registrar_Biblioteca >> añadorCampos [
|pos|.
pos:=20@50.
"campos"
datoIdentificador :=IntroducirDato crearDialogo_tamanio: 150@10.
datoDireccion :=IntroducirDato crearDialogo_tamanio: 150@10.
datoNombreE :=IntroducirDato crearDialogo_tamanio: 150@10.
datoTelCont :=IntroducirDato crearDialogo_tamanio: 150@10.
datoNombRepresentante :=IntroducirDato crearDialogo_tamanio: 150@10.
datoDiasParaPrestar:=IntroducirDato crearDialogo_tamanio: 150@10.
"posicion"

datoIdentificador position: pos.
datoDireccion position: datoIdentificador position + (0@50).
datoNombreE position: datoDireccion position+ (0@50).
datoTelCont position: datoNombreE position +(0@50).
datoNombRepresentante position:datoTelCont position+ (0@50).
datoDiasParaPrestar position: datoNombRepresentante position+(0@50).
self
addMorph:datoIdentificador;addMorph:datoDireccion;addMorph:datoNombreE;addMorph:datoTelCont;addMorph:datoNombRepresentante;addMorph:datoDiasParaPrestar.
]

{ #category : #'as yet unclassified' }
Registrar_Biblioteca >> botonRegistro [

botonRegistrar := BotonAccion crearBoton_nomb: 'REGISTRAR' yDimension:100@20  yColor: Color pink.
self addMorph:botonRegistrar.
botonRegistrar position: 385@415.
"accion del boton"
botonRegistrar mouseAction: [ 
	(datoIdentificador isNotEmpty &  datoDireccion isNotEmpty & datoNombreE isNotEmpty & datoTelCont isNotEmpty & datoNombRepresentante isNotEmpty & datoDiasParaPrestar isNotEmpty )ifTrue:[
		"ESTAN RELLENOS"
		|biblio|.
		biblio :=Biblioteca crearBiblioteca_id: datoIdentificador text asString  yDireccion:datoDireccion text asString yNombre: datoNombreE text asString yTelContacto:datoTelCont text asString   yRepresentante:datoNombRepresentante text asString  yDiasParaPrestar: datoDiasParaPrestar text asString.
		miSistema agregarBiblioteca: biblio.
		AgregarLibro crearOpcion_titulo: 'AGREGAR LIBRO' yBiblioteca: biblio .
		self cerrar .
		].
	 ].
]

{ #category : #initialization }
Registrar_Biblioteca >> initialize [
super initialize.
self fondoParaMiVentana: 'C:\Users\asdf\Downloads\marcos\marco2.png'.
self añadorCampos;agregarTitulos .
miSistema addDependent: self.
"cargo los usuarios que tengo registrado"
self update: (miSistema getBibliotecas).
self botonRegistro .
]
