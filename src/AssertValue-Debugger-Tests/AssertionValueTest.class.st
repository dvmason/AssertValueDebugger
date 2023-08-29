Class {
	#name : #AssertionValueTest,
	#superclass : #TestCase,
	#category : #'AssertValue-Debugger-Tests'
}

{ #category : #tests }
AssertionValueTest >> test3 [

	self assert: ('abdcsefg' copyFrom: 2 to: 5) equals: 'bdcs'
]

{ #category : #tests }
AssertionValueTest >> testNone [

	self assert: 25+17 equals: 42 "with comment"
]

{ #category : #tests }
AssertionValueTest >> testNone2 [

	self try: 25+17 "with comment"
]

{ #category : #tests }
AssertionValueTest >> testString [

	self assert: 42 asString equals: '42'. "with comment"
	self assert: (6 * 7) asString equals: '42'
]

{ #category : #tests }
AssertionValueTest >> testString2 [

	self try: 42 asString. "with comment"
	self try: (6 * 7) asString
]
