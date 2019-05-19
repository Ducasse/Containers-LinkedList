"
A ValueLink is a Link containing a Value.
Adding an object to a LinkedList which is not a Link will create a ValueLink containing that object.


value - The object this link points to.
"
Class {
	#name : #CTValueLink,
	#superclass : #CTLink,
	#instVars : [
		'value'
	],
	#category : 'Containers-LinkedList'
}

{ #category : #'instance creation' }
CTValueLink class >> value:	 aValue [
	^self new value: aValue
]

{ #category : #comparing }
CTValueLink >> = anotherObject [
	^self species == anotherObject species 
		and: [self value = anotherObject value 
				and: [self nextLink == anotherObject nextLink]]
]

{ #category : #comparing }
CTValueLink >> hash [
	^self value hash bitXor: nextLink identityHash 

]

{ #category : #printing }
CTValueLink >> printOn: aStream [
	aStream nextPutAll: 'ValueLink('.
	value printOn: aStream.
	aStream nextPut: $)

]

{ #category : #accessing }
CTValueLink >> value [
	^value 
]

{ #category : #accessing }
CTValueLink >> value: aValue [
	value := aValue
]
