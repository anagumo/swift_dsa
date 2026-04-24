//: [Previous](@previous)

import Foundation

/**
 The problem: First Bad Version
 You are a product manager and currently leading a team to develop a new product.
 Unfortunately, the latest version of your product fails the quality check.
 Since each version is developed based on the previous version, all the versions after a bad version are also bad.

 Suppose you have n versions [1, 2, ..., n] and you want to find out the first bad one, which causes all the following ones to be bad.

 You are given an API bool isBadVersion(version) which returns whether version is bad. Implement a function to find the first bad version. You should minimize the number of calls to the API.
 
 Understand the problem
 - Read the statement twice
 
 Workout with examples out loud, understand the state of the data
 1. n = 5, bad = 4
 -> 4
 2. n = 1, bad = 1
 -> 1
 
 Ask clarifying questions:
 - Input / Output
 1. Should I return a boolean or the bad version?
 2. If the user enters an invalid version what sould I return? Ej. 0
 3. Should I accept just integers?
 - Constraints:
 4. What is a bad version?
 - Trade-off
 4. Should I priorize velocity or memory?
 
 Design the algorithm
 - Trigger: Find the first one
 - Dsa: Sorted array and Binary Search
 - Pseudocode:
 1. Read the input of the user
 2. Set low to zero and high to n
 3. While low is less or equal than high
    4. mid is equal to (low + high) / 2
        4. If mid is bad version
            5. High is equal to mid
        6. Else
            7. Low is equal to mid + 1
 8. Return low because is the first bad version
 
 Algorithm Complexity Analysis
 Time:
 -> O(log n) where (low + high) / 2
 -> O(1) where high = mid and low = mid + 1
 -> O(log n) logarithm time because start with a half of the problem
 Space:
 -> O(1) where high = mid and low = mid + 1
 -> O(1) constant time because we just update variables
 */

// Implement your solution in code

/**
 Harcoded API isBadVersion(version) -> Bool
 */
func isBadVersion(_ version: Int) -> Bool {
    version == 3
}

/// Implements the first bad version solution
/// - Parameter n: represents the limit of versions
/// - Returns: the first bad version in the range
/// - Complexity: O(log n) logarithm time because start with a half of the problem
func firstBadVersion(_ n: Int) -> Int {
    guard n >= 1 else {
        return -1
    }
    
    var low = 1
    var high = n
    
    while low < high {
        var mid = (low + high) / 2
        if isBadVersion(mid) {
            high = mid
        } else {
            low = mid + 1
        }
    }
    
    return low
}

// Add some tests, the happy path and edge cases
assert(firstBadVersion(5) == 3, "Test 1 failed")
assert(firstBadVersion(0) == -1, "Test 1 failed")
print("All tests passed, ready to launch 🚀")

//: [Next](@next)
