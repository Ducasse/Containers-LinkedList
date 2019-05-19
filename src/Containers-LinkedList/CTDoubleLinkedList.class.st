"
I am CTDoubleLinkedList, an ordered list data structure consisting of objects, most likely DoubleLinks or something compatible, connected to each other by forward and backwards links.

Note that some of my API deals with the elements that I hold, like any other collection, while some of my API references the links that I use internally (those usually have the word link in the selector name). Some methods accepts both values or links as argument (like #add:). Because I expose some of my internal structure, I can be broken quite easily.


"
Class {
	#name : #CTDoubleLinkedList,
	#superclass : #Object,
	#traits : 'TCTLinkedList',
	#classTraits : 'TCTLinkedList classTrait',
	#instVars : [
		'head',
		'tail'
	],
	#category : 'Containers-LinkedList'
}

{ #category : #'as yet unclassified' }
CTDoubleLinkedList class >> doubleLinkedListFrom4To1 [
	| list |
	list := CTDoubleLinkedList new.
	4 to: 1 by: -1 do: [ :each | list add: each ].
	^ list
]

{ #category : #'as yet unclassified' }
CTDoubleLinkedList class >> doubleLinkedListFrom5To1 [
	| list |
	list := CTDoubleLinkedList new.
	5 to: 1 by: -1 do: [ :each | list add: each ].
	^ list
]

{ #category : #'instance creation' }
CTDoubleLinkedList class >> doubleLinkedListWith10Integers [
	<sampleInstance>
	| list |
	list := CTDoubleLinkedList new.
	1 to: 10 do: [ :each | list add: each ].
	^ list
]

{ #category : #'instance creation' }
CTDoubleLinkedList class >> new: anInt [
	"Copied from linked list"

	"LinkedList don't need capacity"

	^ self new
]

{ #category : #adding }
CTDoubleLinkedList >> add: anObjectOrLink [
	"Add anObjectOrLink at the end of me.
	Return the internal link object."
	
	^ self addLast: anObjectOrLink
]

{ #category : #adding }
CTDoubleLinkedList >> add: anObjectOrLink afterLink: otherLink [
	"Add anObjectOrLink right after otherLink in me.
	When otherLink is not part of me, the result is undefined.
	Return the internal link object."

	| link otherLinkSuccessor |
	otherLink = tail
		ifTrue: [ ^ self addLast: anObjectOrLink ].
	link := anObjectOrLink asCtDoubleLink.
	otherLinkSuccessor := otherLink nextLink.
	otherLink nextLink: link.
	link previousLink: otherLink.
	link nextLink: otherLinkSuccessor.
	otherLinkSuccessor previousLink: link.
	^ link
]

{ #category : #adding }
CTDoubleLinkedList >> add: anObjectOrLink beforeLink: otherLink [
	"Add anObjectOrLink right before otherLink in me.
	When otherLink is not part of me, the result is undefined.
	Return the internal link object."

	| link otherLinkPredeccessor |
	otherLink = head
		ifTrue: [ ^ self addFirst: anObjectOrLink ].
	link := anObjectOrLink asCtDoubleLink.
	otherLinkPredeccessor := otherLink previousLink.
	otherLink previousLink: link.
	link nextLink: otherLink.
	link previousLink: otherLinkPredeccessor.
	otherLinkPredeccessor nextLink: link.
	^ link
]

{ #category : #adding }
CTDoubleLinkedList >> addAll: collection [
	"Add all elements of collection to me, in order.
	Each can be either a value object or a link."
	
	collection do: [ :each | self add: each ]
]

{ #category : #adding }
CTDoubleLinkedList >> addFirst: anObjectOrLink [
	"Add anObjectOrLink to me, so that it becomes the first one.
	Return the internal link object."
	
	| link |
	link := anObjectOrLink asCtDoubleLink.
	link nextLink: head.
	head ifNotNil: [ head previousLink: link ].
	tail ifNil: [ tail := link ].
	head := link.
	^ link
]

{ #category : #adding }
CTDoubleLinkedList >> addLast: anObjectOrLink [
	"Add anObjectOrLink to me, so that it becomes the last one.
	Return the internal link object."

	| link |
	link := anObjectOrLink asCtDoubleLink.
	link previousLink: tail.
	tail ifNotNil: [ tail nextLink: link ].
	head ifNil: [ head := link ].
	tail := link.
	^ link
]

{ #category : #converting }
CTDoubleLinkedList >> asArray [
	"Return a new Array containing my elements"
	
	^ Array streamContents: [ :out |
		self do: [ :each | out nextPut: each ] ]
]

{ #category : #enumerating }
CTDoubleLinkedList >> collect: block [
	"Execute block for each of my elements and return a new instance of me containing the results."
	
	| result |
	result := self class new.
	self do: [ :each |
		result add: (block value: each) ].
	^ result
]

{ #category : #enumerating }
CTDoubleLinkedList >> do: block [
	"Execute block for each of my elements."

	self linksDo: [ :each | block value: each value ]
]

{ #category : #private }
CTDoubleLinkedList >> emptyCheck [
	self isEmpty
		ifTrue: [ CollectionIsEmpty signalWith: self ]
]

{ #category : #accessing }
CTDoubleLinkedList >> first [
	"Returnt the first element that I hold, also known as my head value.
	Signal a CollectionIsEmpty excpetion when I am empty."
	
	self emptyCheck.
	^ head value
]

{ #category : #accessing }
CTDoubleLinkedList >> firstLink [
	"Returnt the first link that I hold, also known as my head.
	Signal a CollectionIsEmpty excpetion when I am empty."
	
	self emptyCheck.
	^ head
]

{ #category : #testing }
CTDoubleLinkedList >> includes: object [
	"Return true when I hold object as a value, false otherwise."
	
	self do: [ :each |
		each = object ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #testing }
CTDoubleLinkedList >> isEmpty [
	"Return true when I contain no elements, false otherwise."

	^ head isNil and: [ tail isNil ]
]

{ #category : #accessing }
CTDoubleLinkedList >> last [
	"Returnt the last element that I hold, also known as my tail value.
	Signal a CollectionIsEmpty excpetion when I am empty."
	
	self emptyCheck.
	^ tail value
]

{ #category : #accessing }
CTDoubleLinkedList >> lastLink [
	"Returnt the last link that I hold, also known as my tail.
	Signal a CollectionIsEmpty excpetion when I am empty."
	
	self emptyCheck.
	^ tail
]

{ #category : #enumerating }
CTDoubleLinkedList >> linksDo: block [
	"Execute block for each of the links that I hold internally."
	
	| current |
	current := head.
	[ current isNil ] 
		whileFalse: [ 
	 		block value: current.
			current := current nextLink ]
]

{ #category : #enumerating }
CTDoubleLinkedList >> reject: block [
	"Execute block for each of my elements and return a new instance of me 
	containing those elements for which the block returned false."

	| result |
	result := self class new.
	self do: [ :each |
		(block value: each)
			ifFalse: [ result add: each ] ].
	^ result
]

{ #category : #removing }
CTDoubleLinkedList >> removeAll [
	"Remove all the elements that I hold."
	
	head := tail := nil
]

{ #category : #removing }
CTDoubleLinkedList >> removeFirst [
	"Remove my first element.
	Signal a CollectionIsEmpty excpetion when I am empty.
	Return the removed internal link."
	
	| link |
	self emptyCheck.
	link := head.
	head := head nextLink.
	head 
		ifNil: [ tail := nil ]
		ifNotNil: [ head previousLink: nil ].
	link clearLinks.
	^ link
]

{ #category : #removing }
CTDoubleLinkedList >> removeLast [
	"Remove my last element.
	Signal a CollectionIsEmpty excpetion when I am empty.
	Return the removed internal link."

	| link |
	self emptyCheck.
	link := tail.
	tail := tail previousLink.
	tail 
		ifNil: [ head := nil ]
		ifNotNil: [ tail nextLink: nil ].
	link clearLinks.
	^ link
]

{ #category : #removing }
CTDoubleLinkedList >> removeLink: link [
	"Remove the specified link.
	When otherLink is not part of me, the result is undefined.
	Return the removed internal link."

	| predecessor successor |
	predecessor := link previousLink.
	successor := link nextLink.
	predecessor
		ifNil: [ head := successor ]
		ifNotNil: [ predecessor nextLink: successor ].
	successor
		ifNil: [ tail := predecessor ]
		ifNotNil: [ successor previousLink: predecessor ].
	link clearLinks.
	^ link
]

{ #category : #enumerating }
CTDoubleLinkedList >> reverseDo: block [
	"Execute block for each of my elements, in reverse order."

	self reverseLinksDo: [ :each | block value: each value ]
]

{ #category : #enumerating }
CTDoubleLinkedList >> reverseLinksDo: block [
	"Execute block for each of the links that I hold internally, in reverse order."

	| current |
	current := tail.
	[ current isNil ] 
		whileFalse: [ 
	 		block value: current.
			current := current previousLink ]
]

{ #category : #enumerating }
CTDoubleLinkedList >> select: block [
	"Execute block for each of my elements and return a new instance of me 
	containing those elements for which the block returned true."

	| result |
	result := self class new.
	self do: [ :each |
		(block value: each)
			ifTrue: [ result add: each ] ].
	^ result
]
