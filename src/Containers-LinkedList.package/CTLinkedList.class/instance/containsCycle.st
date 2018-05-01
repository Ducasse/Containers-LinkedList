testing
containsCycle
  | slow fast |
  slow := fast := firstLink.
  [ slow notNil and: [ fast notNil and: [ fast nextLink notNil ] ] ]
    whileTrue: [ 
      slow := slow nextLink.
      fast := fast nextLink nextLink.
      slow == fast
        ifTrue: [ ^ true ] ].
  ^ false