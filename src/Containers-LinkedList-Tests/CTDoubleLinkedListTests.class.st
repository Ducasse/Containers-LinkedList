Class {
	#name : #CTDoubleLinkedListTests,
	#superclass : #TestCase,
	#category : 'Containers-LinkedList-Tests'
}

{ #category : #tests }
CTDoubleLinkedListTests >> testAddAfterLink [
	| list link |
	list := CTDoubleLinkedList new.
	list add: 1.
	link := list add: 2.
	list add: 3.
	list add: 0 afterLink: link.
	self assert: list asArray equals: #( 1 2 0 3 )
]

{ #category : #tests }
CTDoubleLinkedListTests >> testAddBeforeLink [
	| list link |
	list := CTDoubleLinkedList new.
	list add: 1.
	link := list add: 2.
	list add: 3.
	list add: 0 beforeLink: link.
	self assert: list asArray equals: #( 1 0 2 3 )
]

{ #category : #tests }
CTDoubleLinkedListTests >> testAddFirst [
	| list |
	list := CTDoubleLinkedList new.
	1 to: 3 do: [ :each | list add: each ].
	list addFirst: 0.
	self deny: list isEmpty.
	self assert: list first equals: 0.
	self assert: list last equals: 3.
	self assert: list asArray equals: #( 0 1 2 3 )
]

{ #category : #tests }
CTDoubleLinkedListTests >> testAddLast [
	| list |
	list := CTDoubleLinkedList new.
	1 to: 3 do: [ :each | list add: each ].
	list addLast: 0.
	self deny: list isEmpty.
	self assert: list first equals: 1.
	self assert: list last equals: 0.
	self assert: list asArray equals: #( 1 2 3 0 )
]

{ #category : #tests }
CTDoubleLinkedListTests >> testCollect [
	| list doubles |
	list := CTDoubleLinkedList new.
	list addAll: #(1 2 3).
	doubles := list collect: [ :each | each * 2 ].
	self assert: doubles asArray equals: #(2 4 6)
]

{ #category : #tests }
CTDoubleLinkedListTests >> testDo [
	| list value |
	list := CTDoubleLinkedList new.
	list addAll: (1 to: 10).
	value := 1.
	list do: [ :each |
		self assert: each equals: value.
		value := value + 1 ]
]

{ #category : #tests }
CTDoubleLinkedListTests >> testEmpty [
	| list |
	list := CTDoubleLinkedList new.
	self assert: list isEmpty.
	self should: [ list first ] raise: CollectionIsEmpty.
	self should: [ list last ] raise: CollectionIsEmpty.
	list do: [ :each | self fail ]
	
]

{ #category : #tests }
CTDoubleLinkedListTests >> testFirstAndLastLink [
	| list firstLink secondLink |
	list := CTDoubleLinkedList new.
	self should: [ list firstLink ] raise: CollectionIsEmpty. 
	self should: [ list lastLink ] raise: CollectionIsEmpty. 
	self should: [ list first ] raise: CollectionIsEmpty. 
	self should: [ list last ] raise: CollectionIsEmpty. 
	firstLink := list add: #one.
	self assert: list firstLink equals: firstLink.
	self assert: list first equals: list last.
	self assert: list firstLink equals: list lastLink.
	self assert: list firstLink value equals: #one.
	secondLink := list add: #two.
	self assert: list firstLink equals: firstLink.
	self assert: list lastLink equals: secondLink.
	self deny: list first = list last.
	self deny: list firstLink = list lastLink.
	self assert: list firstLink value equals: #one.
	self assert: list lastLink value equals: #two.


]

{ #category : #tests }
CTDoubleLinkedListTests >> testIncludes [
	| list |
	list := CTDoubleLinkedList new.
	list addAll: (1 to: 10).
	self assert: (list includes: 5).
	self deny: (list includes: 0)
]

{ #category : #tests }
CTDoubleLinkedListTests >> testLinksDo [
	| list links index |
	list := CTDoubleLinkedList new.
	links := OrderedCollection new.
	1 to: 10 do: [ :each |
		links add: (list add: each) ].
	index := 1.
	list linksDo: [ :each |
		self assert: each equals: (links at: index).
		self assert: each value equals: index.
		index := index + 1 ]
]

{ #category : #tests }
CTDoubleLinkedListTests >> testLinksReverseCollect [
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
]

{ #category : #tests }
CTDoubleLinkedListTests >> testOne [
	| list |
	list := CTDoubleLinkedList new.
	list add: #one.
	self deny: list isEmpty.
	self assert: list first equals: #one.
	self assert: list last equals: #one.
	self assert: list asArray equals: #( one )
]

{ #category : #tests }
CTDoubleLinkedListTests >> testOneRemoveFirst [
	| list |
	list := CTDoubleLinkedList new.
	list add: #one.
	list removeFirst.
	self assert: list isEmpty.
	list add: #one.
	list removeLast.
	self assert: list isEmpty
]

{ #category : #tests }
CTDoubleLinkedListTests >> testOneRemoveLast [
	| list |
	list := CTDoubleLinkedList new.
	list add: #one.
	list removeLast.
	self assert: list isEmpty.
	list add: #one.
	list removeLast.
	self assert: list isEmpty
]

{ #category : #tests }
CTDoubleLinkedListTests >> testReject [
	| list even |
	list := CTDoubleLinkedList new.
	list addAll: (1 to: 10).
	even := list reject: [ :each | each odd ].
	self assert: even asArray equals: #(2 4 6 8 10)
]

{ #category : #tests }
CTDoubleLinkedListTests >> testReverseCollect [
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
]

{ #category : #tests }
CTDoubleLinkedListTests >> testReverseCollectUntilTrue [
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
]

{ #category : #tests }
CTDoubleLinkedListTests >> testReverseDo [
	| list value |
	list := CTDoubleLinkedList new.
	list addAll: (1 to: 10).
	value := 10.
	list reverseDo: [ :each |
		self assert: each equals: value.
		value := value - 1 ]
]

{ #category : #tests }
CTDoubleLinkedListTests >> testReverseLinksDo [
	| list links index |
	list := CTDoubleLinkedList new.
	links := OrderedCollection new.
	1 to: 10 do: [ :each |
		links add: (list add: each) ].
	index := 10.
	list reverseLinksDo: [ :each |
		self assert: each equals: (links at: index).
		self assert: each value equals: index.
		index := index - 1 ]
]

{ #category : #tests }
CTDoubleLinkedListTests >> testSelect [
	| list even |
	list := CTDoubleLinkedList new.
	list addAll: (1 to: 10).
	even := list select: [ :each | each even ].
	self assert: even asArray equals: #(2 4 6 8 10)
]

{ #category : #tests }
CTDoubleLinkedListTests >> testThree [
	| list |
	list := CTDoubleLinkedList new.
	1 to: 3 do: [ :each | list add: each ].
	self deny: list isEmpty.
	self assert: list first equals: 1.
	self assert: list last equals: 3.
	self assert: list asArray equals: #( 1 2 3 )
]

{ #category : #tests }
CTDoubleLinkedListTests >> testThreeRemoveFirst [
	| list link |
	list := CTDoubleLinkedList new.
	1 to: 3 do: [ :each | list add: each ].
	link := list removeFirst.
	self assert: link value equals: 1.
	self assert: list first equals: 2.
	self assert: list last equals: 3.
	self assert: list asArray equals: #( 2 3 )
]

{ #category : #tests }
CTDoubleLinkedListTests >> testThreeRemoveLast [
	| list link |
	list := CTDoubleLinkedList new.
	1 to: 3 do: [ :each | list add: each ].
	link := list removeLast.
	self assert: link value equals: 3.
	self assert: list first equals: 1.
	self assert: list last equals: 2.
	self assert: list asArray equals: #( 1 2 )
]

{ #category : #tests }
CTDoubleLinkedListTests >> testThreeRemoveLink [
	| list link |
	list := CTDoubleLinkedList new.
	list add: 1.
	link := list add: 2.
	list add: 3.
	list removeLink: link.
	self assert: list first equals: 1.
	self assert: list last equals: 3.
	self assert: list asArray equals: #( 1 3 )
]
