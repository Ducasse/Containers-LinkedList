adding
addFirst: aLinkOrObject 
	"Add aLink to the beginning of the receiver's list. Answer aLink."
	|aLink|
	aLink := aLinkOrObject asCtLink.
	self isEmpty ifTrue: [lastLink := aLink].
	aLink nextLink: firstLink.
	firstLink := aLink.
	^aLink