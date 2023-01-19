Class {
	#name : #IntroducirDato,
	#superclass : #RubTextFieldMorph,
	#category : #'Trabajo_Final_POO-Elementos'
}

{ #category : #'as yet unclassified' }
IntroducirDato class >> crearDialogo_tamanio: unTamanio [
|dialogo|.
dialogo :=self  new.
dialogo extent:unTamanio.
dialogo borderWidth: 2.
dialogo borderColor: Color pink.
^dialogo .
]

{ #category : #accessing }
IntroducirDato >> clear [ 
self setText: ''
]

{ #category : #accessing }
IntroducirDato >> input [

	^ self text asString.
]

{ #category : #accessing }
IntroducirDato >> isEmpty [

	^ self text asString = ''.
]

{ #category : #testing }
IntroducirDato >> isNotEmpty [

	^ self text asString ~= ''.
]
