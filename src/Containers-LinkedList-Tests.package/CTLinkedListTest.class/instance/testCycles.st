tests - cycles
testCycles
  1 to: 42 do: [ :each |
    list := CTLinkedList withAll: (1 to: each).
    "Warning: the following statement creates a cycle,
     inspecting/viewing list will probably fail"
    list lastLink nextLink: list firstLink.
    self assert: list containsCycle ]