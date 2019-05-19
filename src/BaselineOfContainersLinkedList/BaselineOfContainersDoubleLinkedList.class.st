Class {
	#name : #BaselineOfContainersDoubleLinkedList,
	#superclass : #BaselineOf,
	#category : #BaselineOfContainersLinkedList
}

{ #category : #baselines }
BaselineOfContainersDoubleLinkedList >> baseline: spec [
	<baseline>
	spec
		for: #pharo
		do: [ spec package: 'Containers-LinkedList'.
			spec
				package: 'Containers-LinkedList-Tests'
				with: [ spec requires: #('Containers-LinkedList') ] ]
]
