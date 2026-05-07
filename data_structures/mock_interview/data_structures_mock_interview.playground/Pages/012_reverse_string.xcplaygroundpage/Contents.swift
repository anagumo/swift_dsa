//: [Previous](@previous)

import Foundation

/**
 The problem: Reverse string
 You are given an array of characters which represents a string s. Write a function which reverses a string.
 You must do this by modifying the input array in-place with O(1) extra memory.
 
 Understand the problem
 - Read the statement twice
 
 Work out with examples out loud to understand the state of the data
 1. s: ['a','s','t','r','o']
 -> ['o','r','t','s','a']
 2. s: ['n','e','e','t']
 -> ['t','e','e','n']
 3. s: []
 -> []
 
 Ask clarifying questions
 - Input/Outout questions
 1. Should I receive an array of characters?
 2. Should I return something or just modified the value in place?
 3. What shoul I display if the input is empty?
 
 Design the algorithm
 - Trigger: reverse, string
 - Dsa selected: array and two pointer pattern
 - Pseudocode:
 1. Create two variables for prt1 and ptr2 -> O(1) space complexity
 2. Set ptr1 to 0 and ptr2 to array count - 1
 3. While ptr1 is less than ptr2 -> O(n) time complexity
    4. If ptr1 and ptr2 values are equal
        5. Go to the line 8
    6. Else
        7. Swap prt1 and ptr2 values
    8. Move ptr1 one index to the right
    9. Move ptr2 one index to the left
        10. Go to line 3
 11. Exit
 
 Algorithm complexity
 - Time
 -> O(n) where `while ptr1 < ptr2`
 -> O(n) linear complexity because the work is based on the input size
 In the worst case we read all the characters in the string
 - Space
 -> O(1) `where s[ptr1] = s[ptr2]` and viceversa
 -> O(1) constant complexity because we just update vars
 */

// Implement the solution in code

/// Implements a reverse string in place
/// - Parameter s: represent the string array to be reversed
/// - Complexity: O(n) in time with O(1) extra memory, where n is the length of the input
func reverseString(_ s: inout [Character]) {
    var ptr1 = 0
    var ptr2 = s.count - 1
    
    while ptr1 < ptr2 {
        // Manual swap to show the underlaying logic
        let ptr1Value = s[ptr1]
        // Modify local copy (copy-in)
        s[ptr1] = s[ptr2]
        s[ptr2] = ptr1Value
        // Move both pointers to center
        ptr1 += 1
        ptr2 -= 1
    }
    
    // Function returns and copy-out to the original heap
}

/**
 Add some notes
 - Swift idiomatic way
 `s.swapAt(ptr1, ptr2)`
 */

// Add some tests: the happy path and the edge cases
var s1: [Character] = ["a","s","t","r","o"]
reverseString(&s1) // -> ["o", "r", "t", "s", "a"]
var s2: [Character] = ["n","e", "e", "t"]
reverseString(&s2) // -> ["t", "e", "e", "n"]
var s3: [Character] = []
reverseString(&s3) // -> []

assert(s1 == ["o", "r", "t", "s", "a"], "Test 1 failed")
assert(s2 == ["t", "e", "e", "n"], "Test 2 failed")
assert(s3 == [], "Test 3 failed")
print("All tests passed, ready to launch 🚀")

//: [Next](@next)
