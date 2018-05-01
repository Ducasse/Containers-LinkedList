iterations
reverseCollect: aBlock
	| list aLink |
	list := self species new.
	aLink := self previousLink.
	[ aLink == nil ]
		whileFalse: [ 
			list add: (aBlock value: aLink value).
			aLink := aLink previousLink ].
	^ list