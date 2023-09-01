Extension { #name : #Object }

{ #category : #'*AssertValue-Debugger' }
Object >> valuePrintOn: aStream [
	"Append to the argument, aStream, an expression that, when evaluated will create the value.
	This is straight-forward for literals.
	For compound objects, it checks for a class method that sets all the values in order... failing that, it does a new and uses the assumed setters.
	This isn't always correct (for example, there may be a combined setter or a class method with the values in a different order), but it often is."

	| first names doCascade |
	self isLiteral ifTrue: [ ^ self printOn: aStream ].
	first := true.
	names := self class allInstVarNames.
	names ifNotEmpty: [ aStream nextPut: $( ].
	aStream nextPutAll: self class name.
	doCascade := self class respondsTo:
		             (':' join: names , #( '' )) asSymbol.
	doCascade ifFalse: [ aStream nextPutAll: ' new' ].
	names doWithIndex: [ :title :index |
		first
			ifTrue: [ aStream space ]
			ifFalse: [ aStream nextPut: $; ].
		first := doCascade.
		aStream
			nextPutAll: title;
			nextPut: $:.
		(self instVarAt: index) valuePrintOn: aStream ].
	names ifNotEmpty: [ aStream nextPut: $) ]
]

{ #category : #'*AssertValue-Debugger' }
Object >> valuePrintString [
	"Answer a String whose characters are a description of the receiver."

	^ String streamContents: [ :aStream | self valuePrintOn: aStream ]
]
