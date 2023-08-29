"
I am a debugger that knows to call `selectionInterval:for:` on the `Exception` that invokes a debugger.

This allows rewriting a `self test: [...]` into `self assert: [...] equals: ...`.

It's the opposite of TDD, but useful in its own right.

I subclass `StDebugger`, `AssertValue`

See [My Kind of REPL](https://ianthehenry.com/posts/my-kind-of-repl/)
"
Class {
	#name : #AssertValueDebugger,
	#superclass : #StDebugger,
	#traits : 'TDebugger',
	#classTraits : 'TDebugger classTrait',
	#category : #'AssertValue-Debugger-View'
}

{ #category : #commands }
AssertValueDebugger class >> buildCommandsGroupWith: stDebuggerInstance forRoot: rootCommandGroup [

	StDebuggerStackCommandTreeBuilder
		buildCommandsGroupWith: stDebuggerInstance
		forRoot: rootCommandGroup.
	AvDebuggerToolbarCommandTreeBuilder
		buildCommandsGroupWith: stDebuggerInstance
		forRoot: rootCommandGroup.
		StDebuggerCodeCommandTreeBuilder
		buildCommandsGroupWith: stDebuggerInstance
		forRoot: rootCommandGroup.

	StDebuggerConfigurationCommandTreeBuilder
		buildCommandsGroupWith: stDebuggerInstance
		forRoot: rootCommandGroup
]

{ #category : #accessing }
AssertValueDebugger class >> defaultDebuggerRank [

	^ 11
]

{ #category : #'commands - support' }
AssertValueDebugger >> buildContextMenus [

	| stackGroup debuggerCommandGroup |

	super buildContextMenus.
	
	debuggerCommandGroup := self rootCommandsGroup.
	"Av menu"
	stackGroup := debuggerCommandGroup
	              / AvDebuggerToolbarCommandTreeBuilder groupName.
	stackTable contextMenu: stackGroup beRoot asMenuPresenter.
	stackTable contextKeyBindings:
		(self keybindsForFromContextMenu: stackGroup)
]

{ #category : #initialization }
AssertValueDebugger >> initializeShortcuts: aWindowPresenter [

	super initializeShortcuts: aWindowPresenter.
	aWindowPresenter
		bindKeyCombination: AvSaveAndGoCommand defaultShortcut
		toAction: [ self saveAndGo ]
]

{ #category : #actions }
AssertValueDebugger >> saveAndGo [

	self
		acceptCodeChanges: self code text
		forContext: self selectedContext.

	self proceedDebugSession
]

{ #category : #'presenter - code' }
AssertValueDebugger >> updateCodeFromContext: aContext [

	| selectionInterval formerCodeInteractionModel |
	aContext ifNil: [ ^ self clearCode ].

	self recordUnsavedCodeChanges.
	selectionInterval := self selectedCodeRangeForContext: aContext.

	aContext sourceCode = self code text ifFalse: [
		self updateSourceCodeFor: aContext ].
	(self class lookupSelector: #updateCodeFromContext)
	== thisContext sender method ifTrue: [
		selectionInterval := debuggerActionModel exception
			                     selectionInterval: selectionInterval
			                     for: self ].
	formerCodeInteractionModel := self code interactionModel.
	self code beForContext: aContext.
	"add bindings of the old interaction model in the new one"
	formerCodeInteractionModel ifNotNil: [
		formerCodeInteractionModel bindings associations do: [ :assoc |
			self code interactionModel addBinding: assoc ] ].
	self code selectionInterval:
		(selectionInterval last to: selectionInterval last - 1).
	self
		updateCodeTextSegmentDecoratorsIn: aContext
		forInterval: selectionInterval
]
