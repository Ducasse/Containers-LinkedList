tests
testReverseCollect
	| list fifthItem |
	list := CTDoubleLinkedList doubleLinkedListWith10Integers.
	fifthItem := list linkAt: 5.
	self
		assert:
			(fifthItem
				reverseCollect: [ :aValue | 
					self assert: (aValue isKindOf: Number).
					aValue ]) asArray
		equals: CTDoubleLinkedList doubleLinkedListFrom4To1 asArray