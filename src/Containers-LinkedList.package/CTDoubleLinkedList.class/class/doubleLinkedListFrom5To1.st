as yet unclassified
doubleLinkedListFrom5To1
	| list |
	list := CTDoubleLinkedList new.
	5 to: 1 by: -1 do: [ :each | list add: each ].
	^ list