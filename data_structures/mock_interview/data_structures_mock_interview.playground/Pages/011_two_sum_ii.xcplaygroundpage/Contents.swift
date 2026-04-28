//: [Previous](@previous)

import Foundation

/**
 The problem: Two Sum II
 Given an array of integers numbers that is sorted in non-decreasing order.
 Return the indices (1-indexed) of two numbers, [index1, index2], such that they add up to a given target number target and index1 < index2. Note that index1 and index2 cannot be equal, therefore you may not use the same element twice.
 There will always be exactly one valid solution.
 
 Understand the problem
 - Read the statament twice
 
 Work out with examples out loudm, understan the state of the data
 1. numbers = [2,7,11,15], target = 9
 -> [1,2]
 2. number = [1,2,3,4,5], target = 9
 -> [4,5]
 3. numbers = [], target = 9
 
 Ask clarifying questions
 - Input/Outout
 1. What should I display if the user enters an empty list?
 2. Can I use the same element twice?
 
 Design the algorithm
 - Trigger: Sorted array, two numbers
 - Dsa: Array + Two Pointers
 - Pseudocode:
 1. Create two variables for prt1 and ptr2 -> O(1) space complexity
 2. Set ptr1 to 0 and ptr2 to numbers count - 1
 3. While ptr1 is less than ptr2 -> O(n) time complexity
    4. Sum numbers[ptr1] + numbers[ptr2]
    5. If the sum is equal to the target
        6. Return [ptr1 + 1, ptr2 + 1]
    7. If sum is less than the target
        8. Move ptr1 one index to the right
        9. Go to the line 4
    10. Else
        11. Move ptr2 one index to the left
        12. Go to the line 4
 13. Return an empty array
 
 Algorithm complexity analysis:
 - Suggested: Run in O(n) time and O(1) as aditional space
 Time
 -> `O(n) where while ptr1 < ptr2`
 -> 3 steps since the work is based on the input size except for the number itself
 In the worst case we read all the numbers
 In the best case the first two numbers add up to the target
 Space
 -> `O(1) where ptr1 + 1 and ptr2 - 1`
 -> O(1) constant complexity because just two variables are updated
 */

// Implement your solution in code
func twoSum(_ numbers: [Int], target: Int) -> [Int] {
    // Configure two pointers
    var ptr1 = 0, ptr2 = numbers.count - 1
    
    while ptr1 < ptr2 {
        // Add up to the target
        let sum = numbers[ptr1] + numbers[ptr2]
        
        if sum > target {
            // Move ptr2 one index to the left
            ptr2 -= 1
        } else if sum < target {
            // Move ptr1 one index to the right
            ptr1 += 1
        } else {
            // Return the indices incremented by one
            return [ptr1 + 1, ptr2 + 1]
        }
    }
    
    return []
}

// Write some tests, the happy path and edge cases
assert(twoSum([2,7,11,15], target: 9) == [1,2], "Test 1 failed")
assert(twoSum([1,2,3,4,5], target: 9) == [4,5], "Test 2 failed")
assert(twoSum([], target: 9) == [], "Test 3 failed")
print("All tests passsed, ready to launch 🚀")

//: [Next](@next)
