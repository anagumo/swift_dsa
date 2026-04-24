//: [Previous](@previous)

import Foundation

/**
 
 The problem: Implement Queue using Stacks
 Implement a first in frist out (FIFO) Queue using only two Stacks. The implemented queue should support al the functions
 of a normal queue: `queue (push)`, `peek`, `dequeue (pop)` and `empty`.
 
 Implement `MyQueue` class:
 `push` pushes the element n to the back of the queue
 `pop` removes the element form the front of the queue and returns it
 `peek` returns rhe element at the front of the queue
 `empty` returns true if the queue is empty, false otherwise
 
 Constraints:
 - 1 <= x <= 9
 - At most 100 calls will be made to push, pop, peek, and empty.
 - All the calls to pop and peek are valid.
 
 Notes:
 You must use only standard operations of a stack, which means only push to top, pop to dequeue, peek, size and is empty operations are valid.
 Depending on your language, the stack may not be supported natively. You may simulate a stack using a list or deque (double-ended queue) as long as you use only a stack's standard operations.
 
 Work out with examples out loud. Understan the data.
 1. `[]`
 -> push 1: `[1]`
 -> push 2: `[1, 2]`
 -> peek: `1`
 -> pop: `1`
 -> empty: `false`
 
 Define clarifying questions:
 - Input/Output
 1. To dequeue should I reverse the stack using reverse linked list?
 - Constrains
 2. Should I validate that x is between 1 and 9?
 3. Should be thread safety?
 - Trade-offs
 4. Should I priorize velocity over memory?
 
 Design the algorithm
 - Dsa selected: Stack
 - Trigger: Queue/Stack
 - Pseudocode:
 1. Create a stack to enqueue elements
 2. Create a stack to dequeue elements
 3. For a push
     4. push the value to the enqueue stack
 5. For a pop -> node?
    6. If enqueue stack and dequeue stack are empty
        7. Return nil
    8. Else if dequeue stack is empty
        9. Make a lazy transfer from enqueue stack to dequeue stack
        10. Return a dequeue of dequeue stack
    11. Else
        12. Return a dequeue of dequeue stack
 13. For a peek -> node?
    14. If enqueue stack and dequeue stack are empty
        15. Return nil
    16. Else if dequeue stack is empty
        17. Make a lazy transfer from enqueue stack to dequeue stack
        18. Return a peek of dequeue stack
    19. Else
        20. Return a peek of dequeue stack
 21. For an empty -> Bool
    22. Return if enqueue and dequeue stacks are empty
 23. Exit
 
 Algorithm complexity analyisis
 [WIP]
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


class MyQueue<T> {
    var enqueueStack = Stack<T>()
    var dequeueStack = Stack<T>()
    
    func push(_ value: T) {
        enqueueStack.push(value)
    }
    
    func pop() -> T? {
        guard !enqueueStack.isEmpty || !dequeueStack.isEmpty else {
            return nil
        }
        
        if dequeueStack.isEmpty {
            while let node = enqueueStack.pop() {
                dequeueStack.push(node)
            }
            return dequeueStack.pop()
        } else {
            return dequeueStack.pop()
        }
    }
    
    func peek() -> T? {
        guard !enqueueStack.isEmpty || !dequeueStack.isEmpty else {
            return nil
        }
        
        if dequeueStack.isEmpty {
            while let node = enqueueStack.pop() {
                dequeueStack.push(node)
            }
            return dequeueStack.peek()
        } else {
            return dequeueStack.peek()
        }
    }
    
    func empty() -> Bool {
        enqueueStack.isEmpty && dequeueStack.isEmpty
    }
}

/**
 let myQueue = MyQueue<Int>()
 myQueue.push(1)
 myQueue.push(2)
 myQueue.peek()
 myQueue.pop()
 myQueue
 myQueue.empty()
 myQueue.push(4)
 myQueue
 myQueue.pop()
 myQueue
 myQueue.pop()
 myQueue
 myQueue.pop()
 myQueue.push(3)
 */

// Write some tests: the happy path and edge cases
let myQueue = MyQueue<Int>()
myQueue.push(1)
myQueue.push(2)
assert(myQueue.pop() == 1, "Test 1 failed")
assert(myQueue.peek() == 2, "Test 2 failed")
assert(!myQueue.empty(), "Test 3 failed")
print("🚀 All tests passed, ready to launch...")

//: [Next](@next)
