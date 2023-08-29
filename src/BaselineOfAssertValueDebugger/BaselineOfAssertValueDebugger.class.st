Class {
	#name : #BaselineOfAssertValueDebugger,
	#superclass : #BaselineOf,
	#category : #BaselineOfAssertValueDebugger
}

{ #category : #baselines }
BaselineOfAssertValueDebugger >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec
			package: 'AssertValueDebugger';
			package: 'AssertValueDebugger-Tests'
			with: [ spec requires: #( AssertValueDebugger ) ].

		spec
			group: 'Core' with: #( 'AssertValueDebugger' );
			group: 'Tests'
			with: #( 'AssertValueDebugger-Tests' );
			group: 'default' with: #( 'Core' 'Tests' ) ]
]
