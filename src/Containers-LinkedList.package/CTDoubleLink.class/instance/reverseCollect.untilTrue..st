iterations
reverseCollect: aBlock untilTrue: aConditionBlock 
	| list aLink |
	list := self species new.
	aLink := self previousLink.
	[ aLink == nil or: [ aConditionBlock value: aLink value ]  ]
		whileFalse: [ 
			list add: (aBlock value: aLink value).
			aLink := aLink previousLink ].
	^ list