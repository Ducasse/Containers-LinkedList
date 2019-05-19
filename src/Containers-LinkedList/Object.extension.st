Extension { #name : #Object }

{ #category : #'*Containers-LinkedList' }
Object >> asCtDoubleLink [

	^ CTDoubleLink value: self
]

{ #category : #'*Containers-LinkedList' }
Object >> asCtLink [
	"Answer a string that represents the receiver."

	^ CTValueLink value: self
]
