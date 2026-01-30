import UIKit
import Foundation
import PlaygroundSupport

/**
 PROBLEM: Valid palindrome
 
 A phrase is a palindrome, if after converting all uppercase letters into lowercase letters, and removing all non-alphanumeric characters, it reads the same forward and backward.
 
 UNDERSTAND THE PROBLEM:
 [x] Read statement (twice)
 
 [x] Work trough examples out loud
 Example 1: "A man, a plan, a canal: Panama"
    -> cleaned: "amanaplanacanalpanama"
    -> reversed: "amanaplanacanalpanama"
    -> same: `true`
 Example 2: "race a car"
    -> cleaned: "raceacar"
    -> reversed: "racaecar"
    -> same: `false`
 Example 3:  " "
    -> cleaned: ""
    -> reversed: ""
    -> same: `true`
 
 [x] Clarifying questions:
 - The function only needs to display `true` or `false`? Or add a friendly message?
 - What if the user enter numbers ex: `"12345"`,  should I consider the input as empty an the output as palindrome?
 - With this constraint: `1 <= s.length <= 2 * 10^5`, do you mean the max lenght input we will accept is 200000 charactares? otherwise what should I display
 - If the urser enters only specail characters,  should consider the input as empty an the output as palindrome?
 
 DESIGN THE ALGORITHM:
 [x]Naive solution sketch
 - Create a cleaned string filtering characters equal to letter or number
 - Compare the cleaned string with the cleaned (reversed)
 - In the middle I need to cast the reversed to String
 - Return true or false
 
 [x] Lower bound: O (n) - must read all characters at least one
 [x] Upper bound: O (n2) - naive approach comparing each char with all others
 
 [x] Triggers identified
 - Two pointers but I don't how to use it
 - Array to filter the string
 
 EXPLAIN YOUR SOLUTION:
 [x] Plain English approach
 Clean the string, compare clenead vs cleaned but reversed, return true or false
 
 [x] Data structure choice: [Array]
 [x] Algorithm choice: [Filter + reversed]
 
 COMPLEXITY ANALYSIS:
 [x] Time: O(n)  where n = input.count
    - lowercased(): 0(n)
    - filter: 0(n)
    - reversed(): 0(n)
    - comparison: 0(n)
    - Total: 0(n) + 0(n) + 0(n) + 0(n) = 0(4n) = 0(n)
 [x] Space: O(n)
    - cleaned string: 0(n) space
    - reversed() creates a copy: 0(n) space
    - Total: 0(2n) = 0(n)
 
 ASSUMPTTIONS:
 [None]
 */

///A predicate function that checks if a string is palindrome
///
///A phrase is a palindrome, if after converting all uppercase letters into lowercase letters, and removing all non-alphanumeric characters, it reads the same forward and backward.
///
///- Parameter input: a value of type `(String)` that represents the string to check
///- Returns: a value of type `(Bool)` that represents `true` if the input is palindorme, `false` otherwise
///
///## Example
///```swift
/////Example 1:
/////Input: input = "A man, a plan, a canal: Panama"
///isPalindrome(input)
/////Output: true
///
/////Example 2:
/////Input: input = "race a car"
///isPalindrome(input)
/////Output: false
///```
func isPalindrome(input: String) -> Bool {
    // Step 1: Validate empty input to skip all the process
    guard !input.isEmpty else { return true }
    guard input.count >= 1 && input.count <= Int(2 * pow(10.0, 5.0)) else { return false }
    // Step 2: Clean the string to lowercase and filter alpanumeric characters
    let cleaned = input
        .lowercased()
        .filter { $0.isLetter || $0.isNumber }
    // Step 3: Compare clenead vs cleaned but reversed
    return cleaned == String(cleaned.reversed())
}

func isPalindromeWithTwoPointer(input: String) -> Bool {
    // Step 1:  Validate empty string to skip all the process
    guard !input.isEmpty else { return true }
    // Step 2: onvert to an ordered array
    let characters = Array(input.lowercased())
    // Step 3: Configure two pointers
    var left = 0
    var right = characters.count - 1
    
    while left < right {
        // Step 4: Skip non-alphanumeric from left
        while left < right && !characters[left].isLetter && !characters[left].isNumber {
            left += 1
        }
        // Step 4: Skip non-alphanumeric from right
        while left < right && !characters[right].isLetter && !characters[right].isNumber {
            right -= 1
        }
        // Step 5: Compare characters
        if characters[left] != characters[right] {
            return false
        }
        
        left += 1
        right -= 1
    }
    
    return true
}

/**
 MANUAL TESTING
 */
//isPalindrome(input: " ")
//isPalindromeWithTwoPointers(input: " ")

/**
 VERIFY THE SOLUTION:
 [x] Top to bottom pass
 [x] Tricky expressions checked
 [x] Pass
 */

// TEST CASES
// Happy path tests
assert(isPalindrome(input: "A man, a plan, a canal: Panama"), "A man, a plan, a canal: Panama should be palindrome")
assert(isPalindrome(input: "Pop"), "Pop should be palindrome")
assert(!isPalindrome(input: "race a car"), "race a car should not be a palindrome")
// Edge cases tests
assert(isPalindrome(input: " "), "Empty string should be a palindrome")
assert(!isPalindrome(input: "12345"), "12345 should not be palindrome")
assert(isPalindrome(input: "#%&/$"), "#%&/$ should be palindrome")

// Happy path tests
assert(isPalindromeWithTwoPointer(input: "A man, a plan, a canal: Panama"), "A man, a plan, a canal: Panama should be palindrome")
assert(isPalindromeWithTwoPointer(input: "Pop"), "Pop should be palindrome")
assert(!isPalindromeWithTwoPointer(input: "race a car"), "race a car should not be a palindrome")
// Edge cases tests
assert(isPalindromeWithTwoPointer(input: " "), "Empty string should be a palindrome")
assert(!isPalindromeWithTwoPointer(input: "12345"), "12345 should not be palindrome")
assert(isPalindromeWithTwoPointer(input: "#%&/$"), "#%&/$ should be palindrome")

print("All tests passed ✅")
PlaygroundPage.current.needsIndefiniteExecution = false
