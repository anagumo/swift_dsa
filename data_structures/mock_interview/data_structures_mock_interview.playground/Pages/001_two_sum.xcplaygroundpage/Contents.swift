//: [Previous](@previous)

import Foundation

/**
 The problem: Two Sum
 Given an array of integers `nums` and integer `target`, return indicies of the two numbers such that they add up to `target`
 You may assume that each input would have exactly one solution, and you may not use the same elemement twice.
 You can return the answer in any order.
 
 Constraints:
 - `nums.length` should be greater than or equal to 2 and less than or equal to 10 to 4  elements.
 - `nums[i]` should be greater than or equal to -10 to 9 and less than or equal to 10 to 9
 - `target` should be greater than or equal to -10 to 9 and less than or equal to 10 to 9
 - Only one valid answer exists
 
 Undersatnd the problem:
 - Read the statement twice
 
 Work trough examples out loud, understand the state of the data:
 1. nums = [2,7,11,15], target = 9
 -> [0,1]
 2. nums = [3,2,4], target = 6
 -> [1,2]
 3. nums = [3,3], target = 8
 -> []
 
 Ask clarifiying questions:
 1. If the array is empty, should I display [], the same if there are not number that add uo to `target`
 2. If the array has duplicated elements, should I return the first concidence?
 3. Should be optimize to an specific time complexity?
 
 Design the algorithm:
 - Triggers: two numbers
 - Data structure options:
 1. An array, for each element compare with all others
 Time complexity:
 > O(n^2) or quadratic complexity
 -> 0(4^2)
 -> 16 steps
 Space complexity:
 O(1) because just create a variable
 2. A dictionary, to store and search complements
 Time complexity:
 -> O(n) `where nums.forEach`
 -> O(1) `where dictionary.contains(element)`
 -> O(n) linear complexity
 - In the worst case must read all numbers in the array
 - In the best case the first and second element add up to target
 Space complexity:
 -> O(n) `where dictionary[index] = number`
 -> O(n)  linear complexity
 - In the worst case must store all numbers in the array
 - In the best case need to store just the first element
 
 - Dsa selected: Dictionary / hasmap
 - Trade-off: The memory used by this data structure is an acceptable trade-off here
 - Sketch my solution:
 1. Create a dictonary to store complements
 2. Iterate the array
 3. For each element: `complement = target - currentNumber`
 4. Search `complement` in the dictonary
 5. Return `complement` and `currrentNumber` indices
 */

/**
 Implement the solution in code
 */

/// A function that returns indiices of two elements such that they add upp to target.
/// You may assume that each input would have exactly one solution, and you may not use the same elemement twice.
/// You can return the answer in any order.

/// Constraints:
/// - `nums.length` should be greater than or equal to 2 and less than or equal to 10^4  elements.
/// - `nums[i]` should be greater than or equal to -10^9 and less than or equal to 10^ 9
/// - `target` should be greater than or equal to -10^9 and less than or equal to 10^9
/// - Only one valid answer exists
///
/// ```swift
/// twoSum([2,7,11,15], target: 9) // returns [0,1]
/// twoSum([3,2,4], target: 6) // returns [1,2]
/// twoSum([3,3], target: 8) // returns []
/// ```
///
/// - Parameters:
///   - nums: The sequence of Numeric elements to add up
///   - target: The target to search by add up two numbers
/// - Returns: The indices of two elements that add up to target, or empty
/// - Complexity: O(n) time and O(n) space in the worst case, where n is the length of the sequence.
func twoSum(_ nums: [Int], target: Int) -> [Int] {
    // Create a data structure to store complements
    var complements: [Int: Int] = [:]
    
    // Search for two numbers add up to target
    for (index, number) in nums.enumerated() {
        // Calculate the complement
        let complement = target - number // 9 - 2 = 6
        
        // Search the complement in the dictionary
        if let complementIndex = complements[complement] { // complements[6]
            // Return stored complement and the current index
            return [complementIndex, index]
        }
        
        // Insert the key/ value for the complement calculated
        complements[number] = index // Fixed: complements[complement] = index
    }
    
    // Note: problem guarantees exactly one solution,
    // so this return should never be reached
    return []
}

/**
 Make a sistematic debuggin, understand the state of your data
 
 Take notes if needed:
 */

twoSum([2,7,11,15], target: 9)

/**
 Write some tests: the happy path and edge cases
 */
assert(twoSum([2,7,11,15], target: 9) == [0,1], "Test 1 failed")
assert(twoSum([3,2,4], target: 6) == [1,2], "Test 2 failed")
assert(twoSum([3,3], target: 8) == [], "Test 3 failed")
assert(twoSum([], target: 2) == [], "Test 4 failed")

print("✅ All tests passed!")

/**
 Result:
 1 / twoSum + drawing / 12:15:44 / 01:33:36.519/ 2026-03-24
*/

//: [Next](@next)
