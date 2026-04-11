//: [Previous](@previous)

import Foundation

/**
 The problem: Merge Two Sorted Lists
 You are given the head of two sorted lists.
 Merge the two sorted lists into one sorted linked list and return the head of the new sorted linked list.
 
 Constraints
 - 0 <= The length of the each list <= 100.
 - -100 <= Node.val <= 100
 
 Understand the problem
 - Read the statement twice
 
 Workout with examples out loud, understand the state of the data
 1. list1 = [2,3,6,7], list2 = [1,4,5]
 -> [1,2,3,4,5,6,7]
 2. list1 = [1,2,4], list2 = [1,3,5]
 -> [1,1,2,3,4,5]
 3. list1 = [], list2 = [1,2]
 -> [1,2]
 
 Ask clarifying questions
 Input/Output
 1. Lists should has the same length?
 Constraints:
 2. Is thread-safety?
 Trade-off
 3. Should I priorize memory or velocity?
 
 Design the algorithm
- Sketch your solution
 1. If the lists are empy return empty, otherwise return the full one
 2. Create variables for `tail` to remeber the last node, `n1` and `n2` to move pointers on both lists
 3. Create a dummy node to avoid validate a `nil` head, `tail` is equal to this dummy
 4. Iterate the current elements of both `list1` and `list2`, until one of its current elements is `nil`
 5. Compare `n1` and `n2`, `tail.next` is equal to the `min`
 6. Move the pointer to the `min`, to the next node
 7. If one pointer is `nil`, link the not nil node to the `tail`
 8. Head now is equal to dummy next node
 9. Return head
 
 - Triggers: Two sorted list
 - Dsa: Linked List
 - Algorithm: No apply
 
 Algorithm Complexity Analisis
 Time
 -> O(n+m) `where while l1|l2.current != nil`
 -> O(n) liner algorithm complexity because the work is based on the size of the input
 In the worst case reads all elements in both lists
 In the best case both lists are empty
 Space
 -> O(1) where `tail`, `current` and `next` are variables
 -> O(1) constant algorithm complexity because we store one value per variable
 
 Assumptions:
 - I will prorize velocity and the data structure is thread safety
 */

// Implement your solution in code

class ListNode<T> {
    var value: T
    var next: ListNode<T>?
    
    init(value: T) {
        self.value = value
        self.next = nil
    }
}

struct SortedLinkedList<T: Comparable> {
    
    mutating func merge(_ list1: ListNode<T>?, _ list2: ListNode<T>?) -> ListNode<T>? {
        var head = ListNode(value: 0 as! T)
        var tail: ListNode<T>? = head
        var ptr1: ListNode<T>? = list1
        var ptr2: ListNode<T>? = list2
        
        while let node1 = ptr1, let node2 = ptr2 {
            if node1.value <= node2.value {
                // Node 1 is the min
                tail?.next = ptr1
                ptr1 = ptr1?.next
            } else {
                // Node 2 is the min
                tail?.next = ptr2
                ptr2 = ptr2?.next
            }
            // Move the tail pointer
            tail = tail?.next
        }
        
        // If one of the list ends first, otherwise set tail.next to nil
        tail?.next = ptr1 ?? ptr2
        // Return the next element since dummy data
        return head.next
    }
}

/**
 Make a systematic debugging, understand the state of your data

 ```swift
 var sortedLinkedList = SortedLinkedList<Int>()
 let list1 = ListNode(value: 3)
 let list2 = ListNode(value: 2)
 let lvl1 = ListNode(value: 7)
 lvl1.next = ListNode(value: 9)
 // [3] merge [2,7,9]
 //list2.next = lvl1
 // [3,7,9] merge [2]
 list1.next = lvl1
 sortedLinkedList.merge(list1, list2: list2)
 ```
 */

// Add some tests, the happy path and edge cases
var sortedLinkedList = SortedLinkedList<Int>()
var list1 = ListNode(value: 1)
var node1 = ListNode(value: 2)
var node2 = ListNode(value: 4)
node1.next = node2
list1.next = node1 // [1,2,4]
var list2 = ListNode(value: 1)
var node3 = ListNode(value: 3)
var node4 = ListNode(value: 5)
node3.next = node4
list2.next = node3 // [1,3,5]
var list3 = ListNode(value: 1)
list3.next = ListNode(value: 2) // [1,2]

let result = sortedLinkedList.merge(list1, list2)
assert(result?.value == 1, "Test 1 failed")
let result2 = sortedLinkedList.merge(nil, list3)
assert(result2?.value == 1, "Test 2 failed")
assert(sortedLinkedList.merge(nil, nil) == nil, "Test 3 failed")

print("✅ All tests passed!")

//: [Next](@next)
