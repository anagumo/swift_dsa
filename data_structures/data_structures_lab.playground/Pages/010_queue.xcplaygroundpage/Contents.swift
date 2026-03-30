//: [Previous](@previous)

import Foundation

/**
 The problem:
 Select the best data structure to implement a Queue
 
 Constraints:
 The stack must have the following operations:
 - enqueue -> O(1)
 - dequeue -> O(1)
 - peek -> O(1)
 - isEmtpy -> O(1)
 
 Understand the problem:
 - Read the statement twice
 
 - Workout with examples out loud, understand the state of the data:
 1. list: [2,3,7]
 - enqueue 11 -> [2,3,7,11]
 - dequeue -> 2
 - peek -> 3
 - isEmpty: false
 2. []
 - enqueue 11 -> [11]
 - dequeue -> 11
 - peek -> `nil`
 - isEmpty: `true`
 
 - Ask clarifying questions:
 Input/Ouptut
 1. The queue should be generic?
 2. The queue could be empty at the beginning?
 3. If the queue is empty should I return `nil` in a dequeue?
 Constraints
 1. Should I consider a min or max lenght?
 2. If I have just 1 element, this element should be the head and tail at the same time?
 3. Is it thread-safe?
 Trade-offs
 1. Should I give priority to memory or velocity?
 
 - Design the algorithim:
 Trigger: queue
 Options:
 1. Array
 |_ Time: O(1) enqueue, O(n) dequeue
 |_ Space: O(n) 8 bytes per element
 |_ Status: Rejected because is slower
 
 2. Linked List
 |_ Time: O(1) enqueue, O(1) dequeue
 |_ Space: O(n) 32 bytes per node
 |_ Status: Selected becaouse memory is acceptable if we win constant time
 
 - Dsa selected: Linked List
 I could do it with an Array that give me O(1) in a enqueue and 8 bytes per element in memory but at
 the cost of O(n) in an dequeue, so I selected Linked List because memory is an a acceptable trade-off
 here if we win constant time.
 
 - Sketch your solution:
 1. Create a Queue using an structure to store the pointer in the Stack and shared memory in the Heap
 2. Create a Node using a class to calculate the node size in the Heap given the recurssion
 3. Create a generic instance for the `head` and the `tail`
 4. Implement an `enqueue` function
 5. Implement a `dequeue` function
 6. Implement a `peek` function
 7. Implement a `isEmpty` function
 
 - Algorithm complexity analysis:
 Time:
 -> O(1) where `tail.next = newNode`
 -> O(1) where `head = head.next`
 -> O(1) where `return head`
 -> O(1) where `head != nil`
 -> O(1) constant time algorithm complexity
 Space:
 -> O(n) where `tail.next = newNode`
 -> O(n) linear time algorithm complexity because the list grows as more nodes to insert
 */

// Implement the solution in code

/// Implements a generic Node to be inserted in a Queue, should be reference type:
/// - to calculate the each node size in a recurssion
class Node<T> {
    var value: T
    var next: Node<T>?
    
    init(_ value: T) {
        self.value = value
        self.next = nil
    }
}

/// Implements a generic Queue using a Linked List, should be value type:
///
/// Constraints:
/// The stack must have the following operations:
/// - enqueue -> O(1)
/// - dequeue -> O(1)
/// - peek -> O(1)
/// - isEmtpy -> O(1)
///
/// Assumptions:
/// - Thread-safety by default
///
/// ```swift
/// var queue: Queue<Int> = Queue()
/// queue.enqueue(2) // [2]
/// queue.enqueue(3) // [2,3]
/// queue.enqueue(7) // [2,3,7]
/// queue.enqueue(11) // [2,3,7,11]
/// queue.dequeue() // 2
/// queue.peek() // 3
/// queue.isEmpty() // false
///
/// var queue: Queue<Int> = Queue()
/// queue.enqueue(11) // [11]
/// queue.dequeue() // 11
/// queue.peek() // nil
/// queue.isEmpty() // true
/// ```
struct Queue<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    /// Appends a node at the end of the list
    /// - Parameter value: Represent a generic value of the node
    /// - Complexity: O(1) constant time
    mutating func enqueue(_ value: T) {
        let lastIn = Node(value)
        
        guard !isEmpty else {
            head = lastIn
            tail = lastIn
            return
        }
        
        tail?.next = lastIn
        tail = lastIn
    }
    
    /// Removes the first element of the list
    /// - Returns: The generic node removed, or `nil` if the list is empty
    /// - Complexity: O(1) constant time
    mutating func dequeue() -> T? {
        guard let firstOut = head else {
            return nil
        }
        
        head = firstOut.next
        if head == nil { tail = nil } // To free memory and avoid a temporal memory leak
        return firstOut.value
    }
    
    /// Gets the top element of the list
    /// - Returns: The value of a generic node
    /// - Complexity: O(1) constant time
    func peek() -> T? {
        head?.value
    }
    
    /// Validates if the list is empty
    /// - Complexity: O(1) constant time
    var isEmpty: Bool {
        head == nil
    }
}

/**
 Make a sistematic debuggin, understand the state of your data
 
 Take notes if needed:
 
 ```swift
 var queue: Queue<Int> = Queue()
 queue.enqueue(2)
 queue.enqueue(3)
 queue.enqueue(7)
 queue.enqueue(11)
 queue.dequeue()
 queue.peek()
 queue.isEmpty
 ```
 */

/**
 Write some tests: the happy path and edge cases
 */
var numbers: Queue<Int> = Queue()
numbers.enqueue(2)
numbers.enqueue(3)
numbers.enqueue(7)
assert(numbers.dequeue() == 2, "Test 1 failed")
assert(numbers.peek() == 3, "Test 2 failed")
assert(!numbers.isEmpty, "Test 3 failed")

var letters: Queue<String> = Queue()
letters.enqueue("a")
assert(letters.dequeue() == "a", "Test 1 failed")
assert(letters.peek() == nil, "Test 2 failed")
assert(letters.isEmpty, "Test 3 failed")

print("✅ All tests passed!")

//: [Next](@next)
