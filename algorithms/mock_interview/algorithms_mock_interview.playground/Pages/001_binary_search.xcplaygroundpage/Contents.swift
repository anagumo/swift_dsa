import Foundation

/**
 The problem: Binary Search
 You are given an array of distinct integers nums, sorted in ascending order, and an integer target.
 Implement a function to search for target within nums. If it exists, then return its index, otherwise, return -1.

 Constraints:
 - Your solution must run in O(log n) time
 - `1 <= nums.length <= 10000`
 - `-10000 < nums[i], target < 10000`
 - All the integers in nums are unique
 - `nums` is sorted in ascending order.
 
 Understand the problem
 - Read the statement twice
 
 Work out with example, understand the state of the data
 1. nums = [-1,0,3,5,9,12], target = 9
 -> 4 // 9 exists in nums and its index is 4
 2. nums = [-1,0,3,5,9,12], target = 2
 -> -1 // 2 does not exists in nums so return -1
 3. nums = [], target 0
 -> -1 // 0 does not exists in nums so return -1
 
 Clarifying questions
 - Input/Output
 1. If the array is empty, what should I return? -1
 - Constraints
 2. I need to validate  If the array is not sorted or has unique elements?
 3. Should I priorize iiteratively or recursively?
 - Trade-off
 3. As assumption I'm going to priorize the velocity vs space
 
 Sketch your solution
 - Trigger: sorted array
 - Algorithm selected: Binary Search
 1. Create a low and high variables to store the current middle
 2. Crate a target variable to store the element to find
 3. Iterate the list `while low < high`
 4. Validate if current element is equal, less or grater
 5. Update the middle
 6. Return the index, or `-1` if the target does not exists in the list
 
 Algorithm complexity analysis
 - Time
 -> O(log n) `where mid = (low + high) / 2`
 -> O(log n) logarithm complexity
 In the worst case the target is in the last middle
 In the best case the target is equal to the first middle
 - Space
 -> O(1) where  `low = mid + 1`, `mid = (low + high) / 2`, `high = low - 1`
 -> O(1) constant complexity
 In the worst and best case with just need to update these variables
 */

// Implement your solution in code

/// Implements binary search in a sorted array to search for target within a list of unique elements.
/// If it exists, then return its index, otherwise, return -1.
///
/// Constraints:
/// - Your solution must run in O(log n) time
/// - `1 <= nums.length <= 10000`
/// - `-10000 < nums[i], target < 10000`
/// - All the integers in nums are unique
/// - `nums` is sorted in ascending order.
/// - Parameters:
///   - nums: Represents a generic list of unique elements
///   - target: Represents a generic comparable element to search for
/// - Returns: The index of the element in the list, otherwise -1
/// - Complexity: Time: O(log n) logarithm, Space: O(1) constant. Where n is the lenght of the list.
func search<T: Comparable>(_ nums: [T], target: T) -> Int {
    // Validate if nums is empty
    guard !nums.isEmpty else { return -1 }
    var low: Int = 0
    var high = nums.count - 1
    
    // Iterate the list
    while low <= high {
        // Calculate the middle
        let mid = (low + high) / 2
        if nums[mid] == target {
            // The target is in the middle
            return mid
        } else if target > nums[mid] {
            // Move the pointer to the rigth
            low = mid + 1
        } else {
            // Move the pointer to the left
            high = mid - 1
        }
    }
    
    // The target does not exists in the list
    return -1
}

/**
 Make a systematic debugging, understand the state of my data
 search([-1,0,3,5,9,12], target: 9)
 */

// Write some tests, the happy path and the edge cases
assert(search([-1,0,3,5,9,12], target: 9) == 4, "Test 1 failed")
assert(search([-1,0,3,5,9,12], target: 2) == -1, "Test 2 failed")
assert(search([], target: 9) == -1, "Test 3 failed")
print("✅ All tests passed!")

//: [Next](@next)
