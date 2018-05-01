testing
testOneRemoveLast
	| list |
	list := CTDoubleLinkedList new.
	list add: #one.
	list removeLast.
	self assert: list isEmpty.
	list add: #one.
	list removeLast.
	self assert: list isEmpty