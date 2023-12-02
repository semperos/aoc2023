Class {
	#name : #DgAoc2023Day01InputLine,
	#superclass : #Object,
	#instVars : [
		'line',
		'characters'
	],
	#category : #DgAoc2023
}

{ #category : #accessing }
DgAoc2023Day01InputLine class >> fromString: aString [
	^ self new line: aString
]

{ #category : #'color manipulation' }
DgAoc2023Day01InputLine >> blend: aColor with: aColorValue weight: wt [
	"Answer a new ColorValue which is a weighted blend of the receiver and the
	supplied ColorValue."
	"Simply interpolates in RGB space."

	| rv gv bv invWt av |
	
	invWt := 1-wt.
	rv := ((aColor red * invWt) + ((aColorValue red)*wt)) "rounded".
	gv := ((aColor green  * invWt) + ((aColorValue green)*wt)) "rounded".
	bv := ((aColor blue * invWt) + ((aColorValue blue)*wt)) "rounded".
	av := ((aColor alpha * invWt) + ((aColorValue alpha)*wt)).
	^Color r: rv g: gv b: bv alpha: av
]

{ #category : #accessing }
DgAoc2023Day01InputLine >> gtColorSpelledOutNumbers: aView [
	<gtView>
	^ aView explicit
		title: 'Colorized';
		stencil: [ | colors container |
			colors := {Color yellow.
					Color blue.
					Color gray.
					Color green.
					Color red}.
			container := BlElement new
					size: 100 @ 5;
					layout: BlGridLayout horizontal.
			line
				doWithIndex: [ :aCharacter :idx | 
					| square |
					square := BlElement new
							background: (self
									blend: colors atRandom
									with: colors atRandom
									weight: 5);
							size: 5 @ 5;
							when: BlClickEvent
								do: [ :event | event currentTarget phlow spawnObject: aCharacter ].
					square
						addChild: (BrLabel new
								text: aCharacter asString asRopedText;
								size: 5 @ 5;
								aptitude: (BrGlamorousLabelAptitude new
										foreground: Color black;
										fontSize: 5);
								constraintsDo: [ :c | 
									c frame horizontal alignCenter.
									c frame vertical alignCenter ]).
					container addChild: square ].
			container asScalableElement ]
]

{ #category : #accessing }
DgAoc2023Day01InputLine >> line: aString [
	"Store the line and determine the kind of each character, in terms of parsing needs."

	<todo: 'Implementation incomplete'>
	| cursor buffer |
	line := aString.
	characters := OrderedCollection new.
	cursor := 0.
	buffer := ''.
	cursor = aString size
		whileTrue: [ | thisChar |
			thisChar := line at: cursor.
			thisChar isDigit
				ifTrue: [ characters
						add: (DgAoc2023Day01InputLineCharacter fromCharacter: thisChar asKind: #numeral) ].
			buffer := buffer , thisChar asString	"todo" ].

	line
		do: [ :aChar | characters add: (DgAoc2023Day01InputLineCharacter fromCharacter: aChar) ]
]
