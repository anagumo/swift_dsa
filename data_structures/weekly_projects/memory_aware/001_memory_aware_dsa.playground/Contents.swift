import Foundation

/**
 
 The problem: Memory-Aware Data Structures in Swift
 
 Implement a generic Linked List that:
 - Supports `append`, `prepend`, `remove(at:)` and `iterate`
 - Prints in console how many nodes has and estimate the memory usage (bytes)
 - Evaluates why will choose a Linked List vs an Array
 - Uses the framework Explore to identify if the implementation has a memory issue
 
 Understand the problem:
 - Read the statement twice
 
 Workout with examples out loud, understand the state of the data:
 1. list: [2,3,7]
 - list.append(7) -> not print but debug [2,3,7]
 - list.prepend(11) -> not print but  debug [2,3,7,11]
 - list.remove(at: 2) -> [2,3,11]
 - list.iterate() -> 2 -> 3 -> 11 -> nil
 2.list:[]
 - list.remove(at: 0) -> nil
 - list.iterate() -> nil
 
 Ask clarifying questions:
 - Input/Output
 1. The Linked List could be empty at the beginning?
 2. If the Linked List is empty should I return `nil` for remove and iteration?
 - Constraints
 1. Shoul I considere a min or max number of nodes?
 2. Is it thread-safety?
 - Trade-offs
 1. Should I give priority to memory or velocity?
 
 Design the algorithm:
 Options:
 1. Array
 |_ Time: O(1) append, O(n) prepend, O(n) remove, O(n) itrerate
 |_ Space: O(n) 8 bytes per element
 |_ Status: Rejected because is slower in more than one operation
 
 2. Linked List
 |_ Time: O(1) append, O(1) prepend, O(1) remove, O(n) iterate
 |_ Space: O(n) 32 bytes per node
 |_ Status: Selected because memory is acceptable if we win constant time in almost all operations
 
 Dsa selected: Linked List
 I could do it with an Array that give me O(1) in an append and 8 bytes per node in memory but at
 the cost of O(n) in the rest of its operations. So a Linked List is better for a context where we need
 to win constan time in operations, the memory is an acceptable trade-off here.
 
 Sketch your solution:
 1. Create a generic Linked List using a structure to store the pointer in the Stack and shared memory in the Heap.
 2. Create a generic Node using a class to calculate the size in the Heap give the recurssion.
 3. Implement an `append` function
 4. Implement a `prepend` function
 5. Implement a `remove(at:)` function
 6. Implement a `iterate` function
 
 Algorithm complexity analysis:
 Time:
 -> O(1) where `tail.next = newNode`
 -> O(1) where`head = head.next`
 -> O(1) where `node.next = newNode`
 -> O(1) where while `node.next != nil`
 -> O(n) linear time algorithm complexity
 Space:
 -> O(n) where `tail.next = newNode`
 O(n) linear time algorithm complexity because the list grows as more nodes to insert
 */

// Implement the solution in code

class Node<T> {
    var value: T
    var next: Node<T>?
    
    init(_ value: T) {
        self.value = value
        self.next = nil
    }
}

struct MemoryAware<T> {
    private var head: Node<T>?
    // Create a reference to the last node to get O(1) in an append
    private var tail: Node<T>?
    
    mutating func append(_ value: T) {
        let node = Node(value)
        
        guard head != nil else {
            // If the list is empty the new node is the head and tail of the list
            head = node
            tail = node
            return
        }
        
        // The node that tail is pointing, its next node must point to the new node
        tail?.next = node
        // Move the pointer to the new node, now the last node
        tail = node
    }
    
    mutating func prepend(_ value: T) {
        let node = Node(value)
        
        guard let top = head else {
            // If the list is empty, both head and tail must point to the new node
            head = node
            tail = node // Edge case found: set a tail when the list is empty
            return
        }
        // If the list is not empty
        // The new node's next node must point to the old head
        node.next = top
        // Move the head pointer to the new node, now the first node
        head = node
    }
    
    mutating func remove(at index: Int) -> T? {
        guard index >= 0, head != nil else { return nil }
        
        // If the head is going to be removed
        if index == 0 {
            let top = head
            head = top?.next
            if head == nil { tail = nil }
            return top?.value
        }
        
        // If the list has more than one element and we need to remove in the middle or at the end
        var currentIndex = 0
        // Create a temporal reference to the prev node to delete a node at index n
        var prevNode: Node<T>?
        var currentNode = head
        
        while let node = currentNode {
            if currentIndex == index {
                // The prev's next node must point to the current node's next node
                prevNode?.next = node.next
                // Make sure the tail points to the prev node if the last node is removed
                if node.next == nil {
                    tail = prevNode
                }
                return node.value
            }
            
            // Move the pointer to the next node
            currentIndex += 1
            prevNode = currentNode
            currentNode = node.next
        }
        
        return nil
    }
    
    func iterate() -> String {
        var currentNode = head
        var str = ""
        
        while let node = currentNode {
            let connector = node.next != nil ? " -> " : " -> nil"
            str += "\(node.value)\(connector)"
            // Move the currentNode pointer to its next node to iterate the list
            currentNode = currentNode?.next
        }
        
        return str
    }
    
    func printMemoryInfo() {
        var count = 0
        var currentNode = head
        while let _ = currentNode {
            currentNode = currentNode?.next
            count += 1
        }
        
        guard let head else {
            print("\n|_The linked list has 0 nodes")
            return
        }
        print("\n|_ The linked list has: \(count) nodes")
        let heapSize = malloc_size(Unmanaged.passUnretained(head).toOpaque())
        print("|_ Memory per node: \(heapSize) bytes")
        print("|_ Total memory: \(heapSize * count) bytes")
    }
}

/**
 Make a sistematic debuggin, understand the state of your data
 
 Take notes if needed:

 ```swift
 var memoryAware: MemoryAware<Int> = MemoryAware()
 memoryAware.append(3)
 memoryAware.append(7)
 memoryAware.prepend(2)
 memoryAware.append(11)
 memoryAware.remove(at: 1)
 memoryAware.iterate()
 memoryAware.printMemoryInfo()
 ```
 */

/**
 Write some tests: the happy path and edge cases
 */
var memoryAware: MemoryAware<Int> = MemoryAware()
memoryAware.append(3)
memoryAware.append(7)
memoryAware.prepend(2)
assert(memoryAware.remove(at: 0) == 2, "Test 1 failed")
assert(memoryAware.iterate() == "3 -> 7 -> nil", "Test 2 failed")
assert(memoryAware.remove(at: 1) == 7, "Test 2 failed")
assert(memoryAware.remove(at: 2) == nil, "Test 3 failed")
memoryAware.append(11)
print("✅ All tests passed!")
