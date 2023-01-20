Class {
	#name : #Biblioteca,
	#superclass : #Object,
	#instVars : [
		'identificador',
		'colPrestamo',
		'direccion',
		'nombre',
		'telefono_Contacto',
		'nombre_Representante',
		'diasParaPrestar',
		'colLibro'
	],
	#category : #'Trabajo_Final_POO-Modelo'
}

{ #category : #'as yet unclassified' }
Biblioteca class >> crearBiblioteca_id: ident yDireccion: dir yNombre: nomb yTelContacto: numC yRepresentante: nomR yDiasParaPrestar: dPrestar [
|biblioteca|.
biblioteca :=self new.
biblioteca inicializadorBiblioteca_id: ident yDireccion: dir yNombre: nomb yTelContacto: numC yRepresentante: nomR yDiasParaPrestar: dPrestar.
^biblioteca .
]

{ #category : #toString }
Biblioteca >> aTexto [ 
|texto|.
texto:='Identificador: ',identificador asString,String cr,'Direccion: ',direccion asString ,String cr,'Nombre Establecimiento: ',nombre asString,String cr,'Num Contacto: ',telefono_Contacto asString,String cr, 'Nombre Representante',nombre_Representante asString,String cr, 'Cantidad de libros registrados: ', (colLibro size)asString,String cr. 
^texto .
]

{ #category : #'as yet unclassified' }
Biblioteca >> agregarLibro: unLibro [

colLibro add: unLibro  .
self changed: colLibro .
]

{ #category : #'as yet unclassified' }
Biblioteca >> agregarPrestamo: unPrestamo [

colPrestamo add: unPrestamo .
]

{ #category : #'as yet unclassified' }
Biblioteca >> biblioteca_ID: unID [

^(unID = identificador).
]

{ #category : #'as yet unclassified' }
Biblioteca >> getNombreEstablecimiento [
^nombre asString .
]

{ #category : #'as yet unclassified' }
Biblioteca >> inicializadorBiblioteca_id: ident yDireccion: dir yNombre: nomb yTelContacto: numC yRepresentante: nomR yDiasParaPrestar: dPrestar [
colLibro :=OrderedCollection new.
colPrestamo :=OrderedCollection new.
identificador :=ident.
direccion := dir.
nombre := nomb.
telefono_Contacto := numC.
nombre_Representante := nomR .
diasParaPrestar :=dPrestar.

]
