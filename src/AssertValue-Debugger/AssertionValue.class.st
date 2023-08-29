"
I am an AssertionFailure that carries the value that was actually returned.

I work with `AssertValueDebugger`
"
Class {
	#name : #AssertionValue,
	#superclass : #AssertionFailure,
	#instVars : [
		'result'
	],
	#category : #'AssertValue-Debugger-Exceptions'
}

{ #category : #testing }
AssertionValue >> isHandleableBy: aDebugger [



	^ aDebugger == AssertValueDebugger
]

{ #category : #accessing }
AssertionValue >> messageText [

	^ self result printString
]

{ #category : #accessing }
AssertionValue >> result [

	^ result
]

{ #category : #accessing }
AssertionValue >> result: anObject [

	result := anObject
]

{ #category : #'debugger extension' }
AssertionValue >> selectionInterval: selectionInterval for: aStDebugger [

	| newText text resultString |
	text := aStDebugger code text.
	resultString := self messageText.
	newText := String streamContents: [ :s |
		           s
			           nextPutAll: (text first: selectionInterval first - 1);
			           nextPutAll: 'assert:';
			           nextPutAll:
				           (text
					            copyFrom: selectionInterval first + 4
					            to: selectionInterval last);
			           nextPutAll: ' equals: ';
			           nextPutAll: resultString;
			           nextPutAll:
				           (text last: text size - selectionInterval last) ].
	aStDebugger code text: newText.
	"aStDebugger code focus."
	^ selectionInterval last + 13 to:
	  selectionInterval last + 12 + resultString size
]
