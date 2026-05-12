//: [Previous](@previous)

import Foundation

/**
 The problem: Best time to buy and sell stock
 You are given an integer array prices where prices[i] is the price of NeetCoin on the ith day.
 You may choose a single day to buy one NeetCoin and choose a different day in the future to sell it.
 Return the maximum profit you can achieve. You may choose to not make any transactions, in which case the profit would be 0.
 
 Understand the problem
- Read the statement twice
 
 Work out loud with examples, understand the state of the data
 1. prices = [10,1,5,6,7,1]
 -> 6
 2. prices = [10,8,7,5,2]
 -> 0
 3. prices = []
 -> 0
 
 Ask clarifying questions
 1. Input/output
 - Can prices be negative or zero, or are they always positive integers?
 - What if I received zero prices?
 - Should I return just the number of max profit?
 
 Design the algorithm
 - Trigger: max profit
 - Dsa: Array + Sliding Window
 - Pseudocode:
 1. create the following variables: minPrice and maxProfit
 2. set maxProfit to zero and minPrice to prices[0]
 3. for each price in prices
    4. if price is less than min
        5. update minPrice
    6. calculate profit equal to price - minPrice
    7 if profit is greater than maxProfit
        8. update maxProfit
    9. go to the line 3
 10. return maxProfit
 
 Algorithm complexity analysis
 Run in O(n) time with O(1) extra memory
 - Time
 -> O(n) where `for price in prices`
 -> O(n) linear time complexity  since the work is based on the input size
 In the worst case we read all prices
 - Space
 -> O(1) where `minPrice = price` and `maxProfit = profit`
 -> O(1) constant space complexity since we just update variables
 
 */

// Implement your solution in code

/// Implements an algorithm to get the max profit of a stock options
/// - Parameter prices: represents the prices to buy and sell
/// - Returns: The max profit based on the prices to buy and sell
/// - Complexity: O(n) in time with O(1) extra memory, where n is the length of the input
func maxProfit(_ prices: [Int]) -> Int {
    guard !prices.isEmpty else {
        return 0
    }
    
    var minPrice = prices[0]
    var maxProfit = 0
    
    for price in prices {
        // Evaluate if is a good day to buy
        if price < minPrice {
            minPrice = price
        }
        
        // Evaluate if is a good day to sell based on the min price
        let profit = price - minPrice
        if profit > maxProfit {
            maxProfit = profit
        }
    }
    
    return maxProfit
}

// Write some tests, the happy path and the edge cases
assert(maxProfit([10,1,5,6,7,1]) == 6, "Test 1 failed")
assert(maxProfit([7,1,5,3,6,4]) == 5, "Test 2 failed")
assert(maxProfit([10,8,7,5,2]) == 0, "Test 3 failed")
assert(maxProfit([]) == 0, "Test 4 failed")
print("All tests passed, ready to launch 🚀")

//: [Next](@next)
