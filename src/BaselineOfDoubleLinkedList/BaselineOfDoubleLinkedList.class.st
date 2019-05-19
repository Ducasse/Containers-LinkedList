Class {
	#name : #BaselineOfDoubleLinkedList,
	#superclass : #BaselineOf,
	#category : #BaselineOfDoubleLinkedList
}

{ #category : #baselines }
BaselineOfDoubleLinkedList >> baseline: spec [
	<baseline>
	spec
		for: #pharo
		do: [ spec package: 'Containers-DoubleLinkedList'.
			spec
				package: 'Containers-DoubleLinkedList-Tests'
				with: [ spec requires: #('Containers-DoubleLinkedList') ] ]
]
