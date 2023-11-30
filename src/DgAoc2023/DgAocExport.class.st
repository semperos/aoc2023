"
I am a CommandLineHandler for exporting the Advent of Code content in this package as a set of HTML files.

See LeHtmlBookExportCommandLineHandler for the source of the implementation.

Run this at the command line to perform an export:

rm -rf /tmp/aoc2023 && mkdir /tmp/aoc2023 && ./GlamorousToolkit.app/Contents/MacOS/GlamorousToolkit-cli GlamorousToolkit.image exportAoc2023Book --target-dir=/tmp/aoc2023
"
Class {
	#name : #DgAocExport,
	#superclass : #CommandLineHandler,
	#category : #DgAoc2023
}

{ #category : #accessing }
DgAocExport class >> commandName [
	^ 'exportAoc2023Book'
]

{ #category : #accessing }
DgAocExport class >> description [
	^ 'export Advent of Code 2023 book into HTML'
]

{ #category : #activation }
DgAocExport >> activate [
	| aBookExporter aGtBook targetDirName targetDir theWorkflowBuilder aMainPage |
	self activateHelp ifTrue: [ ^ self ].

	aGtBook := LeDatabasesRegistry defaultLogicalDatabase
			databaseNamed: 'Advent of Code 2023'.

	self
		assert: [ aGtBook isNotNil ]
		description: [ 'Advent of Code 2023 Book not found' ].
		
	aMainPage := aGtBook pageNamed: '> Advent of Code 2023 <'.

	self
		assert: [ aGtBook isNotNil ]
		description: [ 'Glamorous Toolkit main page not found' ].
		
	targetDirName := self
			optionAt: 'target-dir'
			ifPresent: [ :aDir | 
				| aName |
				aName := aDir trimBoth.
				self
					assert: [ aName isNotEmpty ]
					description: [ 'Target directory name must not be empty: `{1}`' 
						format: {aName} ].
				aName ]
			ifAbsent: [ './' ].

	targetDir := targetDirName asFileReference.

	self
		assert: [ targetDir exists ]
		description: [ 'Target directory must exist: `{1}`' format: {targetDir fullName} ].

	theWorkflowBuilder := [ 
		NonInteractiveTranscript stdout
			show: 'Exporting Advent of Code 2023 book into ';
			print: targetDir fullName;
			show: ' directory: '.
	
		aBookExporter := LeHtmlBookExporter new
			database: aGtBook;
			mainPage: aMainPage;
			piece: LeHtmlGtBookPiece gtBook;
			hrefBuilder: LeExportFilenameAndExtensionHypertextReferenceBuilder new;
			integerSequencer;
			addGtBookAssets;
			export;
			saveToRootDirectory: targetDir.
			
		NonInteractiveTranscript stdout
		show: 'DONE.';
		cr. ].
		
	(self hasOption: 'verbose')
		ifTrue: [ TranscriptLogger runDuring: theWorkflowBuilder ]
		ifFalse: theWorkflowBuilder.

	(self hasOption: 'save')
		ifTrue: [ 
			^ Smalltalk 
				snapshot: true 
				andQuit: (self hasOption: 'no-quit') not ].

	(self hasOption: 'no-quit')
		ifFalse: [ self quit ]
]
