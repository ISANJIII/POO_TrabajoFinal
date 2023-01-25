Class {
	#name : #'Informacion_Usuario',
	#superclass : #'Opciones_Usuario',
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #initialization }
Informacion_Usuario >> initialize [ 
super initialize .
self mostrarInformacion .
]

{ #category : #'as yet unclassified' }
Informacion_Usuario >> mostrarInformacion [
|listaInformacion|.
listaInformacion := MostrarRegistro crearRegistro_Dimension: 300@250 yPosicion: (100@60).
listaInformacion borderWidth: 2.
listaInformacion borderColor: Color pink.
listaInformacion setText:(UsuarioRecibido aTexto).
self addMorph:listaInformacion.
]
