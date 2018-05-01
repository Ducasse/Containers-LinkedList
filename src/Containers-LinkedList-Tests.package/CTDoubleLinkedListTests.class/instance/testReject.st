testing
testReject
	| list even |
	list := CTDoubleLinkedList new.
	list addAll: (1 to: 10).
	even := list reject: [ :each | each odd ].
	self assert: even asArray equals: #(2 4 6 8 10)