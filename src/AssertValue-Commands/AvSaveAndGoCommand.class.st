"
I am the actual executer that is bound to the `Save & Go` button.
"
Class {
	#name : #AvSaveAndGoCommand,
	#superclass : #StDebuggerCommand,
	#category : #'AssertValue-Commands'
}

{ #category : #default }
AvSaveAndGoCommand class >> defaultDescription [

	^ 'Save and compile the modified source, relinquish debugger control and proceed execution from the start of the current method.'
]

{ #category : #initialization }
AvSaveAndGoCommand class >> defaultIconName [

	^ #debuggerProceed
]

{ #category : #default }
AvSaveAndGoCommand class >> defaultName [

	<toolbarDebugCommand: 1200>
	^ 'Save&Go'
]

{ #category : #initialization }
AvSaveAndGoCommand class >> defaultShortcut [

	^ $g meta
]

{ #category : #testing }
AvSaveAndGoCommand >> appliesTo: aDebugger [

	^ true
]

{ #category : #executing }
AvSaveAndGoCommand >> execute [

	self debugger saveAndGo
]
