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
			package: 'AssertValue-Commands';
			package: 'AssertValue-Debugger' with: [ spec requires: #('AssertValue-Commands')];
			package: 'AssertValue-Debugger-Tests'
			with: [ spec requires: #( 'AssertValue-Debugger' ) ].

		spec
			group: 'Core' with: #( 'AssertValue-Debugger' );
			group: 'Tests' with: #( 'AssertValue-Debugger-Tests' );
			group: 'default' with: #( 'Core' 'Tests' ) ]
]
