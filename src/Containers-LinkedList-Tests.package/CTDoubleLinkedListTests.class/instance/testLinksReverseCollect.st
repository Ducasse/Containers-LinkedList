tests
testLinksReverseCollect
	| list fifthItem |
	list := CTDoubleLinkedList doubleLinkedListWith10Integers.
	fifthItem := list linkAt: 5.
	self
		assert:
			(fifthItem
				linksReverseCollect: [ :aLink | 
					self assert: (aLink isKindOf: CTDoubleLink).
					aLink value ]) asArray
		equals: CTDoubleLinkedList doubleLinkedListFrom4To1 asArray