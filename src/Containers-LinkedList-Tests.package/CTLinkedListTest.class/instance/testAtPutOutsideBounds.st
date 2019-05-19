tests - sequenceable
testAtPutOutsideBounds
	| ll |
	ll := CTLinkedList new.
	self should: [ ll at: 1 put: 1 ] raise: SubscriptOutOfBounds