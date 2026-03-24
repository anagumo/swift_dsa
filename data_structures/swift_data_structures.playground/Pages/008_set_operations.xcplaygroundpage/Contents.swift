//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

/**
 The problem:
 From a list of active users and another list of premium users,
 return active users that aren't premium.
 
 Understand the problem:
 - Read statement twice
 
 - Work through examples out loud, understand the state of the data:
 1. activeUsers = [12, 45, 23, 1, 3], premiumUsers = [12, 23]
 -> [45, 1, 3]
 2. activeUsers =[12, 45, 23, 1, 3], premiumUsers = [12, 45, 23, 1, 3]
 -> []
 
 - Ask clarifying questions
 1. Should I consider a max length for the input lists?
 2. Should I display [] if the are not active users without premium status?
 3. Both lists are Arrays or Sets?
 
 Design the algorithm
 - Trigger:
 difference
 - Options:
 Array /
 Create a new array to store users
 Iterate elements in the active users -> O(n)
 For each element iterate elements in premium users -> O(n2)
 Validate if active user is different to premium user
 Append it to the list
 Quadratic time complexity -> O(n2)

 Set /
 Create a new array to store users
 Convert premium users to a Set -> O(n)
 Iterate elements in the array -> O(n)
 Validate if the element does not belongs to the set  -> O(1)
 Append it to the list
 Linear time complexity -> O(2n) -> O(n)

 Set/
 Convert active users to a Set -> O(n)
 Convert premium users to a Set -> O(n)
 Subtract from A elements of B -> O(n)
 Linear time complexity  -> O(3n) -> O(n)
 
 - Dsa selected: Set with subtracting O(n)
 - Sketch your solution:
 1. Convert active users to a Set
 2. Convert premium users to a Set
 3. Subtract form active users, elements of premium users
 4. Return the new set
 
 Algorithm complexity analysis
 1. Time:
 -> O(n) where activeUsers.toSet
 -> O(n) where premiumUsers.toSet
 -> O(n) where activeUsers.subtracting(premiumUsers)
 -> O(3n)
 -> O(n) linear complexity because the work is based on the size of the input
 In the worst active users and premium uses has the same cardinality
 In the best case, premium user set is empty
 2. Space:
 -> O(n) activeUsers.subtracting(premiumUsers)
 -> O(n) linear complexity because the set increase its size based on the set size
 In the worst active users and premium uses has the same cardinality
 In the best case, premium user set is empty
 */

/**
 From two list of users, returns the elements of A that do not belong to B
 
 ```swift
 setOperation(activeUsers: [12, 45, 23, 1, 3], premiumUsers: [12, 23]) // returns [45, 1, 3]
 setOperation(activeUsers: [12, 45, 23, 1, 3], premiumUsers: [12, 45, 23, 1, 3]) // returns []
 
 ```
 
 - Parameters:
 - activeUsers: List of active user in the last month
 - premiumUsers: List of premium users that has an active suscrption
 - Returns: A set of active users that has not a suscription
 - Complexity: O(n)  time and O(n) space in the worst case, where n is the length of the sequence.
 */
func setOperation(activeUsers: [Int], premiumUsers: [Int]) -> Set<Int> {
    Set(activeUsers).subtracting(Set(premiumUsers))
}

/**
 Make a sistematic debuggin, understand the state of your data
 
 Take notes if needed:
 - Swift idiomatic pattern
 Use subtracting
 */
setOperation(activeUsers: [12, 45, 23, 1, 3], premiumUsers: [12, 23])
setOperation(activeUsers: [], premiumUsers: [12, 23])

/**
 Write some tests: the happy path and edge cases
 */
assert(setOperation(activeUsers: [12, 45, 23, 1, 3], premiumUsers: [12, 45, 23, 1, 3]) == Set<Int>(), "Test 1 failed")
assert(setOperation(activeUsers: [], premiumUsers: [12,23]) == Set<Int>(), "Test 2 failed")
print("✅ All tests passed!")

//: [Next](@next)
