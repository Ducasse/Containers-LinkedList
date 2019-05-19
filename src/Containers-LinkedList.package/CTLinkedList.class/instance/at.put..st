accessing
at: index put: anObject

	^self at: index putLink: (self linkOf: anObject ifAbsent: [CTValueLink value: anObject])