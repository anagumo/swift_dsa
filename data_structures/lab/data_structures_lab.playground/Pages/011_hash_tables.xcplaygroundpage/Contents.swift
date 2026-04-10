//: [Previous](@previous)

// ¿Cuál es el Big O real de esta función en Swift?
// Analiza cada línea

func mostFrequent(_ arr: [String]) -> String? {
    var counts: [String: Int] = [:]

    for word in arr {                     // O(n)
        counts[word, default: 0] += 1     // O(1)
    }

    return counts.max(by: {               // O(n)
        $0.value < $1.value
    })?.key
}

mostFrequent(["apple", "milk", "apple"])
//: [Next](@next)
