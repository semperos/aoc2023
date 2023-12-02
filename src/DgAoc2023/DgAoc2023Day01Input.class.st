Class {
	#name : #DgAoc2023Day01Input,
	#superclass : #Object,
	#instVars : [
		'input',
		'lines'
	],
	#category : #DgAoc2023
}

{ #category : #accessing }
DgAoc2023Day01Input class >> fromString: aString [
	^ self new input: aString 
]

{ #category : #accessing }
DgAoc2023Day01Input >> input: aString [
	input := aString.
	lines := input lines collect: [:line |  DgAoc2023Day01InputLine fromString: line ]
]
