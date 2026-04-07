//: [Previous](@previous)

/**
 The problem: Reverse Linked List
 Given the head of a singly linked list , reverse the list, and return the reversed list
 
 Constraints:
 - The number of nodes in the list is the range [0, 1000]
 - `-1000 <= Node.val <= 1000`
 - A linked list an be reversed either iteratively or recursively
 - You should aim for a solution with O(n) time and O(1) space, where n is the length of the given list
 
 Understand the problem
 - Read the statement twice
 
 Work out with example, understand the state of the data
 1. head = [2,3,7,11]
 -> [11,7,3,2]
 2. head = [1,2]
 -> [2,1]
 3. head = []
 -> []
 
 Clarifying questions
 - Input/Output
 1. The input should be an array of bumber or a head node?
 2. If the input is nil should I return a nil head node?
 - Constraints
 1. Should I priorize iiteratively or recursively?
 2. Is it thread-safe?
 - Trade-offs
 3. Should I priorize velocity or memory?
 
 Design the algorithm
 - Trigger: linked list, reverse
 - Options
 1. Iteratively -> O(n)
 - Set head to tail
 - Set tail.next to nil
 - Store the prev element to current element
 - Set prev to current.next element
 - Set prev node as new head
 2. recursively -> O(n)
 - Set head to tail
 - Set tail.next to nil
 - Return if head is ni
 - Call reverseList(current.next)
 */

// Implement the solution in code

/// Implements a node of 32 bytes, must be reference type because of recurssion
class ListNode<T> {
    var value: T
    var next: ListNode?
    
    init(_ value: T) {
        self.value = value
        self.next = nil
    }
}

// Implements a Reverse Linked List
struct ReverseLinkedList<T> {
    private var head: ListNode<T>?
    
    /// Given the head of a singly linked list , reverse the list, and return the reversed list
    ///
    /// Examples:
    /// ```swift
    /// head = [2,3,7,11]
    /// reverseList(head) // returns [11,7,3,2]
    /// head = [1,2]
    /// reverseList(head) // returns [2,1]
    /// head = []
    /// reverseList(head) // returns []
    /// ```
    ///
    /// - Parameter head: represents the main node of a linked list
    /// - Returns: the  reverse list
    /// - Complexity: Time: O(n) linear algorithm complexity, Space: O(1) constant algorithm complexity
    mutating func reverseList(_ head: ListNode<T>?) -> ListNode<T>? {
        guard head != nil else {
            return nil
        }
        
        var prev: ListNode<T>?
        var current = head
        var next: ListNode<T>?
        
        while let _ = current {
            next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
            
        self.head = prev
        return prev
    }
}

/*
 Make a sistematic debugging, understand the state of my data
 
```swift
 var head = ListNode(2)
 var lvl1 = ListNode(3)
 var lvl2 = ListNode(7)
 lvl1.next = lvl2
 head.next = lvl1
 
 var list = ReverseLinkedList<Int>()
 var newHead = list.reverseList(head)
 newHead
 ```
 
 */

// Write some tests: the happy path and the edge cases
var head: ListNode<Int>? = ListNode(2)
var lvl1: ListNode<Int>? = ListNode(3)
var lvl2: ListNode<Int>? = ListNode(7)
var lvl3: ListNode<Int>? = ListNode(11)
lvl1?.next = lvl2
lvl2?.next = lvl3
head?.next = lvl1
var list = ReverseLinkedList<Int>()

assert(list.reverseList(head)?.value == 11, "Test 1 failed")
lvl1 = ListNode(1)
lvl2 = ListNode(2)
lvl1?.next = lvl2
head = lvl1
assert(list.reverseList(head)?.value == 2, "Test 2 failed")
lvl1 = nil
head = lvl1
assert(list.reverseList(head) == nil, "Test 3 failed")
print("✅ All tests passed!")

//: [Next](@next)
