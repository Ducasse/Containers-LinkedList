instance creation
doubleLinkedListWith10Integers
	<sampleInstance>
	| list |
	list := CTDoubleLinkedList new.
	1 to: 10 do: [ :each | list add: each ].
	^ list