//: [Previous](@previous)

import Foundation

/**
 PROBLEM: Common Longest Prefix
 
 Write a function to find the longest common prefix string amongst an array of strings.
 If there is no common prefix, return an empty array.

 UNDERSTAND THE PROBLEM:
 [x] Read statement (twice)

 [x] Work through examples out loud:
 Example 1: strs = ["flower", "flow", "flight"]
    -> "fl"
 Example 2: strs = ["dog", "racecar", "car"]
    -> ""
 Example 3: strs = ["123", "12", "3"]
    -> ["123", "12"]
    -> "12"

 [x] Ask Clarifying questions:
 1. Should I clean each string to have just lowercase letters?
 2. Should accept string numbers or just words?
 3. What should I display if the array is empty?
 4. Should I consider array length <= 200 words and word lengt <= 200
 5. Should I have just words or text too?
 6. Does the array include duplicated words?

 DESIGN THE ALGORITHM:
 [x] Naive solution sketch:
 - First sort the array alphabetical a < b -> O(n log n)
 - Compare all letters from the first and the last word -> O(n)
 - Return the longestPrefix in the array

 Upper bound: O(n log n): compare a word with all other words, worst case
 Lower bound: O(n2): compare each character of a word with all other charcters of the words

 [x] Triggers identified:
- longest prefix
- Array + Sort + Zip

 EXPLAIN THE SOLUTION:
 [x] Plain English approach:
 "I will sort the array alphabetically, create two pointers, compare both pointers, return the longest prefix"

 Data structure choice: [Array] because I need compare, in the word case, all elements
 Algorithm choice: For using zip two compare each letter of the frist and last words

 COMPLEXITY ANALYSIS:
 Time: O(n log n) where = array.sort()
    -> zip(firstWord, lastWord) -> O(n)
 Space: O(n) because is just the array size

 ASSUMPTIONS:
 - The list has no duplicated elements
 - All elements are lowercased
**/

/// A compressor function that returns the longest common prefix in a list of words
/// - Parameter strs: a value of type `([String])` that represents the list of words
/// - Returns: a value of type `(String)` that represents the longest common prefix
/// - Complexity: O(n), where n is the length of the sequence.
/// # Examples:
/// ```swift
///longestCommonPrefix(["flower", "flow", "flight"])
///// Output: "fl"
////longestCommonPrefix(["dog", "racecar", "car"])
///// Output: ""
///longestCommonPrefix(["flower", "fliw", "fli", "flight", "car","dog", "racecar"])
///// Output: "fli"
///longestCommonPrefix([])
///// Output: ""
/// ```
func longestCommonPrefix(strs: [String]) -> String {
    // Step 1: validate if the array has elements
    guard !strs.isEmpty else {
        return ""
    }
    
    // Step 2: configure storage variables
    let sorted = strs.sorted()
    var left = 0
    var right = sorted.count - 1
    var longestPrefix = ""
    
    // Step 3: compare the fisrt and last word
    for (char1, char2) in zip(sorted[left], sorted[right]) {
            if char1 == char2 {
                longestPrefix.append(char1)
            } else {
                break
            }
        }
    
    // Step 4: return the longest common prefix
    return longestPrefix
}

longestCommonPrefix(strs: ["flower", "fliw", "fli", "flight", "car","dog", "racecar"])

// MANUAL TESTING
/**
 var strs = ["flower", "fliw", "fli", "flight", "car","dog", "racecar"]
 strs.sort {
    $0 < $1
 }
 //["car", "dog", "fli", "flight", "fliw", "flower", "racecar"]
 "word".prefix(3)
 // "wor"
longestCommonPrefix(strs: [])
longestCommonPrefix(strs: ["flower", "flow", "flight"])
 **/

// TEST CASES:
assert(longestCommonPrefix(strs: ["flower", "flow", "flight"]) == "fl", "Test 1 failed")
assert(longestCommonPrefix(strs: ["dog", "racecar", "car"]) == "", "Test 2 failed")
assert(longestCommonPrefix(strs: ["flower", "fliw", "fli", "flight", "car","dog", "racecar"]) == "", "Test 2 failed")
assert(longestCommonPrefix(strs: []) == "", "Edge case failed")
print("✅ All tests passed!")

//: [Next](@next)
