adding
add: aLinkOrObject beforeLink: otherLink

	| currentLink|

	firstLink == otherLink ifTrue: [^ self addFirst: aLinkOrObject].
	
	currentLink := firstLink.
	[currentLink == nil] whileFalse: [
		currentLink nextLink == otherLink ifTrue: [
			| aLink |
			aLink := CTValueLink value: aLinkOrObject.
			aLink nextLink: currentLink nextLink.
			currentLink nextLink: aLink.
			^ aLink
		].
		 currentLink := currentLink nextLink.
	].
	^ self errorNotFound: otherLink