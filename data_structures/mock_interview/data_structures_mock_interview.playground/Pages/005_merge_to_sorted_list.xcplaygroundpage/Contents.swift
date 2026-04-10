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
 1. Create variables for `tail` to remeber the last node, `current` and `next` to store nodes' history
 2. If the lists are empy return empty, otherwise return the full one
 3. Iterate the current elements of both `list1` and `list2`, until one of them are `nil`
 4. Save on `next` the next nodes of both `list1` and `list2`
 5. Compare the `current` node of `list1` and the `list2`
 6. The lowest node next should be equal to the greatest node
 7. If `head` is `nil`, head is equal to the lowest node
 8.  Then the `tail` is equeal to the greatest node
 9. If `head` is not `nil`, we are going to focus in the `tail`, so repeat the step 6
 10. Then`tail.next` node should be equal to the lowest node
 11. Repeat the step 8
 13. Return the head of new sorted linked list
 
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
    private var head: ListNode<T>?
    private var tail: ListNode<T>?
    
    mutating func merge(_ list1: ListNode<T>?, _ list2: ListNode<T>?) -> ListNode<T>? {
        // Validate edge case before iterate
        if list1 == nil && list2 == nil {
            return nil
        } else if list1 != nil && list2 == nil {
            return list1
        } else if list1 == nil && list2 != nil {
            return list2
        }
        
        var node1 = list1
        var node2 = list2
        
        // Iterate both list until one of them equal nil
        while node1 != nil || node2 != nil {
            var nextL1 = node1?.next
            var nextL2 = node2?.next
            
            if let node1, let node2, node1.value <= node2.value {
                // Node 1 is lower than Node 2
                node1.next = node2
                
                if head == nil {
                    head = node1
                } else {
                    tail?.next = node1
                }
                
                tail = node2
            } else {
                // Node 2 is lower than Node 1
                node2?.next = node1
                
                if head == nil {
                    head = node2
                } else {
                    // When list2 ends first
                    if node2 == nil {
                        tail?.next = node1
                    } else {
                        tail?.next = node2
                    }
                }
                
                // When list1 ends first
                if node1 == nil {
                    tail = node2
                } else {
                    tail = node1
                }
            }
            
            // Move the pointer to the next nodes
            node1 = nextL1
            node2 = nextL2
        }
        
        tail = nil
        return head
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
list3.next = ListNode(value: 2)

let result = sortedLinkedList.merge(list1, list2)
assert(result?.value == 1, "Test 1 failed")
let result2 = sortedLinkedList.merge(nil, list3)
assert(result2?.value == 1, "Test 1 failed")
assert(sortedLinkedList.merge(nil, nil) == nil, "Test 1 failed")

print("✅ All tests passed!")

//: [Next](@next)
