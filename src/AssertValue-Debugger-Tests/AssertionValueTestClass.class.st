Class {
	#name : #AssertionValueTestClass,
	#superclass : #Object,
	#instVars : [
		'abc',
		'def'
	],
	#category : #'AssertValue-Debugger-Tests'
}

{ #category : #accessing }
AssertionValueTestClass >> abc: value [
	abc := value
]

{ #category : #accessing }
AssertionValueTestClass >> def: value [

	def := value
]

{ #category : #printing }
AssertionValueTestClass >> printOn: aStream [

	aStream
		nextPutAll: self class name;
		nextPutAll: ' new abc: '.
	abc printOn: aStream
]
