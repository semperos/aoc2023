Class {
	#name : #DgAoc2023Day01InputLineCharacter,
	#superclass : #Object,
	#instVars : [
		'character',
		'kind'
	],
	#category : #DgAoc2023
}

{ #category : #constructing }
DgAoc2023Day01InputLineCharacter class >> fromCharacter: aChar [
	^ self new character: aChar; yourself
]

{ #category : #constructing }
DgAoc2023Day01InputLineCharacter class >> fromCharacter: aChar asKind: aKind [
	^ self new character: aChar; kind: aKind; yourself
]

{ #category : #constructing }
DgAoc2023Day01InputLineCharacter >> character: aChar [ 
	character := aChar
]

{ #category : #accessing }
DgAoc2023Day01InputLineCharacter >> kind [
	"Answer what kind of character this is, relative to the parsing needs of the problem."
	^ kind
]

{ #category : #constructing }
DgAoc2023Day01InputLineCharacter >> kind: aKind [
	kind := aKind
]
