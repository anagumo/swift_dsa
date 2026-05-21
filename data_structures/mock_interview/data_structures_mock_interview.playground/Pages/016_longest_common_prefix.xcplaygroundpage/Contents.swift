//: [Previous](@previous)

import Foundation

/**
 The problem: Longest Common Prefix
 You are given an array of strings strs. Return the longest common prefix of all the strings
 If there is no longest common prefix, return an empty string ""
 
 Work out with examples, understand the state of data
 1. words = ["dance","dag","danger","damage"]
 -> "da"
 2. words = ["bat","bag","bank","band"]
 -> "ba"
 3. words = ["neet","feet"]
 -> ""
 
 Ask clarifying questions:
 - Input/Output
 1. What happens if the array is ["bat","bag","bank","bind"], ¿would the output be b?
 2. What happens if the array is ["bat","bag","bank","neet"], ¿would the output be ""?
 - Trade-offs
 3. Should I priorize time or space complexity
 
 Design the algorithm
 - Trigger: longest common
 - Dsa: Array with pointer
 - Pseudocode:
 1. If words array is empty
    2. return empty
 3. Else
    4. Create a list of words where each element is an array of characters
    5. Create a variable to store the length of min word, necessry to avoid an index out of range
    6. Create a variable to store prefix and pointer to move across characters
    7. While pointer is less than the min word count
        8. For each word in word
            9. If the current character of the word is different of the first word character
                10. Return the prefix
        11. Append the prefix
        13. Increase by one the pointer
 14. Return the prefix
 
 Algorithm complexity analysis
 run in O(n*m) time with O(1) extra memory
 */

// Implement your solution in code

/// Evaluates a list of strings and returns the common prefix
/// - Parameter strs: represents the list of words
/// - Returns: the longest common prefix in all words
/// - Complexity: O(n*m) time and O(1) space, where `n` is the length of `strs` and `m` the length of each word
func longestCommonPrefix(_ strs: [String]) -> String {
    guard !strs.isEmpty else {
        return ""
    }
    let words = strs.map { Array($0) }
    let minWordCount = words.min(by: { $0.count < $1.count })?.count ?? 0
    var prefix = [Character]()
    var ptr = 0

    while ptr < minWordCount {
        let firstWordChar = words[0][ptr]
        for word in words {
            if word[ptr] != firstWordChar {
                return String(prefix)
            }
        }
        prefix.append(firstWordChar)
        ptr += 1
    }
    
    return String(prefix)
}

/**
 Notes:
 - Idiomatic way
 ```swift
 if words.allSatisfy({ $0[ptr] == firstChar }) {
    prefix.append(firstChar)
 } else {
    break
 }
 ```
 */

assert(longestCommonPrefix(["dance","dag","danger","damage"]) == "da", "Test 1 failed")
assert(longestCommonPrefix(["bat","bag","bank","band"]) == "ba", "Test 2 failed")
assert(longestCommonPrefix(["neet","feet"]) == "", "Test 3 failed")
assert(longestCommonPrefix(["flower", "flow"]) == "flow", "Test 4 failed")
print("All tests passed, ready to launch 🚀")

//: [Next](@next)
