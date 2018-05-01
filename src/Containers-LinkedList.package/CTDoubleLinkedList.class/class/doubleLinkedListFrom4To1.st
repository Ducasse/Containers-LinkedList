as yet unclassified
doubleLinkedListFrom4To1
	| list |
	list := CTDoubleLinkedList new.
	4 to: 1 by: -1 do: [ :each | list add: each ].
	^ list