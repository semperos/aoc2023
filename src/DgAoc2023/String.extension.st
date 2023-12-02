Extension { #name : #String }

{ #category : #'*DgAoc2023' }
String >> replaceSpelledOutNumbersIncorrect [
	"Answer a copy of self that replaces spelled-out numbers with their numeral equivalents. The final letter of one number can be shared with the first letter of a following number, e.g., 'oneeight'.
	
	This implementation proved incorrect, because you can have an unlimited number of chained words that share last/first letters."

	^ {'oneeight' -> '18'.
		'twone' -> '21'.
		'threeight' -> '38'.
		'fiveight' -> '58'.
		'sevenine' -> '79'.
		'eighthree' -> '83'.
		'eightwo' -> '82'.
		'nineeight' -> '98'.
		'one' -> '1'.
		'two' -> '2'.
		'three' -> '3'.
		'four' -> '4'.
		'five' -> '5'.
		'six' -> '6'.
		'seven' -> '7'.
		'eight' -> '8'.
		'nine' -> '9'}
		inject: self
		into: [ :aString :anAssoc | aString replaceAllRegex: anAssoc key with: anAssoc value ]
]
