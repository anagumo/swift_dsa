/**
 The problem: Valid anagram
 Given two strings s and t, return true if t is an anagram of s, and false otherwise.
 
 Constraints:
 - `1 <= s.length, t.length <= 5 * 10^4`
 - `s` and `t` consist of lowercases English letter
 
 Understand the problem
 - Read the statement twice
 
 Workout with examples out loud, understad the state of the data
 1. s = "anagram", t = "nagaram"
 -> true
 2. s = "rat", t = "car"
 -> false
 3. s = "car", t = "cartoon"
 -> false
 4. s = "", t = ""
 -> false
 
 Clarifying questions
 - Input / Output
 1. If the words has the same letters but diffrent lengths, should be false?
 2. If the input for both strings is empty, should I return true?
 - Constraints
 3. Is it thread safe?
 - Trade-offs
 4. Should I give priority to velocity or memory?
 
 Design the algorithm
 - Trigger: give two strings
 - Options:
 1. Force brute with an Array
 |_ O(n^2) where forEach element in array1, forEach element in array2
 |_ O(1) where element1 == element2
 |_ O(n^2) quadratic algorithm complexity
 2. Dictionary to count frequencies
 |_ O(n) where forEach element in dict1
 |_ O(1) where dict2 contains key(element)
 |_ O(n) linear algorithm complexity
 
 Dsa selected: Dictionary
 I could do it with an array that give me O(1) in space but at the cost of an O(n^2) in time,
 so I selected a Dictionary because memory is an acceptable trade-off here if we win linear time.
 
 Sketch your solution
 1. I convert both strings in arrays
 2. I iterate both to count frequencies
 3. I iterate dict1 to validate if the dict2 contains the key
 4. If the key and value is not the same in dict2
 5. Return `false`
 
 Algorithm complexity analisis/
 Time:
 -> O(n) where `s.lowercased().filter { $0.isLetter }`
 -> O(n) where `t.lowercased().filter { $0.isLetter }`
 -> O(n) where `for letter in sCleaned`
 -> O(n) where `for letter in tCleaned`
 -> O(n) where `for (sKey, sValue) in sFrequencies`
 -> O(1) where `let tvalue = tFrequencies[sKey], tvalue == sValue`
 -> O(n) linear algorithm complexity
 - In the best case we need to read all elements in the dictionary
 - In the best case we get an invalid anagram in the first character of the strings
 Space:
 -> O(n) where `sFrequencies[letter, default: 0] += 1`
 -> O(n) where `tFrequencies[letter, default: 0] += 1`
 -> O(n) linear algorithm complexity
 */

// Implement the solution in code

/// Implement Valid Anagram
/// Given two strings s and t, return true if t is an anagram of s, and false otherwise.
///
///Constraints:
/// - `1 <= s.length, t.length <= 5 * 10^4`
/// - `s` and `t` consist of lowercases English letter
///
///Assumptions:
///- If both strings are empty, return true
///
/// - Parameters:
///   - s: represents the first string to compare
///   - t: represents the second string to compare
/// - Returns: `true` if both strings are a valid anagram, otherwise `false`
/// - Complexity: O(n) linear algorithm complexity, where n is the length of the collection
func validAnagram(s: String, t: String) -> Bool {
    // Validate if strings has the same length, otherwise is an invalid anagram
    guard s.count == t.count else {
        return false
    }
    
    // Clean the strings to work with lowercases -> O(n)
    let sCleaned = s.lowercased().filter { $0.isLetter }
    let tCleaned = t.lowercased().filter { $0.isLetter } // Fixed: I wrote s again
    
    //var sFrequencies = [Character: Int]()
    //var tFrequencies = [Character: Int]()
    var anagramFrequencies = [Character: Int]()
    
    // Count frequencies -> O(n)
    for letter in sCleaned {
        anagramFrequencies[letter, default: 0] += 1
    }
    
    // Count frequencies -> O(n)
    for letter in tCleaned {
        anagramFrequencies[letter, default: 0] -= 1
    }
 
    // Give me an O(n) in the worst case because it could read all elements in the list
    // but in the best case the string is an invalid anagram in the first character
    //vs return tCleaned.contains(sCleaned) // O(n) always
    /*for (sKey, sValue) in sFrequencies {
        guard
            let tvalue = tFrequencies[sKey], tvalue == sValue else {
            return false
        }
    }*/
    
    return anagramFrequencies.allSatisfy { $0.value == 0 }
}

/**
 Make a sistematic debugging, understand the state of my data
 
 Takes notes if needed:
 - Swift idiomatic pattern:
 1. `sFrequencies[letter, default: 0] += 1`
 2. `anagramFrequencies.allSatisfy { $0.value == 0 }`
 */


// Write some tests: the happy path and edge cases
assert(validAnagram(s: "anagram", t: "nagaram"))
assert(!validAnagram(s: "rat", t: "car"))
assert(!validAnagram(s: "car", t: "cartoon"))
assert(!validAnagram(s: "", t: "cartoon"))
assert(validAnagram(s: "", t: ""))
print("✅ All tests passed!")
