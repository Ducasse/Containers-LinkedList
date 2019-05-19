adding
addFirst: aLinkOrObject 
	"Add aLink to the beginning of the receiver's list. Answer aLink."
	|aLink|
	aLink := CTValueLink value: aLinkOrObject.
	self isEmpty ifTrue: [lastLink := aLink].
	aLink nextLink: firstLink.
	firstLink := aLink.
	^aLink