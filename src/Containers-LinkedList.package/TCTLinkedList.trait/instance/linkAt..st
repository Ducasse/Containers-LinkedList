private
linkAt: index
	"copied from linkedlist"

	^ self linkAt: index ifAbsent: [ self errorSubscriptBounds: index ]