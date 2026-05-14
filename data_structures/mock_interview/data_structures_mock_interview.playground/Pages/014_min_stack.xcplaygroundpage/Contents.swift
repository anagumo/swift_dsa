//: [Previous](@previous)

import Foundation

/**
 The problem: Min Stack
 Design a stack class that supports the push, pop, top, and getMin operations.
 `MinStack() `initializes the stack object.
 `push(_ val: Int)` pushes the element val onto the stack.
 `pop()` removes the element on the top of the stack.
 `top() -> Int`gets the top element of the stack.
 `getMin() -> Int` retrieves the minimum element in the stack.
 
 Understand the problem
 - Read the statement twice
 
 Work out loud with examples, understand the state of data
 1. [2,7,3,5]
 `getMin()` -> 2
 `pop()`
 `top() `-> 7
 `getMin()` -> 3
 2. [0,2,1]
 `getMin()` -> 0
 `pop()`
 `top() `-> 2
 `getMin()` -> 1
 3. []
 `getMin()` ->
 
 Ask clarifiying questions
 1. How many min numbers should I remember?
 2. Should I prriorize O(n) space or O(n) as extra memory?
 3. If stacks are empty, should I return 0 or -1 as min?
 
 Design the algorithm
 - Trigger: min element
 - Dsa: Stack
 - Pseudocode:
 1. create two stacks, normal and min
 2. if stacks are empty
    3. go to the line 18
 4. else
    5. for a push action
        6. push current number in normal stack
        7. If current number is less than min top
            8. push current number in min stack
        9. Else
            10. push the last min in min stack
    11. for a pop action
        12. pop the top of normal stack
        13. pop the top of min stack
    14. for a top action
        15. return the head of normal stack
    16. for a min action
        17. return the top of min stack
 18. exit
 */

// Implement your solution in code
/**
 The Stack data structure was copied/pasted from data_structures_lab/009_stack
Read the docs there to know more about the implementation deatils
*/
class Node<T> {
   var value: T
   var next: Node<T>?
   
   init(_ value: T) {
       self.value = value
       self.next = nil
   }
}

struct Stack<T> {
   private var head: Node<T>?
   
   /// Inserts a node at the first position of the list
   /// - Parameter value: Represents the value of a node
   /// - Complexity: O(1) constant time
   mutating func push(_ value: T) {
       let newNode = Node(value)
       newNode.next = head
       head = newNode
   }
   
   /// Removes the first node of the list
   /// - Returns: The node removed
   /// - Complexity: O(1) constant time
   mutating func pop() -> T? {
       let top = head
       let next = top?.next
       head = next
       return top?.value
   }
   
   /// Gets the first node of the list
   /// - Returns: The node at the first position
   /// - Complexity: O(1) constant time
   func peek() -> T? {
       head?.value
   }
   
   /// Validate if the list has nodes
   /// - Returns: `false` if the list has nodes, or `true` if the list is empty
   /// - Complexity: O(1) constant time
   var isEmpty: Bool {
       head == nil
   }
}

class MinStack<T: Comparable> {
    private var mainStack: Stack<T>
    private var minStack: Stack<T>
    
    init() {
        mainStack = Stack<T>()
        minStack = Stack<T>()
    }
    
    func push(_ val: T) {
        mainStack.push(val)
        
        if let peek = minStack.peek(), peek <= val  {
            minStack.push(peek)
        } else {
            minStack.push(val)
        }
    }
    
    func pop() {
        mainStack.pop()
        minStack.pop()
    }
    
    func top() -> T? {
        mainStack.peek()
    }
    
    func getMin() -> T? {
        minStack.peek()
    }
}

// Add some tests, the happy path and the edge cases
let minStack = MinStack<Int>()
minStack.push(5)
minStack.push(3)
minStack.push(7)
minStack.push(2)
assert(minStack.getMin() == 2, "Test 1 failed")
assert(minStack.top() == 2, "Test 2 failed")
minStack.pop()
assert(minStack.getMin() == 3, "Test 3 failed")
assert(minStack.top() == 7, "Test 4 failed")
print("All the tests passed, ready to launch 🚀")

//: [Next](@next)
