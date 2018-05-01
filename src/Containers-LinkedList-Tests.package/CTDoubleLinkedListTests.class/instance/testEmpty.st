testing
testEmpty
	| list |
	list := CTDoubleLinkedList new.
	self assert: list isEmpty.
	self should: [ list first ] raise: CollectionIsEmpty.
	self should: [ list last ] raise: CollectionIsEmpty.
	list do: [ :each | self fail ]
	