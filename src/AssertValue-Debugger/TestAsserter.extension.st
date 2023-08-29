Extension { #name : #TestAsserter }

{ #category : #'*AssertValue-Debugger' }
TestAsserter >> try: anObject [

	^ AssertionValue new
		  result: anObject;
		  signal
]
