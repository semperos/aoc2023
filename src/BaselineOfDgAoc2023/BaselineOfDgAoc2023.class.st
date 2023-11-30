Class {
	#name : #BaselineOfDgAoc2023,
	#superclass : #BaselineOf,
	#category : #BaselineOfDgAoc2023
}

{ #category : #loading }
BaselineOfDgAoc2023 class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'aoc2023' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfDgAoc2023 >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'DgAoc2023'
		]
]
