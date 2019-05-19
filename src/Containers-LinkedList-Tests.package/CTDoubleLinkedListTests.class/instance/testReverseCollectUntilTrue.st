tests
testReverseCollectUntilTrue
	| list fifthItem |
	list := CTDoubleLinkedList doubleLinkedListWith10Integers.
	fifthItem := list linkAt: 5.
	self
		assert:
			(fifthItem
				reverseCollect: [ :aValue | 
					self assert: (aValue isKindOf: Number).
					aValue ] untilTrue: [ :item | item = 2 ]) asArray
		equals: #(4 3) asArray