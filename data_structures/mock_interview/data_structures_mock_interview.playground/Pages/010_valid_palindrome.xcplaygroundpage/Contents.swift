//: [Previous](@previous)

import Foundation

/**
 The problem: Valid palindrome
 Given a string s, return true if it is a palindrome, otherwise return false.
 A palindrome is a string that reads the same forward and backward. It is also case-insensitive and ignores all non-alphanumeric characters.
 Note: Alphanumeric characters consist of letters (A-Z, a-z) and numbers (0-9).
 
 Understand the problem
 - Read the statement twice
 
 Work out with examples out loud, understand the state of the data
 1. "level?"
 -> true
 2. "car wash"
 -> false
 3. ""
 -> true
 
 Ask clarifying questions
 Input / Output
 - Is an empty string a valid palindrome?
 - Should I consider spaces as non alphanumeric characters?
 - Is the comparison case-sensitive?
 
 Design the algorithm
 - Trigger: palindrome (reads the same forward and backward)
 - Dsa: Array + Two Pointers
 - Pseudocode:
 1. Create two variables for prt1 and ptr2 -> O(1) space complexity
 2. Convert the string to an array
 3. Set ptr1 to 0 and ptr2 to string array count - 1
 4. While ptr1 is less than ptr2 -> O(n) time complexity
    5. If string array subscript ptr1 is a non alphanumeric character
        6. Set ptr1 to ptr1 + 1 to skip the character
    7. If string array subscript ptr2 is a non alphanumeric character
        8. Set ptr2 to ptr2 - 1 to skip the character
    9. If ptr1 and ptr2 are equal
        10. Set ptr1 to ptr1 + 1
        11. Set ptr2 to ptr2 - 1
        12. Go to the line 4
    13. Else
 14. Return true
 
 Algorithm complexity analysis
 Time:
 -> `O(n) where while ptr1 < ptr2`
 -> `O(n)` linear complexity
 In the worst case reads all characters in the string because the work is based on the input size
 In the best case the first and the last alphanumeric characters are different
 Space:
 -> `O(1) where ptr1 += 1 and ptr2 -= 1`
 -> `O(1)` constant complexity
 */

// Implement your solution in code

/// Implements valid palindrome
/// - Parameter text: represent the input to check if is a valid palindrome
/// - Returns: true if is valid palindrome, false otherwise
/// - Complexity: O(n) time complexity  where n is the length of the input
func isPalindrome(_ text: String) -> Bool {
    guard !text.isEmpty else {
        return true
    }
    
    let sArray = Array(text)
    var ptr1 = 0
    var ptr2 = sArray.count - 1
    
    while ptr1 < ptr2 {
        // Skip non alpanumeric characters
        if !sArray[ptr1].isLetter && !sArray[ptr1].isNumber {
            ptr1 += 1
            continue
        }
        if !sArray[ptr2].isLetter && !sArray[ptr2].isNumber {
            ptr2 -= 1
            continue
        }
        
        // Validate alphanumeric characters
        if sArray[ptr1].lowercased() == sArray[ptr2].lowercased() {
            // Characters are equal and ptrs move inside the string
            ptr1 += 1
            ptr2 -= 1
        } else {
            // Is not a valid palindrome
            return false
        }
    }
    
    // Is a valid palindrome
    return true
}

//isPalindrome("?,?")

/**
 Notes:
 - I convert the string to an Array because String subscript in Swift gives O(n) for each char.
 */

// Write some tests, the happy path and edge cases
assert(isPalindrome("level?"), "Test 1 failed")
assert(!isPalindrome("car wash"), "Test 2 failed")
assert(isPalindrome(""), "Test 3 failed")
assert(isPalindrome("Was it a car or a cat I saw?"), "Test 4 failed")
assert(!isPalindrome("tab a cat"), "Test 5 failed")
assert(isPalindrome("?,?"), "Test 6 failed")
print("All tests passed, ready to launch 🚀")

//: [Next](@next)
