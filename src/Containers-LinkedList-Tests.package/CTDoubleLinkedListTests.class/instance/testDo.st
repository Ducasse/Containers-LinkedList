tests
testDo
	| list value |
	list := CTDoubleLinkedList new.
	list addAll: (1 to: 10).
	value := 1.
	list do: [ :each |
		self assert: each equals: value.
		value := value + 1 ]