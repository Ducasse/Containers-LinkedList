"
A set of test cases which thoroughly test functionality of the LinkedList class.
"
Class {
	#name : #CTLinkedListTest,
	#superclass : #TestCase,
	#traits : 'TAddTest - {#testTAddWithOccurences. #testTAddTwice. #testTWriteTwice} + TEmptyTest + TIterateTest + TIterateSequencedReadableTest + TPrintTest + TAsStringCommaAndDelimiterSequenceableTest + TIndexAccess + TSequencedElementAccessTest + TSubCollectionAccess + (TConvertTest - {#testAsByteArray. #integerCollectionWithoutEqualElements}) + (TCopyPartOfSequenceable - {#testCopyEmptyMethod}) + (TCopySequenceableSameContents - {#testSortBy. #integerCollection}) + TCopySequenceableWithOrWithoutSpecificElements + TCopyTest + (TCopySequenceableWithReplacement - {#testCopyReplaceAllWithManyOccurence. #collectionWith2TimeSubcollection}) + TBeginsEndsWith + TRemoveTest + TSetArithmetic + TIncludesWithIdentityCheckTest + TStructuralEqualityTest + TOccurrencesTest + TSortTest',
	#classTraits : 'TAddTest classTrait + TEmptyTest classTrait + TIterateTest classTrait + TIterateSequencedReadableTest classTrait + TPrintTest classTrait + TAsStringCommaAndDelimiterSequenceableTest classTrait + TIndexAccess classTrait + TSequencedElementAccessTest classTrait + TSubCollectionAccess classTrait + TConvertTest classTrait + TCopyPartOfSequenceable classTrait + TCopySequenceableSameContents classTrait + TCopySequenceableWithOrWithoutSpecificElements classTrait + TCopyTest classTrait + TCopySequenceableWithReplacement classTrait + TBeginsEndsWith classTrait + TRemoveTest classTrait + TSetArithmetic classTrait + TIncludesWithIdentityCheckTest classTrait + TStructuralEqualityTest classTrait + TOccurrencesTest classTrait + TSortTest classTrait',
	#instVars : [
		'nextLink',
		'n',
		'list',
		'link1',
		'link2',
		'link3',
		'link4',
		'nonEmpty',
		'otherList',
		'link',
		'collectionWithNil',
		'collectionWithoutNil',
		'nonEmpty1Element',
		'collectionWithoutEqualElements',
		'elementNotIn',
		'elementIn',
		'sameAtendAndBegining',
		'collection5Elements',
		'collectResult',
		'unsortedCollection',
		'sortedCollection'
	],
	#category : 'Containers-LinkedList-Tests'
}

{ #category : #requirements }
CTLinkedListTest >> accessCollection [
	^collectionWithoutEqualElements 
]

{ #category : #requirements }
CTLinkedListTest >> anotherElementNotIn [
" return an element included  in 'collection' "
	^ elementNotIn 
]

{ #category : #requirements }
CTLinkedListTest >> anotherElementOrAssociationIn [
	" return an element (or an association for Dictionary ) present  in 'collection' "
	^ self collection anyOne
]

{ #category : #requirements }
CTLinkedListTest >> anotherElementOrAssociationNotIn [
	" return an element (or an association for Dictionary )not present  in 'collection' "
	^ elementNotIn 
]

{ #category : #requirements }
CTLinkedListTest >> collection [
	^ self nonEmpty
]

{ #category : #'class/instances' }
CTLinkedListTest >> collectionClass [
	"return the class to be used to create instances of the class tested"
	^ CTLinkedList
]

{ #category : #requirements }
CTLinkedListTest >> collectionMoreThan1NoDuplicates [
	"Return a collection of size 5 without equal elements"
	^ collectionWithoutEqualElements
]

{ #category : #requirements }
CTLinkedListTest >> collectionNotIncluded [
	"Return a collection for wich each element is not included in 'nonEmpty'"
	
	^ collectionWithoutNil 
]

{ #category : #requirements }
CTLinkedListTest >> collectionWith1TimeSubcollection [
	"Return a collection including 'oldSubCollection'  only one time"
	^ self oldSubCollection 
]

{ #category : #requirements }
CTLinkedListTest >> collectionWithCopyNonIdentical [
	"Return a collection that include elements for which 'copy' return a different object (this is not the case of SmallInteger)"
	^ collectionWithoutEqualElements
]

{ #category : #requirements }
CTLinkedListTest >> collectionWithElement [
	"Returns a collection that already includes what is returned by #element."
	^ self collection
]

{ #category : #requirements }
CTLinkedListTest >> collectionWithElementsToRemove [
	"Return a collection of elements included in 'nonEmpty'"
	^ self nonEmpty 
]

{ #category : #requirements }
CTLinkedListTest >> collectionWithSortableElements [
	"Return a collection only including elements that can be sorted (understanding '<' )"
	^ collection5Elements 
]

{ #category : #requirements }
CTLinkedListTest >> collectionWithoutEqualElements [

" return a collection not including equal elements "
	^collectionWithoutEqualElements 
]

{ #category : #requirements }
CTLinkedListTest >> collectionWithoutNilElements [
	"Return a collection that doesn't includes a nil element"
	
	^ collectionWithoutNil 
]

{ #category : #'class/instances' }
CTLinkedListTest >> element [
	^ link ifNil: [link := self valueLinkElementClass value: 42 ]
]

{ #category : #requirements }
CTLinkedListTest >> elementInForElementAccessing [
	"Return an element inculded in 'accessCollection '"
	^ elementIn 
]

{ #category : #requirements }
CTLinkedListTest >> elementInForIndexAccessing [
	"Return an element included in 'accessCollection'"
	^ elementIn 
]

{ #category : #'class/instances' }
CTLinkedListTest >> elementNotIn [
	^ self simpleLinkElementClass new
]

{ #category : #requirements }
CTLinkedListTest >> elementNotInForElementAccessing [
	"Return an element not included in 'accessCollection'"
	^ elementNotIn 
]

{ #category : #requirements }
CTLinkedListTest >> elementNotInForIndexAccessing [
	"Return an element not included in 'accessCollection'"
	^ elementNotIn 
]

{ #category : #requirements }
CTLinkedListTest >> elementNotInForOccurrences [
	"Return an element notIncluded in #collectionWithoutEqualElements"
	^ elementNotIn 
]

{ #category : #'class/instances' }
CTLinkedListTest >> elementToAdd [
	"return an element of type 'nonEmpy' elements'type'"
	^ self valueLinkElementClass value: 77
]

{ #category : #'tests - empty' }
CTLinkedListTest >> empty [
	^ list
]

{ #category : #requirements }
CTLinkedListTest >> indexInForCollectionWithoutDuplicates [
	"Return an index between 'collectionWithoutEqualsElements'  bounds"
	^ 2
]

{ #category : #requirements }
CTLinkedListTest >> indexInNonEmpty [
	"Return an index between bounds of 'nonEmpty'"

	^ self nonEmpty size
]

{ #category : #'class/instances' }
CTLinkedListTest >> linkedList [
	^ self collectionClass new
]

{ #category : #requirements }
CTLinkedListTest >> moreThan3Elements [
	"Return a collection including atLeast 3 elements"
	^ collectionWithoutEqualElements 
]

{ #category : #requirements }
CTLinkedListTest >> moreThan4Elements [
	"Return a collection including at leat 4 elements"
	^ collectionWithoutEqualElements 
]

{ #category : #accessing }
CTLinkedListTest >> n [
	^n
]

{ #category : #accessing }
CTLinkedListTest >> n: number [
	n := number.
	
]

{ #category : #accessing }
CTLinkedListTest >> nextLink [
	^nextLink
]

{ #category : #accessing }
CTLinkedListTest >> nextLink: aLink [
	nextLink := aLink
]

{ #category : #'class/instances' }
CTLinkedListTest >> nonEmpty [
	^ nonEmpty ifNil: [nonEmpty := self collectionClass with: 5 with: 4 with: 3 with: 2 with: 1 with: self element]
]

{ #category : #requirements }
CTLinkedListTest >> nonEmpty1Element [
	"Return a collection of size 1 including one element"
	^ nonEmpty1Element 
]

{ #category : #requirements }
CTLinkedListTest >> nonEmptyMoreThan1Element [
	"Return a collection that don't includes equal elements'" 
	^collectionWithoutNil 
]

{ #category : #requirements }
CTLinkedListTest >> nonEmptyWithoutEqualElements [
	"Return a collection without equal elements "
	^ collectionWithoutEqualElements 
]

{ #category : #requirements }
CTLinkedListTest >> oldSubCollection [
	" return a subCollection included in collectionWith1TimeSubcollection .
	ex :   subCollection := #( 2 3 4) and collectionWith1TimeSubcollection := #(1 2 3 4 5)"
	^ self nonEmpty 
]

{ #category : #'class/instances' }
CTLinkedListTest >> otherCollection [
	^ otherList ifNil: [otherList := self collectionClass with: self simpleLinkElementClass new with: self simpleLinkElementClass new]
]

{ #category : #requirements }
CTLinkedListTest >> replacementCollection [
	"Return a collection that will be used to replace 'oldSubcollection' in ' collectionWith1TimeSubcollection'  " 
	^ collectionWithoutNil 
]

{ #category : #requirements }
CTLinkedListTest >> result [
	"Returns a collection of the classes of elements in #collection"
	 ^ collectResult
]

{ #category : #running }
CTLinkedListTest >> setUp [
	super setUp.
	list := self linkedList.
	link1 := 133.
	link2 := 'test'.
	link3 := $h.
	link4 := Set new.
	elementNotIn := CTLink new.
	collectionWithoutNil := CTLinkedList new
		add: link1;
		add: link2;
		add: link3;
		yourself.
	elementIn := 'thisElementIsIncluded'.
	collectionWithoutEqualElements := CTLinkedList new
		add: elementIn;
		add: 'pewpew';
		add: 'normal links';
		add: 'are no fun!';
		add: $x;
		yourself.
	collection5Elements := collectionWithoutEqualElements.
	unsortedCollection := CTLinkedList new
		addAll: #(57 937 92 49 0 78 -87);
		yourself.
	sortedCollection := CTLinkedList new
		addAll: #(-87 0 49 57 78 92 937);
		yourself.
	"sameAttendAndBegining := LinkedList new add: Link new; add: Link new ; add: Link new; yourself."
	link := CTValueLink value: 42.
	nonEmpty1Element := CTLinkedList new
		add: CTLink new;
		yourself
	"so that we can recognize this link"
	"nonEmpty := LinkedList with: link with: Link new."
	"otherList := LinkedList with: Link new with: Link new."
]

{ #category : #'class/instances' }
CTLinkedListTest >> simpleLinkElementClass [

	^ CTLink
]

{ #category : #requirements }
CTLinkedListTest >> sortedInAscendingOrderCollection [
	"Return a collection sorted in ascending order"
	^ sortedCollection
	
]

{ #category : #'class/instances' }
CTLinkedListTest >> speciesClass [
	
	^ CTLinkedList
]

{ #category : #requirements }
CTLinkedListTest >> subCollectionNotIn [
" return a collection for which at least one element is not included in 'accessCollection' "
	^ collectionWithoutNil 
]

{ #category : #running }
CTLinkedListTest >> tearDown [
	list := nil.
	link1 := nil.
	link2 := nil.
	link3 := nil.
	link4 := nil.
	
	link := nil.
	nonEmpty := nil.
	otherList := nil.
	
	^ super tearDown
]

{ #category : #testing }
CTLinkedListTest >> test01add [
	self assert: list isEmpty.
	list add: link1.
	self assert: list size = 1.
	self assert: list first = link1.
	
	list add: link2.
	self assert: list size = 2.
	self assert: list first = link1.
	self assert: list second = link2.
	
	list add: link3.
	self assert: list size = 3.
	self assert: list first = link1.
	self assert: list second = link2.
	self assert: list third = link3.
	
	list add: link4.
	self assert: list size = 4.
	self assert: list first = link1.
	self assert: list second = link2.
	self assert: list third = link3.
	self assert: list fourth = link4
]

{ #category : #testing }
CTLinkedListTest >> test02addLast [
	self assert: list isEmpty.
	
	list addLast: link1.
	self assert: list size = 1.
	self assert: list first = link1.
	
	list addLast: link2.
	self assert: list size = 2.
	self assert: list first = link1.
	self assert: list second = link2.
	
	list addLast: link3.
	self assert: list size = 3.
	self assert: list first = link1.
	self assert: list second = link2.
	self assert: list third = link3.
	
	list addLast: link4.
	self assert: list size = 4.
	self assert: list first = link1.
	self assert: list second = link2.
	self assert: list third = link3.
	self assert: list fourth = link4
]

{ #category : #testing }
CTLinkedListTest >> test03addFirst [
	self assert: list isEmpty.
	
	list addFirst: link1.
	self assert: list size = 1.
	self assert: list first = link1.
	
	list addFirst: link2.
	self assert: list size = 2.
	self assert: list first = link2.
	self assert: list second = link1.
	
	list addFirst: link3.
	self assert: list size = 3.
	self assert: list first = link3.
	self assert: list second = link2.
	self assert: list third = link1.
	
	list addFirst: link4.
	self assert: list size = 4.
	self assert: list first = link4.
	self assert: list second = link3.
	self assert: list third = link2.
	self assert: list fourth = link1
]

{ #category : #testing }
CTLinkedListTest >> test04addBefore [
	self assert: list isEmpty.
	
	list add: link1.
	self assert: list size = 1.
	self assert: list first == link1.
	
	list add: link2 before: link1.
	self assert: list size = 2.
	self assert: list first == link2.
	self assert: list second == link1.
	
	list add: link3 before: link1.
	self assert: list size = 3.
	self assert: list first == link2.
	self assert: list second == link3.
	self assert: list third == link1.
	
	list add: link4 before: link1.
	self assert: list size = 4.
	self assert: list first == link2.
	self assert: list second == link3.
	self assert: list third == link4.
	self assert: list fourth == link1
]

{ #category : #testing }
CTLinkedListTest >> test05addBefore [
	self assert: list isEmpty.
	
	list add: link1.
	self assert: list size = 1.
	self assert: list first == link1.
	
	list add: link2 before: link1.
	self assert: list size = 2.
	self assert: list first == link2.
	self assert: list second == link1.
	
	list add: link3 before: link2.
	self assert: list size = 3.
	self assert: list first == link3.
	self assert: list second == link2.
	self assert: list third == link1.
	
	list add: link4 before: link3.
	self assert: list size = 4.
	self assert: list first == link4.
	self assert: list second == link3.
	self assert: list third == link2.
	self assert: list fourth == link1
]

{ #category : #testing }
CTLinkedListTest >> test06addAfter [
	self assert: list isEmpty.
	
	list add: link1.
	self assert: list size = 1.
	self assert: list first == link1.
	
	list add: link2 after: link1.
	self assert: list size = 2.
	self assert: list first == link1.
	self assert: list second == link2.
	
	list add: link3 after: link2.
	self assert: list size = 3.
	self assert: list first == link1.
	self assert: list second == link2.
	self assert: list third == link3.
	
	list add: link4 after: link3.
	self assert: list size = 4.
	self assert: list first == link1.
	self assert: list second == link2.
	self assert: list third == link3.
	self assert: list fourth == link4
]

{ #category : #testing }
CTLinkedListTest >> test07addAfter [
	self assert: list isEmpty.
	
	list add: link1.
	self assert: list size = 1.
	self assert: list first == link1.
	
	list add: link2 after: link1.
	self assert: list size = 2.
	self assert: list first == link1.
	self assert: list second == link2.
	
	list add: link3 after: link1.
	self assert: list size = 3.
	self assert: list first == link1.
	self assert: list second == link3.
	self assert: list third == link2.
	
	list add: link4 after: link1.
	self assert: list size = 4.
	self assert: list first == link1.
	self assert: list second == link4.
	self assert: list third == link3.
	self assert: list fourth == link2
]

{ #category : #testing }
CTLinkedListTest >> test08addAfter [
	| l first |
	l := CTLinkedList new.
	first := self class new n: 1.
	l add: first.
	l add: (self class new n: 3).
	self assert: (l collect: [:e | e n]) asArray equals: #(1 3).
	l add: (self class new n: 2) after: first.
	self assert: (l collect: [:e | e n]) asArray equals: #(1 2 3)
]

{ #category : #testing }
CTLinkedListTest >> test09addAfter [
	| l last |
	l := CTLinkedList new.
	last := self class new n: 2.
	l add: (self class new n: 1).
	l add: last.
	self assert: (l collect:[:e | e n]) asArray equals: #(1 2).
	l add: (self class new n: 3) after: last.
	self assert: (l collect:[:e | e n]) asArray equals: #(1 2 3).
]

{ #category : #'tests - fixture' }
CTLinkedListTest >> test0FixtureIndexAccessTest [
	| res |
	self collectionMoreThan1NoDuplicates.
	self assert: self collectionMoreThan1NoDuplicates size = 5.
	res := true.
	self collectionMoreThan1NoDuplicates
		detect: [ :each | (self collectionMoreThan1NoDuplicates occurrencesOf: each) > 1 ]
		ifNone: [ res := false ].
	self assert: res = false.
	self elementInForIndexAccessing.
	self assert: (self collectionMoreThan1NoDuplicates includes: self elementInForIndexAccessing).
	self elementNotInForIndexAccessing.
	self deny: (self collectionMoreThan1NoDuplicates includes: self elementNotInForIndexAccessing)
]

{ #category : #testing }
CTLinkedListTest >> test10removeFirst [
	list add: link1.
	list add: link2.
	list add: link3.
	list add: link4.
	
	self assert: list size = 4.
	self assert: list first == link1.
	self assert: list second == link2.
	self assert: list third == link3.
	self assert: list fourth == link4.
	
	list removeFirst.
	self assert: list size = 3.
	self assert: list first == link2.
	self assert: list second == link3.
	self assert: list third == link4.
	
	list removeFirst.
	self assert: list size = 2.
	self assert: list first == link3.
	self assert: list second == link4.
	
	list removeFirst.
	self assert: list size = 1.
	self assert: list first == link4.
	
	list removeFirst.
	self assert: list isEmpty
]

{ #category : #testing }
CTLinkedListTest >> test11removeLast [
	list add: link1.
	list add: link2.
	list add: link3.
	list add: link4.
	
	self assert: list size = 4.
	self assert: list first == link1.
	self assert: list second == link2.
	self assert: list third == link3.
	self assert: list fourth == link4.
	
	list removeLast.
	self assert: list size = 3.
	self assert: list first == link1.
	self assert: list second == link2.
	self assert: list third == link3.
	
	list removeLast.
	self assert: list size = 2.
	self assert: list first == link1.
	self assert: list second == link2.
	
	list removeLast.
	self assert: list size = 1.
	self assert: list first == link1.
	
	list removeFirst.
	self assert: list isEmpty
]

{ #category : #testing }
CTLinkedListTest >> test12remove [
	list add: link1.
	list add: link2.
	list add: link3.
	list add: link4.
	
	self assert: list size = 4.
	self assert: list first == link1.
	self assert: list second == link2.
	self assert: list third == link3.
	self assert: list fourth == link4.
	
	list remove: link3.
	self assert: list size = 3.
	self assert: list first == link1.
	self assert: list second == link2.
	self assert: list third == link4.
	
	list remove: link2.
	self assert: list size = 2.
	self assert: list first == link1.
	self assert: list second == link4.
	
	list remove: link1.
	self assert: list size = 1.
	self assert: list first == link4.
	
	list remove: link4.
	self assert: list isEmpty
]

{ #category : #testing }
CTLinkedListTest >> test13remove [
	list add: link1.
	list add: link2.
	list add: link3.
	list add: link4.
	
	self assert: list size = 4.
	self assert: list first == link1.
	self assert: list second == link2.
	self assert: list third == link3.
	self assert: list fourth == link4.
	
	list remove: link1.
	self assert: list size = 3.
	self assert: list first == link2.
	self assert: list second == link3.
	self assert: list third == link4.
	
	list remove: link4.
	self assert: list size = 2.
	self assert: list first == link2.
	self assert: list second == link3.
	
	list remove: link2.
	self assert: list size = 1.
	self assert: list first == link3.
	
	list remove: link3.
	self assert: list isEmpty
]

{ #category : #testing }
CTLinkedListTest >> test14removeIfAbsent [
	list add: link1.
	
	self assert: list size = 1.
	self assert: list first == link1.
	
	list remove: link1.
	self assert: list isEmpty.
	
	[list remove: link1]
		on: Error
		do: [^ self].
		
	"The execution should not get here. If yes, something went wrong."
	self assert: false
]

{ #category : #testing }
CTLinkedListTest >> test22addAll [
	| link5 link6 link7 link8 listToBeAdded |
	link5 := CTLink new.
	link6 := CTLink new.
	link7 := CTLink new.
	link8 := CTLink new.
	
	list
		add: link1;
		add: link2;
		add: link3;
		add: link4.
		
	listToBeAdded := CTLinkedList new.
	listToBeAdded
		add: link5;
		add: link6;
		add: link7;
		add: link8.
		
	list addAll: listToBeAdded.
	
	self assert: (list at: 1) == link1.
	self assert: (list at: 2) == link2.
	self assert: (list at: 3) == link3.
	self assert: (list at: 4) == link4.
	self assert: (list at: 5) == link5.
	self assert: (list at: 6) == link6.
	self assert: (list at: 7) == link7.
	self assert: (list at: 8) == link8
]

{ #category : #tests }
CTLinkedListTest >> testAddAfter [

	| l first |
	l := CTLinkedList new.
	first := self class new n: 1.
	l add: first.
	l add: (self class new n: 3).
	self assert: (l collect: [:e | e n]) asArray equals: #(1 3).
	l add: (self class new n: 2) after: first.
	self assert: (l collect: [:e | e n]) asArray equals: #(1 2 3).
]

{ #category : #tests }
CTLinkedListTest >> testAddAfterLast [

	| l last |
	l := CTLinkedList new.
	last := self class new n: 2.
	l add: (self class new n: 1).
	l add: last.
	self assert: (l collect:[ :e | e n]) asArray equals: #(1 2). 
	l add: (self class new n: 3) after: last.
	self assert: (l collect:[ :e | e n]) asArray equals: #(1 2 3).
]

{ #category : #tests }
CTLinkedListTest >> testAddAfterLast2 [
	"LinkedListTest new testAddAfterLast2"

	| l first second third fourth |
	l := CTLinkedList new.
	first := self class new n: 1.
	second := self class new n: 2.
	third := self class new n: 3.
	fourth :=self class new n: 4.
	l addLast: first.
	l addLast: second.
	self assert: (l collect:[:e | e n]) asArray equals: #(1 2). 
	l add: third after: second.
	self assert: (l collect:[:e | e n]) asArray equals: #(1 2 3).
	l addLast: fourth.
	self assert: (l collect:[:e | e n]) asArray equals: #(1 2 3 4).
]

{ #category : #'tests - sequenceable' }
CTLinkedListTest >> testAtPut [
	| ll |
	ll := CTLinkedList new.
	ll add: 1.
	ll at: 1 put: 2.
	self assert: (ll at: 1) equals: 2
]

{ #category : #'tests - sequenceable' }
CTLinkedListTest >> testAtPutOutsideBounds [
	| ll |
	ll := CTLinkedList new.
	self should: [ ll at: 1 put: 1 ] raise: SubscriptOutOfBounds
]

{ #category : #'tests - creating' }
CTLinkedListTest >> testCreateAs [
	"Test that a LinkedList can be created by sending message #as: to another collection.
	Implementation note: this method is generic for sequenceable collection and should be traitified."
	| anotherCollection aLinkedList |
	anotherCollection := 1 to: 10.
	aLinkedList := anotherCollection as: CTLinkedList.
	self assert: (aLinkedList isMemberOf: CTLinkedList).
	self assert: aLinkedList size equals: anotherCollection size.
	aLinkedList with: anotherCollection do: [:nextElementOfLinkedList :nextElementOfAnotherCollection |
		self assert: nextElementOfLinkedList equals: nextElementOfAnotherCollection]
]

{ #category : #'tests - cycles' }
CTLinkedListTest >> testCycles [
  1 to: 42 do: [ :each |
    list := CTLinkedList withAll: (1 to: each).
    "Warning: the following statement creates a cycle,
     inspecting/viewing list will probably fail"
    list lastLink nextLink: list firstLink.
    self assert: list containsCycle ]
]

{ #category : #'tests - includes' }
CTLinkedListTest >> testIdentityIncludes [
	" test the comportement in presence of elements 'includes' but not 'identityIncludes' "

	" can not be used by collections that can't include elements for wich copy doesn't return another instance "

	| collection element |
	self collectionWithCopyNonIdentical.
	collection := self collectionWithCopyNonIdentical.
	element := collection anyOne copy.	"self assert: (collection includes: element)."
	self deny: (collection identityIncludes: element)
]

{ #category : #testing }
CTLinkedListTest >> testRemoveAll [
	| list2 |
	list add: link1.
	list add: link2.
	list add: link3.
	list add: link4.
	list2 := list copy.
	list removeAll.
	
	self assert: list size = 0.
	self assert: list2 size = 4 description: 'the copy has not been modified'
]

{ #category : #tests }
CTLinkedListTest >> testSort [
	|aLinkedList|
	aLinkedList := (CTLinkedList with: 1 with: 2).
	aLinkedList  sort: [ :a :b | a > b].
	self assert: aLinkedList equals: (CTLinkedList with: 2 with: 1)
]

{ #category : #'tests - swap' }
CTLinkedListTest >> testSwapAdjacent [
	|aList|
	aList := CTLinkedList with: 5 with: 4 with: 3 with: 2 with: 1.
	
	aList swap: 3 with: 4.
	self assert: (aList at: 3) equals: 2.
	self assert: (aList at: 4) equals: 3.
]

{ #category : #'tests - swap' }
CTLinkedListTest >> testSwapAdjacentEnd [
	|aList|
	aList := CTLinkedList with: 5 with: 4 with: 3 with: 2 with: 1.
	
	aList swap: 4 with: 5.
	self assert: (aList at: 4) equals: 1.
	self assert: (aList at: 5) equals: 2.
	self assert: aList last equals: 2.
]

{ #category : #'tests - swap' }
CTLinkedListTest >> testSwapAdjacentStart [
	|aList|
	aList := CTLinkedList with: 5 with: 4 with: 3 with: 2 with: 1.
	
	aList swap: 1 with: 2.
	self assert: (aList at: 1) equals: 4.
	self assert: (aList at: 2) equals: 5.
	self assert: aList first equals: 4.
]

{ #category : #'tests - swap' }
CTLinkedListTest >> testSwapBasic [
	|aList|
	aList := CTLinkedList with: 5 with: 4 with: 3 with: 2 with: 1.
	
	aList swap: 2 with: 4.
	self assert: (aList at: 2) equals: 2.
	self assert: (aList at: 4) equals: 4.

]

{ #category : #'tests - swap' }
CTLinkedListTest >> testSwapStartAndEnd [
	|aList|
	aList := CTLinkedList with: 5 with: 4 with: 3 with: 2 with: 1.
	
	aList swap: 1 with: 5.
	self assert: (aList at: 1) equals: 1.
	self assert: (aList at: 5) equals: 5.
	self assert: aList first equals: 1.
	self assert: aList last equals: 5.
]

{ #category : #'tests - adding' }
CTLinkedListTest >> testTAdd [

	| added |
	added := self otherCollection add: self element.
	self assert: added = self element. "equality or identity ?"
	self assert: (self otherCollection includes: self element).

	
]

{ #category : #requirements }
CTLinkedListTest >> unsortedCollection [
	"Return a collection that is not yet sorted"
	^ unsortedCollection
]

{ #category : #'class/instances' }
CTLinkedListTest >> valueLinkElementClass [

	^ CTValueLink
]
