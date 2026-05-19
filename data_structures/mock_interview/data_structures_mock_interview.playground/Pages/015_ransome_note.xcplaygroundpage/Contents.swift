//: [Previous](@previous)

import Foundation

/**
 The problem: Ransom Note
 Given two strings `ransomNote` and `magazine`, return `true` if `ransomNote` can be constructed by using the letters from `magazine` and `false` otherwise.
 Each letter in `magazine` can only be used once in `ransomNote`.
 Constraints:
 - `ransomNote` and `magazine` consist of lowercase English letters.
 
 Work out with examples, understand the state of the data
 1. ransomNote = "a", magazine = "b"
 -> `false`
 2. ransomNote = "aa", magazine = "ab"
 -> `false`
 3. ransomNote = "aa", magazine = "aab"
 -> `true`
 
 Ask clarifying questions:
 - Input/Output
 1. Should I clean the string?
 2. What should I display if `ransomNote` or both are empty?
 - Trade-offs
 3. Should I prioritize time or space complexity?
 
 Design the algorithm
 - Trigger: contains letters
 - Dsa: HashMap
 - Pseudocode:
 1. create a HashMap to count frequencies of `magazine`
 2. count frequencies of `magazine`
 3. for each letter in `ransomNote`
    4. If not exist in the HashMap
        5. return `false`
    6. If exist but the count is zero
        8. Return `false`
    9. else
        10. decrease count by one
 11. return `true`
 
 Algorithm complexity analysis
 - Time
 -> O(n) where `for letter in magazine`
 -> O(n) where `for letter in ransomNote`
 -> O(n)  time complexity since we read all  letters in at least one string
 - Space
 -> O(1) where `magazineFrequencies[letter, default: 0] += 1 / -= 1`
 -> O(1) space complexity since the hash map has a fixed size (26 letters)
 */

// Write your solution in code

/// Given two strings validates if the string 1 can be constructed by using the letters from string 2
/// - Parameters:
///   - ransomNote: represent the string that needs to be constructed
///   - magazine: represent the bank of letters to be used
/// - Complexity: O(n) time and O(1) space, where `n` is the length of the longest input string
/// - Returns: `true` if `ransomNote` can be constructed by using the letters from `magazine` and `false` otherwise
func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    // create a hash map to count frequencies
    var magazineFrequencies = [Character:Int]()
    // count frequencies of `magazine`
    for letter in magazine {
        magazineFrequencies[letter, default: 0] += 1
    }
    // read `ransomNote`
    for letter in ransomNote {
        // validate if the hash map contains one or more frequencies of the current letter
        guard let count = magazineFrequencies[letter], count > 0 else {
            return false
        }
        magazineFrequencies[letter] = count - 1
    }
    
    // the hash map contains all letters of ransom note
    return true
}

// Write some tests, the happy path and the edge cases
assert(!canConstruct("a", "b"), "Test 1 failed")
assert(!canConstruct("aa", "ab"), "Test 2 failed")
assert(canConstruct("aa", "aab"), "Test 3 failed")
assert(canConstruct("", ""), "Test 4 failed")
print("All tests passed, ready to launch 🚀")

//: [Next](@next)
