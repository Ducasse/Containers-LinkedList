Class {
	#name : #BaselineOfDoubleLinkedList,
	#superclass : #BaselineOf,
	#category : #BaselineOfLinkedList
}

{ #category : #baselines }
BaselineOfDoubleLinkedList >> baseline: spec [
	<baseline>
	spec
		for: #pharo
		do: [ spec package: 'Containers-LinkedList'.
			spec
				package: 'Containers-LinkedList-Tests'
				with: [ spec requires: #('Containers-LinkedList') ] ]
]
