//: [Previous](@previous)

import Foundation

/**
 The problem:
 Find the first duplicate element
 Based on a list of visited houses, what is the first one visited twice?
 
 Constraints:
 1. Preserve the order of each element appears in the list
 2. Avoid nested loops
 3. Avoid sorted() usage
 4. Add at least 1 test
 
 Understand the problem:
 - Read statement twice
 
 - Work through examples out loud, understand the state of the data:
 1. list = [101, 205, 101, 205]
 -> 101
 2. list = [101, 205, 304, 500]
 -> nil
 
 - Ask clarifying questions
 1. Should I consider a max length for the input?
 2. Should I display nil if the input is empty?
 
 Design the algorithm
 - Trigger: duplicates
 - Dsa selected: Set with constant lookup time
 - Sketch your solution:
 1. Create a Set to save seen elements history
 2. Iterate the list
 3. Validate if the set contains the element
 4. If the set contains the element, return it
 5. else, mark element as seen
 6. No duplicates found - return nil
 
 Algorithm complexity analysis
 1. Time:
 -> O(n) where array.forEach()
 -> O(1) where set.contains(element)
 -> O(n) linear complexity because the work is based on the size of the input
 In the worst case reads all elements in the list
 In the best case, the first two elements are equal - O(1) efective
 2. Space:
 -> O(n) where set.insert(element)
 -> O(n) linear complexity because the set increase its size based on the unique elements in the input
 In the worst case the set saves all elements in the list
 In the best case the set saves just 1 element
 */

/**
 Implement the solution in code
 */

/// Returns the first element that appears more than once, preserving the original order of appearance.
///
///```swift
///findFirstDuplicate(elements: [101, 205, 101, 205]) // returns 101
///findFirstDuplicate(elements: [101, 205, 304, 500]) // returns nil
///
///```
///
/// - Parameter elements: The sequence of Hashable elements to search.
/// - Returns: The first duplicated element, or `nil` if all elements are unique.
/// - Complexity: O(n)  time and O(n) space in the worst case, where n is the length of the sequence.
func findFirstDuplicate<T: Hashable>(elements: [T]) -> T? {
    var history = Set<T>()
    // Step 2. Search for duplicates in the list
    for element in elements {
        if history.contains(element) {
            return element
        } else {
            history.insert(element)
        }
    }
    // Step 3. No duplicates found
    return nil
}

/**
 Make a sistematic debuggin, understand the state of your data
 
 Take notes if needed:
 - Swift idiomatic pattern
 ```swift
 // Just mark as seen and continue
 guard history.insert(element).inserted else {
     return element
 }
 
 // This line `history.insert(element).inserted` returns a tuple of `(inserted: Bool, memberAfterInsert: T)`
 // To improve this read Apple open source libraries (swift-collections)
 // Always ask yourself if there is a more native way to do it
 ```
 */

/**
 Write some tests: the happy path and edge cases
 */
assert(findFirstDuplicate(elements: [101, 205, 101, 205]) == 101, "Test 1 failed")
assert(findFirstDuplicate(elements: [101, 205, 304, 500]) == nil, "Test 2 failed")
assert(findFirstDuplicate(elements: [Int]()) == nil, "Test 3 failed")
assert(findFirstDuplicate(elements: ["Ana", "Bob", "Ana"]) == "Ana", "Test 4 failed")
print("✅ All tests passed!")

//: [Next](@next)
