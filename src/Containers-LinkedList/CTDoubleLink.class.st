"
I am DoubleLink, the elementary part of a DoubleLinkedList.

I hold a value, as well as a link to my successor (nextLink) and to my predecessor (previousLink) - both can be nil.
"
Class {
	#name : #CTDoubleLink,
	#superclass : #Object,
	#instVars : [
		'value',
		'nextLink',
		'previousLink'
	],
	#category : 'Containers-LinkedList'
}

{ #category : #'instance creation' }
CTDoubleLink class >> value: anObject [
	^ self new
		value: anObject;
		yourself
]

{ #category : #converting }
CTDoubleLink >> asCtDoubleLink [
	^ self
]

{ #category : #initialize }
CTDoubleLink >> clearLinks [
	nextLink := previousLink := nil
]

{ #category : #testing }
CTDoubleLink >> hasPredecessor [
	^ previousLink notNil
]

{ #category : #testing }
CTDoubleLink >> hasSuccessor [
	^ nextLink notNil
]

{ #category : #iterations }
CTDoubleLink >> linksReverseCollect: aBlock [
	| list aLink |
	list := self species new.
	aLink := self previousLink.
	[ aLink == nil ]
		whileFalse: [ 
			list add: (aBlock value: aLink).
			aLink := aLink previousLink ].
	^ list
]

{ #category : #accessing }
CTDoubleLink >> nextLink [
	^ nextLink
]

{ #category : #accessing }
CTDoubleLink >> nextLink: anObject [
	nextLink := anObject
]

{ #category : #accessing }
CTDoubleLink >> previousLink [
	^ previousLink
]

{ #category : #accessing }
CTDoubleLink >> previousLink: anObject [
	previousLink := anObject
]

{ #category : #converting }
CTDoubleLink >> printOn: aStream [
	aStream nextPutAll: 'CTDoubleLink ('.
	value printOn: aStream.
	aStream nextPut: $)
]

{ #category : #iterations }
CTDoubleLink >> reverseCollect: aBlock [
	| list aLink |
	list := self species new.
	aLink := self previousLink.
	[ aLink == nil ]
		whileFalse: [ 
			list add: (aBlock value: aLink value).
			aLink := aLink previousLink ].
	^ list
]

{ #category : #iterations }
CTDoubleLink >> reverseCollect: aBlock untilTrue: aConditionBlock [ 
	| list aLink |
	list := self species new.
	aLink := self previousLink.
	[ aLink == nil or: [ aConditionBlock value: aLink value ]  ]
		whileFalse: [ 
			list add: (aBlock value: aLink value).
			aLink := aLink previousLink ].
	^ list
]

{ #category : #iterations }
CTDoubleLink >> species [
	^ CTDoubleLinkedList
]

{ #category : #accessing }
CTDoubleLink >> value [
	^ value
]

{ #category : #accessing }
CTDoubleLink >> value: anObject [
	value := anObject
]
