private
linkAt: index ifAbsent: errorBlock
	"copied from linkedlist"

	| i |
	i := 0.
	self
		linksDo: [ :link | 
			(i := i + 1) = index
				ifTrue: [ ^ link ] ].
	^ errorBlock value