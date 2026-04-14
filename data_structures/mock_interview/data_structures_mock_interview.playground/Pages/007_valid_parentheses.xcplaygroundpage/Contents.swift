//: [Previous](@previous)

import Foundation

/**
 The problem: Valid Parentheses
 You are giving a string `s` consisting of the following characters: '(',  ')', '{', '}', '[', ']'
 The input string s is a valid if and only if:
 1. Every open brackets is closed by the same type of close bracket
 2. Open brackets are closed in the correct order
 3. Every close bracket has a corresponding open bracket of the same type
 Return `true` if `s` is a valid string, and `false` otherwise
 
 - Constraints
 `1 <= s.length <= 1000`
 
 Understand the problem
 - Read the statement twice
 
 Work out with examples out loud, understand the state of the data
 1. s = "[]"
 -> true
 2. s = "([{}])"
 -> true
 3. s = "[(])"
 -> false
 
 Ask clarifying Questions:
 - Input/Output
 1. Should I asume the input comes cleanead?
 2. Is this a valid input: "[()()]"
 - Constraints
 Is it thread safety?
 - Trade-offs
 Should I priorize velocity or memory?
 
 Sketch your solution
 - Trigger: valid parentheses
 - Dsa selected: Stack
 1. Pick up the string
 2. Read the next character on the string
 3. Peek on the top of stack
     // Early exit
 4.     If the top is nil and the first character is a closed element || if the top is open and comes a closed element of another type
     // Must empty the stack before exit
 5.     Return false
 6.     Else if the top is open and comes close element of the same type
 7.         Pop the top of stack
 8.         Go back to line 2
 9.     Else
 10.        Push it on the stack
 11.        Go back to line 2
 12. If the Stack is empty
 13.    Return true
 14. Else
     // Must empty the stack before exit
 15.    Return false
 
 Algorithm complexity analyisis
 - Time
 -> O(n) `where for each element in s`
 -> O(1) `where pop element`
 -> O(1) `where push element`
 -> O(n) linear algorithm complexity
 In the worst case reads all characters in the string because the work depends of the size of the input
 In the best case the first character is a closed bracket
 - Space
 -> O(n) `where where push element`
 -> O(n) linear algorithm complexity
 In the worst case push all characters of the string into the stack
 In the best case the first character is a closed bracket
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

/// Implements parentheses validation in a string using the data structure Stack
/// - Parameter s: represents the string to validate
/// - Returns: `true` if the string has valid parentheses, otherwise `false`
/// - Complexity: Time and Space -> O(n) linear algorithm complexity, where `n` is the length of the input
func isValidParentheses(_ s: String) -> Bool {
    guard !s.isEmpty else {
        return false
    }
    
    var stack = Stack<String>()
    
    for char in s {
        if stack.peek() == nil && (char == ")" || char == "}" || char == "]") {
            return false
        } else if stack.peek() == "(" && char == ")" {
            stack.pop()
        } else if stack.peek() == "{" && char == "}" {
            stack.pop()
        } else if stack.peek() == "[" && char == "]" {
            stack.pop()
        } else {
            stack.push(String(char))
        }
    }
    
    return stack.isEmpty
}

/**
 Make a systematic debugging, understand the state of your data
isValidParentheses("[(])")
 
 Notes:
 - Find a way to make more idiomatic
 - Try to use a HashMap to map close with open brackets
 */

// Write some tests, the happy path and the edge cases
assert(isValidParentheses("[]"), "Test 1 failed")
assert(isValidParentheses("([{}])"), "Test 2 failed")
assert(!isValidParentheses("[(])"), "Test 3 failed")
assert(!isValidParentheses(""), "Test 4 failed")
print("🚀 All the test passed, ready to launch")

//: [Next](@next)
