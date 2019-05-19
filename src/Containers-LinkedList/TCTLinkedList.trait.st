Trait {
	#name : #TCTLinkedList,
	#category : 'Containers-LinkedList'
}

{ #category : #enumerating }
TCTLinkedList >> = otherCollection [ 
	"Answer true if the receiver is equivalent to the otherCollection.
	First test for identity, then rule out different species and sizes of
	collections. As a last resort, examine each element of the receiver
	and the otherCollection."

	self == otherCollection ifTrue: [^ true].
	self species == otherCollection species ifFalse: [^ false].
	^ self hasEqualElements: otherCollection
]

{ #category : #accessing }
TCTLinkedList >> at: index [
	"copied from linkedlist"

	^ (self linkAt: index) value
]

{ #category : #enumerating }
TCTLinkedList >> collect: collectBlock thenSelect: selectBlock [
	"Optimized version of SequenceableCollection>>#collect:#thenSelect:"

	| newCollection newElement |
	newCollection := self class new.
	self
		do: [ :each | 
			newElement := collectBlock value: each.
			(selectBlock value: newElement)
				ifTrue: [ newCollection add: newElement ] ].
	^ newCollection
]

{ #category : #enumerating }
TCTLinkedList >> do: elementBlock separatedBy: separatorBlock [
	"Evaluate the elementBlock for all elements in the receiver,
	and evaluate the separatorBlock between."

	| beforeFirst | 
	beforeFirst := true.
	self do:
		[:each |
		beforeFirst
			ifTrue: [beforeFirst := false]
			ifFalse: [separatorBlock value].
		elementBlock value: each]
]

{ #category : #enumerating }
TCTLinkedList >> hasEqualElements: otherCollection [
	"Answer whether the receiver's size is the same as otherCollection's
	size, and each of the receiver's elements equal the corresponding 
	element of otherCollection.
	This should probably replace the current definition of #= ."

	| size |
	(otherCollection isKindOf: SequenceableCollection)
		ifFalse: [ ^ false ].
	(size := self size) = otherCollection size
		ifFalse: [ ^ false ].
	1 to: size do: [ :index | 
		(self at: index) = (otherCollection at: index)
			ifFalse: [ ^ false ] ].
	^ true
]

{ #category : #enumerating }
TCTLinkedList >> hash [
	| hash |
	hash := self species hash.
	1 to: self size do: [ :i | hash := (hash + (self at: i) hash) hashMultiply ].
	^ hash
]

{ #category : #'as yet unclassified' }
TCTLinkedList >> ifNotEmpty: aBlock [
	"Evaluate the given block with the receiver as argument, answering its value
      unless the receiver is empty, in which case answer the receiver

      If the block has an argument, eval with the receiver as its argument,
      but it might be better to use ifNotEmptyDo: to make the code easier to
      understand"
	"Note that the fact that this method returns its argument in case the receiver is empty
	allows one to write expressions like the following ones:
		self classifyMethodAs: (myProtocol ifEmpty: ['As yet unclassified']"
	
    ^self isEmpty
          ifTrue: [self]
          ifFalse: [aBlock cull: self]
]

{ #category : #'as yet unclassified' }
TCTLinkedList >> isNotEmpty [
	^ self isEmpty not
]

{ #category : #private }
TCTLinkedList >> linkAt: index [
	"copied from linkedlist"

	^ self linkAt: index ifAbsent: [ self errorSubscriptBounds: index ]
]

{ #category : #private }
TCTLinkedList >> linkAt: index ifAbsent: errorBlock [
	"copied from linkedlist"

	| i |
	i := 0.
	self
		linksDo: [ :link | 
			(i := i + 1) = index
				ifTrue: [ ^ link ] ].
	^ errorBlock value
]

{ #category : #printing }
TCTLinkedList >> printElementsOn: aStream [
	"The original code used #skip:, but some streams do not support that,
	 and we don't really need it."

	aStream nextPut: $(.
	self do: [:element | aStream print: element] separatedBy: [aStream space].
	aStream nextPut: $)
]

{ #category : #printing }
TCTLinkedList >> printOn: aStream [ 
	"Append a sequence of characters that identify the receiver to aStream."

	super printOn: aStream.
	self printElementsOn: aStream
]

{ #category : #accessing }
TCTLinkedList >> size [
	"Answer how many elements the receiver contains."

	| tally |
	tally := 0.
	self do: [ :each | tally := tally + 1 ].
	^ tally
]
