Class {
	#name : #BaselineOfContainersLinkedList,
	#superclass : #BaselineOf,
	#category : #BaselineOfContainersLinkedList
}

{ #category : #baselines }
BaselineOfContainersLinkedList >> baseline: spec [
	<baseline>
	spec
		for: #pharo
		do: [ spec package: 'Containers-LinkedList'.
			spec
				package: 'Containers-LinkedList-Tests'
				with: [ spec requires: #('Containers-LinkedList') ] ]
]
