//: [Previous](@previous)

import Foundation

/**
 
 The problem: Implement a generic Binary Search Tree.
 Must support the following functions
 - insert(value)
 - search(value)
 
 Understand the problem
 - Read the statement twice
 
 Work out with examples out loud, understand the state of the data
 1. bst = []
 // insert
 bst.insert(4)                  [4]
 bst.insert(2)                  /     \
 bst.insert(6)              [2]  [6]
 bst.insert(1)              /    \
 bst.insert(3))         [1]  [3]
 // search
 bts.search(3) -> true
 bts.search(7) -> false
 
 Ask clarifying questions
 - Input/output
 1. Should insert duplicated values?
 2. What is the constraint range for n in an insertion?
 3. Should I insert the items ordered?
 - Constraints
 4. Should be thread safety?
 - Trade-offs
 5. Should I priorize velocity or memory?
 6. Should I be iterative or recursively?
 
 Design the algorithm
 - Triggers: Binary search
 - Dsa: Linked List
 - Pseudocode
 // insertion
 1. Create a new node to insert
 2. If current value is nil
    3. Insert new node
    4. Exit
 5. Else
    7. If new value is less than current value
        8. Move to the left
        10. Go to line 2
    11. Else
        12. Move to the right
        13. Go to line 2
 // search
 1. If current value is nil
    2. Return false
 3. Else
    1. If input is equal to current value
        2. Return true
    3. Else
        4. If input is less than current value
            5. Move to the left
            6. Go to the line 1
        7. Else
            8. Move to the right
            9. Go to the line 1
 
 Algorithm complexity analysis
 - Time
 -> O(log n) where node.value < currentValue
 -> O(log n) logarithm time complexity because we discard a half of the search
 - Space
 -> O(n) where current?.left or current?.right = node
 -> O(n) linear space complexity because the size of the list grows based on nodes inserted
 */

// Implement your solution in code

/// Implements a generic node of a Binary Search Tree where T must be Comparable < , > , <= , >= , ==
class BSTNode<T: Comparable> {
    var value: T
    var left: BSTNode?
    var right: BSTNode?
    
    init(_ value: T) {
        self.value = value
        self.left = nil
        self.right = nil
    }
}

/// Implements a generic Binary Search Tree where T must be Comparable < , > , <= , >= , ==
struct BST<T: Comparable> {
    private var root: BSTNode<T>?
    
    mutating func insert(_ value: T) {
        let node = BSTNode(value)
        guard root != nil else {
            root = node
            return
        }
        var current = root
        
        while let currentValue = current?.value {
            guard value != currentValue else {
                break
            }
            
            if node.value < currentValue {
                if current?.left == nil {
                    current?.left = node
                    break
                } else {
                    current = current?.left
                }
            } else {
                if current?.right == nil {
                    current?.right = node
                    break
                } else {
                    current = current?.right
                }
            }
        }
    }
    
    func search(_ value: T) -> Bool {
        let node = BSTNode(value)
        var current = root
        
        while let currentValue = current?.value {
            if node.value == currentValue {
                return true
            } else if node.value < currentValue {
                if current?.left == nil {
                    return false
                } else {
                    current = current?.left
                }
            } else {
                if current?.right == nil {
                    return false
                } else {
                    current = current?.right
                }
            }
        }
        
        return false
    }
}

// Write some test, the happy path and the edge cases
var bst: BST<Int> = BST()
// insert
bst.insert(4)
bst.insert(2)
bst.insert(6)
bst.insert(3)
bst.insert(1)

assert(bst.search(3), "Test 1 failed")
assert(!bst.search(7), "Test 2 failed")
assert(!bst.search(-2), "Test 3 failed")
print("All tests passed, ready to launch 🚀")

//: [Next](@next)
