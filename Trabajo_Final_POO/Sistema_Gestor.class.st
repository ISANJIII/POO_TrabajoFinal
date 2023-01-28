"
Esta clase esta compuesto por las siguientes variables:
    Instance Variables
	colAutor:		<Autor>
	colBiblioteca:		<Biblioteca>
	colUsuario:		<Usuario>
			
las instancias de autor solo puede ser creada cuando se quiera ingresar un libro, cuando se añada un libro podremos añadir al autor pero no se podra crear desde el sistema_gestor si no que desde libro y al crearla desde libro se añadira a la colAutor.
"
Class {
	#name : #'Sistema_Gestor',
	#superclass : #Object,
	#instVars : [
		'colAutor',
		'colBiblioteca',
		'colUsuario'
	],
	#category : #'Trabajo_Final_POO-Modelo'
}

{ #category : #'as yet unclassified' }
Sistema_Gestor class >> crearSistemaAUsar [
|sis usuario1 usuario2 usuario3 usuario4 usuario5 biblioteca1 biblioteca2 biblioteca3 autor1 autor2 autor3 autor4 |.
sis:= self new.
sis inicializadorSistema_Gestor.
"creo usuarios plus y no plus"
usuario1:=UsuarioPlus crearUPlus_nombre: 'Messi' yApellido:'Cuccittini'  yDni:'10000000'  yContraseña:'12345' .
sis agregarUsuario: usuario1 .
usuario2:=UsuarioPlus crearUPlus_nombre: 'Facu' yApellido:'Munos'  yDni:'10000001'  yContraseña:'12345' .
sis agregarUsuario: usuario2 .
usuario3:=Usuario crearU_nombre: 'Seba' yApellido:'Iovaldo'  yDni:'10000002'  yContraseña:'12345' .
sis agregarUsuario: usuario3 .
usuario4:=Usuario crearU_nombre: 'Guillermo' yApellido:'Diaz'  yDni:'10000003'  yContraseña:'12345' .
sis agregarUsuario: usuario4 .
usuario5:=Usuario crearU_nombre: 'Joaquin' yApellido:'Medel'  yDni:'10000004'  yContraseña:'12345' .
sis agregarUsuario: usuario5.
"creo bibliotecas"
biblioteca1 := Biblioteca crearBiblioteca_id: '001' yDireccion:'Calle 123' yNombre: 'Biblioteca Central' yTelContacto: '555-555-5555' yRepresentante: 'Juan Pérez' yDiasParaPrestar: '7'.
sis agregarBiblioteca: biblioteca1.
biblioteca2 := Biblioteca crearBiblioteca_id: '002' yDireccion:'Calle 123' yNombre: 'Biblioteca Nacional' yTelContacto: '555-555-5556' yRepresentante: 'Juan Pérez' yDiasParaPrestar: '10'.
sis agregarBiblioteca: biblioteca2.
biblioteca3 := Biblioteca crearBiblioteca_id: '003' yDireccion:'Calle 123' yNombre: 'Biblioteca SanPedro' yTelContacto: '555-555-5557' yRepresentante: 'Juan Pérez' yDiasParaPrestar: '5'.
sis agregarBiblioteca: biblioteca3.
"creo autores"
autor1 := Autor crearAutor_nombre: 'Juan' yApellido: 'Pérez'.
sis agregarAutor: autor1 .
autor2 := Autor crearAutor_nombre: 'Celina' yApellido: 'Gramajo'.
sis agregarAutor: autor2 .
autor3 := Autor crearAutor_nombre: 'Cristopher' yApellido: 'Ovaillos'.
sis agregarAutor: autor3 .
autor4 := Autor crearAutor_nombre: 'Leonardo' yApellido: 'Pérez'.
sis agregarAutor: autor4 .
"libro"
biblioteca1 agregarLibro:  (Libro crearLibro_nombre: 'La odisea' yEditorial:'Librería y Casa Editorial Hernando'  yAnio_Edicion:'1906').

"sis changed.
self changed."
 ^ sis.
]

{ #category : #'as yet unclassified' }
Sistema_Gestor class >> crearSistemaGestor_colAutor:cAutor colBiblioteca:cBiblioteca colUsuario:cUsuario [
|sistema|.
sistema:=self new.
sistema inicializadorSistemaGestor_colAutor:cAutor colBiblioteca:cBiblioteca colUsuario:cUsuario.
^sistema .
]

{ #category : #'as yet unclassified' }
Sistema_Gestor >> agregarAutor: unAutor [
colAutor add: unAutor. 
self changed:colAutor.
]

{ #category : #'as yet unclassified' }
Sistema_Gestor >> agregarBiblioteca: unaBiblioteca [
colBiblioteca add:unaBiblioteca.
self changed:colBiblioteca.
]

{ #category : #'as yet unclassified' }
Sistema_Gestor >> agregarUsuario: unUsuario [
colUsuario add:unUsuario.
"AVISO QUE ACTUALICE"
self changed: colUsuario.
]

{ #category : #'as yet unclassified' }
Sistema_Gestor >> cambiarTipoUsuario_Usuario:usuarioViejo [ 
|usuarioNuevo|.
(usuarioViejo getTipo)ifTrue:[
    "NO ES USUARIO PLUS entonces pasamos a usuario no plus"
    usuarioNuevo :=UsuarioPlus crearUPlus_nombre: (usuarioViejo getNombre )  yApellido: (usuarioViejo getApellido  ) yDni:(usuarioViejo getDni  )  yContraseña:(usuarioViejo getContraseña).
    ]ifFalse:[
    "ES USUARIO PLUS"
    usuarioNuevo :=Usuario crearU_nombre: (usuarioViejo getNombre)  yApellido: (usuarioViejo getApellido  ) yDni:(usuarioViejo getDni)  yContraseña:(usuarioViejo getContraseña).
    ].
usuarioNuevo actualizarColBiblioteca: (usuarioViejo getBibliotecaInteres).
colUsuario remove:usuarioViejo .
self agregarUsuario: usuarioNuevo.

]

{ #category : #auxiliares }
Sistema_Gestor >> colATexto: unaColeccion [
	^ String streamContents: [:s | 
		unaColeccion do: [:each | 
			s nextPutAll: each aTexto.
			s nextPut: Character cr]].
]

{ #category : #'as yet unclassified' }
Sistema_Gestor >> devolverUsuario_dni: numDni [
^ (colUsuario detect:[:usuario| ((usuario getDni))=numDni ])
]

{ #category : #'as yet unclassified' }
Sistema_Gestor >> existeDni:unDni [
"El mensaje anySatisfy: retorna true si al menos un objeto en la colección cumple con la condición especificada, o false si ninguno de los objetos en la colección cumple con la condición."
^colUsuario anySatisfy: [:usuario|((usuario getDni)asString)=unDni].



]

{ #category : #'as yet unclassified' }
Sistema_Gestor >> getBibliotecas [
^ colBiblioteca .
]

{ #category : #'as yet unclassified' }
Sistema_Gestor >> getColUsuario [
^colUsuario.

]

{ #category : #'as yet unclassified' }
Sistema_Gestor >> inicializadorSistemaGestor_colAutor:cAutor colBiblioteca:cBiblioteca colUsuario:cUsuario [

colAutor :=cAutor .
colBiblioteca := cBiblioteca .
colUsuario  :=cUsuario .

]

{ #category : #'as yet unclassified' }
Sistema_Gestor >> inicializadorSistema_Gestor [
colBiblioteca:=OrderedCollection new.
colAutor:=OrderedCollection new.
colUsuario:=OrderedCollection new.
]

{ #category : #'as yet unclassified' }
Sistema_Gestor >> iniciarSesion_Dni: numDni yContraseña:password [
| exito |.
exito:=false.
colUsuario do:[:i| (i buscarUsuario_Dni: ((numDni)asString) yContraseña: ((password)asString)) ifTrue:  [exito:=true]].
^exito.
"el metodo detect devuelve una referencia no una copia"
"^ (colUsuario detect:[:usuario| (usuario buscarUsuario_Dni:((numDni)asString)  yContraseña:((password)asString))]). "
]

{ #category : #'as yet unclassified' }
Sistema_Gestor >> verSiEsFecha: unaFecha [
"$ se utiliza para especificar caracteres especiales."
^(unaFecha allSatisfy: [:c | c isDigit or: [c = $-]])
    ifTrue: [
        (unaFecha size = 10)
            and: [
                (unaFecha at: 5) = $-
                and: [
                    (unaFecha at: 8) = $-
                ]
            ]
    ]ifFalse: [false].
]

{ #category : #'as yet unclassified' }
Sistema_Gestor >> verSiEsNumero:num [
^((num) allSatisfy: [:c | c isDigit]).
]
