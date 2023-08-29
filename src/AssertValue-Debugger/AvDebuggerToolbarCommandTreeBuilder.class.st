"
I build the Spec toolbar tree - basically adding the `Save & Go` button.
"
Class {
	#name : #AvDebuggerToolbarCommandTreeBuilder,
	#superclass : #StDebuggerToolbarCommandTreeBuilder,
	#category : #'AssertValue-Debugger-Model'
}

{ #category : #'accessing - commands classes' }
AvDebuggerToolbarCommandTreeBuilder >> executionControlCommandClasses [

	^ super executionControlCommandClasses , { AvSaveAndGoCommand }
]
