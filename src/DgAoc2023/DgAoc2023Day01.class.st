Class {
	#name : #DgAoc2023Day01,
	#superclass : #Object,
	#instVars : [
		'lines'
	],
	#category : #DgAoc2023
}

{ #category : #accessing }
DgAoc2023Day01 >> exampleExampleNew [
	"Answer an instance of DgAoc2023Day01 with the example data, that has a known solution."

	| o input |
	input := 'two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen'.
	o := DgAoc2023Day01 new
			lines: input lines;
			yourself.
	self assert: o lines size equals: 7.
	^ o
]

{ #category : #accessing }
DgAoc2023Day01 >> exampleNew [
	"Answer an instance of DgAoc2023Day01 with the full input loaded in the lines slot."

	<gtExample>
	| o input |
	o := DgAoc2023Day01 new.
	input := '/Users/dlg/dev/gt/aoc2023/inputs/day01.txt' asFileReference
			readStream upToEnd trimBoth.
	o lines: input lines.
	self assert: o lines size equals: 1000.
	^ o
]

{ #category : #accessing }
DgAoc2023Day01 >> exampleReplaceSpelledOutNumbersIncorrect [
	<gtExample>
	| originalString transformedString |
	originalString := 'eightwothree'.
	transformedString := originalString replaceSpelledOutNumbersIncorrect.
	self assert: transformedString equals: '823'.
	^ transformedString
]

{ #category : #accessing }
DgAoc2023Day01 >> exampleSolutionExamplePart2 [
	"Answer the solution for the _example_ input for Part 2 of Day 1."
	<gtExample>
	| solution o line |
	o := self exampleExampleNew.
	solution := o lines
			inject: 0
			into: [ :sum :rawLine | 
				| calibration digits |
				line := rawLine replaceSpelledOutNumbersIncorrect.
				digits := line select: #isDigit.
				calibration := digits first asString , digits last asString.
				calibration asNumber + sum ].
	self assert: solution equals: 281.
	^ solution
]

{ #category : #accessing }
DgAoc2023Day01 >> exampleSolutionPart1 [
	<gtExample>
	| solution o |
	o := self exampleNew.
	solution := o lines
			inject: 0
			into: [ :sum :line | 
				| calibration digits |
				digits := line select: #isDigit.
				calibration := digits first asString , digits last asString.
				calibration asNumber + sum ].
	self assert: solution equals: 54708.
	^ solution
]

{ #category : #accessing }
DgAoc2023Day01 >> exampleSolutionPart2 [
	<gtExample>
	| solution o line |
	o := self exampleNew.
	solution := o lines
			inject: 0
			into: [ :sum :rawLine | 
				| calibration digits |
				line := rawLine replaceSpelledOutNumbersIncorrect.
				digits := line select: #isDigit.
				calibration := digits first asString , digits last asString.
				calibration asNumber + sum ].
	self assert: solution equals: 54052.	"54052 is too low"	"54469 is too high"
	^ solution
]

{ #category : #accessing }
DgAoc2023Day01 >> lines [
	^ lines
]

{ #category : #accessing }
DgAoc2023Day01 >> lines: collOfStrings [
	lines := collOfStrings
]
