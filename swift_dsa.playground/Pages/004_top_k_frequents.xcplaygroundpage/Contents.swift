//: [Previous](@previous)

import Foundation
import PlaygroundSupport

/**
 PROBLEM: Top K frequent songs
 
 Given an array of strings and an integer target, return the most frequent elements given the target
 
 You may assume the array has duplicated elements
 You must return the answer in order.
 
 UNDERSTAND THE PROBLEM:
 [x] Read statement (twice)
 
 [x] Work trough examples out loud
 Example 1: songs: [], target: 3
    -> []
 Example 2: songs: ["Experience", "Nuvole Bianche", "Emerald Rush", "Nuvole Bianche", "Experience", "Nuvole Bianche",  "Two Trees"], target: 3
    -> ["Nuvole Bianche": 3, "Experience": 2, "Emerald Rush": 1, "Two trees": 1]
    -> ["Nuvole Bianche", "Experience", "Emerald Rush"]
 Example 3: nums: ["Experience", "Experience"], target: 3
    -> ["Experience": 2]
    -> ["Experience"]
 
 [x] Clarify questions
 - what should I display if the input is empty?
 - what should I decided if there equal frequencies?
 - is there a range for the K paramenter? I mean (1 > K < ?), if K is 0 what should I do
 
 DESIGN THE ALGORITHM:
 [x] Naive solution sketch
 Using HaspMap + Sorting
 - Iterate the array to count frequencies
 - save the output into a dictionary where the name of the song is the key and the frequency is the value -> O(1)
 - sort the dictionary into an array of strings -> O(n log n)
 - convert to an array -> O(n)
 - get the top K ->  O(1)
 
 [x] Lower bound: 0(n) - must read all songs at least one in the worst case
 [x] Upper bound: O(n log n) - naive approach sorting all the list to get the top K
 
 [x] Triggers identified
 - HashMap + Sort
 
 EXPLAIN YOUR SOLUTION:
 [x] Plain English approach
 iterate array, create dictionary, filter list, return top k
 
 [x] Data structure choice: HashMap
 [x]Algorithm choice: ?
 
 COMPLEXITY ANALYSIS:
 [x] Time: O(n) where n = input.forEach
    - dict[key]:  O(1)
    - sorted(): O(n log n)
    - prefix(k): O(1)
    - map(): O(n)
 [x] Space: O(n)
 */

/// This a selector function that eturns the K frequent songs
/// - Parameters:
///   - songs: a value of type `([String])` that represents a list of songs
///   - k: a value of type `(Int)` that represents the number of songs to return
/// - Returns: a value of type `([String])` that represents the most top k frequent songs
/// - Complexity:Time: (n log n), Space: O(n)
func topKFrequent(_ songs: [String], _ k: Int) -> [String] {
    guard !songs.isEmpty, k > 0 else {
        return []
    }
    
    var frequencies: [String: Int] = [:]
    
    for song in songs {
        frequencies[song, default: 0] += 1
    }
    
    let topK = frequencies.sorted { $0.value > $1.value }
        .prefix(min(k, frequencies.count))
        .map { $0.key }
    
    return topK
}

/* Manual testing
topKFrequent([], 3)
topKFrequent(["Experience", "Nuvole Bianche", "Emerald Rush", "Nuvole Bianche", "Experience", "Nuvole Bianche", "Two Trees"], 3)
topKFrequent(["Experience", "Experience"], 3)
 */


/**
 VERIFY THE SOLUTION:
 [x] Top to bottom pass
 [x] Tricky expressions checked
 [x] Pass
 */

// Test cases
assert(topKFrequent([], 3) == [])
assert(topKFrequent(["Experience", "Nuvole Bianche", "Emerald Rush", "Nuvole Bianche", "Experience", "Nuvole Bianche", "Two Trees"],
                    3).count == 3)
assert(topKFrequent(["Experience", "Nuvole Bianche", "Emerald Rush", "Nuvole Bianche", "Experience", "Nuvole Bianche", "Two Trees"],
                    3).contains("Emerald Rush"))
assert(topKFrequent(["Experience", "Experience"], 3) == ["Experience"])
assert(topKFrequent(["Experience", "Experience"], 0) == [])

print("All topKFrequent tests passed (3) ✅")
PlaygroundPage.current.needsIndefiniteExecution = false
//: [Next](@next)
