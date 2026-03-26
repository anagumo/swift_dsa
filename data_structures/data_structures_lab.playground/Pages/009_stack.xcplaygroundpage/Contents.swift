//: [Previous](@previous)

import Foundation

/**
 The problem:
 Select the best data structure to implement a Stack
 
 Constraints:
 The stack must have the following operations with these BigO time:
 - push -> O(1)
 - pop -> O(1)
 - peek -> O(1)
 - isEmpty -> O(1)
 
 Unsertand the problem:
 - Read the statement twice
 
 - Work out with examples out loud, unserstand the state of the data:
 1. list: [1,3,7]
 - push 1 -> [1, 1, 3, 7]
 - pop -> 1
 - peek ->  1
 - isEmpty ->  false
 1. list: []
 - push 1 -> [1]
 - pop -> nil
 - peek ->  nil
 - isEmpty ->  true
 
 - Ask clarifying questions:
 1. For a push operation should I display feedback to the user?
 2. Should I considere a max length for the input?
 3. Should I considere time or space as priority?
 4. Should be thread-safe? Each thread has its own stack but shared heap memory
 
 - Design the algorithm:
 - Trigger: stack
 - Options:
 Array/
 - Create a new array to store elements in a heap buffer
 - Append an element at first position (push) -> O(n)
 - Remove the first element (pop) -> O(n)
 - Get the first element (peek) -> O(1)
 - Count elements in the list -> O(n)
 -> O(n) Linear time complexity
 
 HashMap/
 - Create a hash map to store elements as blocks in the heap
 - push and pop not supported because
        - random order
        - unique elements
 -> Discarted
 
 Linked List/
 - Create an structure to store elements as nodes in the heap
 - Replace head by new node (push) -> O(1)
 - Replace head by its next node (pop) -> O(1)
 - Read the head (peek and isEmpty) -> O(1)
 -> O(1) Constant time complexity as superpowder

 - Dsa selected: Linked List
 - Sketch your solution:
 1. Create an structure in the Stack with shared memory in the Heap for the content
 2. Create a generic instance for the head
 3. Implement a `push` function
 4. Implement a `pop` function
 5. Implement a `peek` function
 6. Implement an `isEmpty` function
 
 - Algorithm complexity analysis
 1. Time:
 -> O(1) where `newNode.next = head` and `head = newNode`
 -> O(1) where `head = newNode`
 -> O(1) where `return head`
 -> O(1) where `head != nil`
 2. Space:
 -> O(n) where `newNode.next = head` and `head = newNode`
 -> O(n) linear complexity because the list grows as more nodes to insert
 3. Conclusion:
 I can use a Linked list which give me O(1) in time in all operations, alternative I could use an Array at the cost of O(n) in most of its operations
 but lower in memory: 8 bytes for element vs 32 bytes for node. I selected a Linked List because the memory is a trade-off acceptable here.
 */

/**
 Implement the solution in code
 */

/// Implements a Node to be inserted in a Stack, should be a reference type because:
/// - a node inside
/// - that has a node inside
/// - that has a node inside
/// - ... is recursivly
class Node<T> {
    var value: T
    var next: Node<T>?
    
    init(_ value: T) {
        self.value = value
        self.next = nil
    }
}

/// Implements a Stack in swift Using a Linked List
///
/// Constraints:
///
/// The stack must have the following operations with these BigO times
/// - push -> O(1)
/// - pop -> O(1)
/// - peek -> O(1)
/// - isEmpty -> O(1)
///
/// Assumptions:
/// - Should not be Thread-safety
///
/// ```swift
/// var stack: Stack<Int> = Stack()
/// stack.push(7) // [7]
/// stack.push(3) // [3,7]
/// stack.push(1) // [1,3,7]
/// stack.pop() // returns 1
/// stack.peek() // returns 3
/// stack.isEmpty() // false
///
/// var stack: Stack<Int> = Stack()
/// stack.push(1) // [1]
/// stack.pop() // returns 1
/// stack.peek() // returns nil
/// stack.isEmpty() // true
/// ```
///
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

/**
 Make a sistematic debuggin, understand the state of your data
 
 Take notes if needed:
 - Swift idiomatic pattern:
 ```swift
 mutating func pop() -> T? {
     defer { head = head?.next }
     return head?.value
 }
 ```
 - Thread-safety is more about shared memory bewteen threads in Heap:
 ```swift
 actor Stack<T> {
     private var head: Node<T>?
 }
 ```
 
 Manual test:
 ```swift
 var stack: Stack<Int> = Stack()
 stack.push(7)
 stack.push(3)
 stack.push(1)
 stack.pop()
 stack.peek()
 stack.isEmpty()
 ```
 */

/**
 Write some tests: the happy path and edge cases
 */
var numbers: Stack<Int> = Stack()
numbers.push(7)
numbers.push(3)
numbers.push(1)
assert(numbers.pop() == 1, "Test 1 failed")
assert(numbers.peek() == 3, "Test 1 failed")
assert(!numbers.isEmpty, "Test 1 failed")

var letters: Stack<String> = Stack()
letters.push("a")
assert(letters.pop() == "a", "Test 1 failed")
assert(letters.peek() == nil, "Test 1 failed")
assert(letters.isEmpty, "Test 1 failed")

print("✅ All tests passed!")
//: [Next](@next)
