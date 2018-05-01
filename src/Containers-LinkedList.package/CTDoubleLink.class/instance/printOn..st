converting
printOn: aStream
	aStream nextPutAll: 'CTDoubleLink ('.
	value printOn: aStream.
	aStream nextPut: $)