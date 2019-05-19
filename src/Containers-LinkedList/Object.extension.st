Extension { #name : #Object }

{ #category : #'*Containers-LinkedList' }
Object >> asCTDoubleLink [ 
	^ CTDoubleLink value: self
]

{ #category : #'*Containers-LinkedList' }
Object >> asCTLink [ 
	^ CTValueLink value: self
]
