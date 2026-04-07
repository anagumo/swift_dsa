//: [Previous](@previous)

import Foundation
import PlaygroundSupport

/**
 PROBLEM: Two sum
 
 Given an array of integers nums and integer target, return indices of the two numbers such that they add up to target.
 
 You may assume that each input would have exactly one solution,
 and you may not use the same element twice.

 You can return the answer in any order.
 
 UNDERSTAND THE PROBLEM:
 [x] Read statement (twice)
 
 [x] Work trough examples out loud
 Example 1: nums: [2, 7, 11, 15], target: 9
    -> [2,  7, 11, 15]
    -> [2, 7]
    -> [0,1]
 Example 2: nums: [3,0,5,2], target: 8
    -> [0, 2, 3, 5]
    -> [3, 5]
    -> [2, 3]
 Example 3: nums: [1, 0, 1, 0, 2], target: 4
    -> [0, 0, 1, 1, 2]
    -> []
 
 [x] Clarify questions
 - If the user enter an empty array, what should I display?
 - If there are not numbers for the target, what should I display? Asum empty array
 - If there are more than two numbers for that target, should I return the first two ones?
 - What is the limit imput? also, should I accept negative numbers?
 
 DESIGN THE ALGORITHM:
 [x] Naive solution sketch
 Using Sort + Two Pointer
 - Create an ordered array of tuples (index, num)
 - Create two pointer: left, right
 - Move pointers until the numbers add up to target
 - Return indices
 Using Hash-Map
 - Create a hashMap
 - Iterate the array
 - Based on the current number, find the complement using the target
 - Find it o save it into the dictionary
 - Return the indices
 
 [x] Lower bound: 0(n) - must read all numbers at least one in the worst case
 [x] Upper bound: 0(n2) - naive approach adding each number with all others
 
 [x] Triggers identified
 - Nested Loop
 - Sort + Two Pointers
 - HashMap
 
 EXPLAIN YOUR SOLUTION:
 [x] Plain English approach
 Iterate the array, based on the current num find a complement, find or save the current num, return indices
 
 [x] Data structure choice: HashMap
 [x]Algorithm choice: ?
 
 COMPLEXITY ANALYSIS:
 [x] Time: O(n) where n = input.forEach
    - dict[key]:  O(1)
 [x] Space: O(n)
 */

///A selector function that return indices of the two numbers such that they add up to target
///
///You may assume that each input would have exactly one solution, and you may not use the same element twice. You can return the answer in any order.
///
///- Parameter nums: a value of type `([Int])` that represents the numbers to evaluate
///- Returns: a value of type `([Int])` that represents the selected indices
///
///## Example
///```swift
/////Example 1:
/////Input: nums = [2, 7, 11, 15], target = 9
///twoSum([2, 7, 11, 15], target: 9)
/////Output: [0,1]
/////Example 2: nums: [3,0,5,2], target: 8
/////Input: nums = [3,0,5,2], target = 8
///twoSum([3,0,5,2], target: 8)
/////Output: [0, 2]
/////Example 3: nums: [1, 0, 1, 0, 2], target: 4
/////Input: nums = [1, 0, 1, 0, 2], target = 4
///twoSum([1, 0, 1, 0, 2], target: 4)
/////Output: []
func twoSum(_ nums: [Int], target: Int) -> [Int] {
    // Step 1: Validate if the array is empty
    guard !nums.isEmpty else { return [] }
    // Step 2: Create a HashMap to save seen numbers
    var history: [Int: Int] = [:]
    // Step 3: Iterate the array to find a pair of numbers
    for (index, number) in nums.enumerated() {
        // Step 4: Get the complement of the current number
        let complement = target - number
        // Step 5: Check if the complement exists in the history
        if let savedIndex = history[complement] {
            // Step 6: Return the pair
            return [savedIndex, index]
        }
        // Step 7: Save the number in the history
        history[number] = index
    }
    return []
}

/**
 MANUAL TESTING
 */
twoSum([], target: 0)
twoSum([3,0,5,2], target: 8)

/**
 VERIFY THE SOLUTION:
 [x] Top to bottom pass
 [x] Tricky expressions checked
 [x] Pass
 */

// Test cases
assert(twoSum([], target: 2) == [], "Expected [] in 94/twoSum")
assert(twoSum([2, 7, 11, 15], target: 9) == [0, 1], "Expected [0,1] in 94/twoSum")
assert(twoSum([3,0,5,2,5], target: 2) == [1,3], "Expected [1,3] in 94/twoSum")
assert(twoSum([1, 0, 1, 0, 2], target: 4) == [], "Expected [] in 94/twoSum")

print("All two_sum tests passed (12) ✅")
PlaygroundPage.current.needsIndefiniteExecution = false

//: [Next](@next)
