"
An instance of me is a simple record of a pointer to another Link. I am an abstract class; my concrete subclasses, for example, Process, can be stored in a LinkedList structure.
"
Class {
	#name : #CTLink,
	#superclass : #Object,
	#instVars : [
		'nextLink'
	],
	#category : 'Containers-LinkedList'
}

{ #category : #'instance creation' }
CTLink class >> nextLink: aLink [ 
	"Answer an instance of me referring to the argument, aLink."

	^self new nextLink: aLink; yourself
]

{ #category : #conversion }
CTLink >> asCTLink [ 
	^ self 

	
	
]

{ #category : #accessing }
CTLink >> nextLink [
	"Answer the link to which the receiver points."

	^nextLink
]

{ #category : #accessing }
CTLink >> nextLink: aLink [ 
	"Store the argument, aLink, as the link to which the receiver refers. 
	Answer aLink."

	^nextLink := aLink
]
