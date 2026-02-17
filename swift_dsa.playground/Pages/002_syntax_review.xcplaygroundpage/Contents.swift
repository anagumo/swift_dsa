//: [Previous](@previous)

import Foundation
import PlaygroundSupport

// MARK: - Greater than
///
/// A selector function that receives an optional list of integer numbers and filters the grater than a target
///
/// - Parameters:
///     - number: a value of type `(Int)` that represents the target
///     - numbers: a value of type`([Int]?)` that represents the lists of optionals integers
///- Returns: a value of type `([Int])` that represents the list filtered
///
///## Example
///```swift
//////Example 1
//////Input: number = 10, numbers = [5, 15, 8, 20]
///greaterThan(10, numbers: [5, 15, 8, 20])
//////Output: [15, 20]
///
//////Example 2
//////Input: number = 10, numbers = [1, 2, 1, 2]
///greaterThan(10, numbers: [1, 2, 1, 2])
//////Output: []
///
//////Example 3
//////Input: number = 10, numbers = nil
///greaterThan(3, numbers: [])
//////Output: []
///```
func greaterThan(_ number: Int, numbers: [Int]?) -> [Int] {
    guard let numbers, !numbers.isEmpty else { return [] }
    return numbers.filter { $0 > number }
}

// Test cases
assert(greaterThan(10, numbers: [5, 15, 8, 20]) == [15, 20], "Expected [15, 20] in 32/greaterThan")
assert(greaterThan(10, numbers: [1, 2, 1, 2]) == [], "Expected [] in 32/greaterThan")
assert(greaterThan(10, numbers: nil) == [], "Expected nil in 32/greaterThan")

// MARK: - Sum All
/// Calcula la suma de todos los elementos en un array de números enteros
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a sumar
///
/// - Returns: Un entero (`Int`) que representa la suma de todos los elementos del array.
/// Si el array está vacío, retorna 0 ya que es el elemento neutro de la suma.
///
/// # Implementación
/// Utiliza un bucle for para iterar sobre cada elemento y mantiene un acumulador
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [1, 2, 3, 4, 5]
/// let result = sumAll(sequence: numbers)
/// print(result) // Output: 15
///
/// let empty = [Int]()
/// let resultEmpty = sumAll(sequence: empty)
/// print(resultEmpty) // Output: 0
/// ```
func sumAll(_ sequence: [Int]) -> Int {
    var acum = 0
    
    for num in sequence {
        acum += num
    }
    
    return acum
}

// Test Cases
assert(sumAll([1,2,3,4,5]) == 15, "Expected 15 in 63/sumAll")
assert(sumAll([]) == 0, "Expected 0 in 63/sumAll")

// MARK: - Multiply All
/// Calcula el producto de todos los elementos en un array de números enteros
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a multiplicar
///
/// - Returns: Un entero (`Int`) que representa el producto de todos los elementos del array.
/// Si el array está vacío, retorna 1 ya que es el elemento neutro de la multiplicación.
///
/// # Implementación
/// Utiliza un bucle for para iterar sobre cada elemento y mantiene un acumulador del producto
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [2, 3, 4]
/// let result = multiplyAll(sequence: numbers)
/// print(result) // Output: 24
///
/// let empty = [Int]()
/// let resultEmpty = multiplyAll(sequence: empty)
/// print(resultEmpty) // Output: 1
/// ```
func multiplyAll(_ sequence: [Int]) -> Int {
    var acum = 1
    
    for num in sequence {
        acum *= num
    }
    
    return acum
}

// Test Cases
assert(multiplyAll([2,3,4]) == 24, "Expected 24 in 98/multipllyAll")
assert(multiplyAll([]) == 1, "Expected 1 in 98/multipllyAll")

// MARK: - compress
/// Reduce un array de enteros a un único valor mediante una operación de combinación especificada como último parámetro
///
/// - Parameters:
///   - sequence: Un array de enteros (`[Int]`) que se desea comprimir
///   - initialValue: El valor inicial (`Int`) que se usará como punto de partida para la combinación
///   - combinationOperation: Una función del tipo `IntCombiner` que define cómo combinar dos enteros.
///     Esta función toma dos parámetros enteros y devuelve un entero como resultado
///
/// - Returns: Un entero (`Int`) que representa el resultado de aplicar secuencialmente
///   la operación de combinación a todos los elementos del array
///
/// # Implementación
/// La función utiliza un acumulador que comienza con el valor inicial y aplica
/// la operación de combinación con cada elemento del array secuencialmente
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [1, 2, 3, 4]
///
/// // Ejemplo de suma
/// let sum = compress(sequence: numbers,
///                   initialValue: 0,
///                   combinationOperation: { $0 + $1 })
/// print(sum) // Output: 10
///
/// // Ejemplo de multiplicación
/// let product = compress(sequence: numbers,
///                       initialValue: 1,
///                       combinationOperation: { $0 * $1 })
/// print(product) // Output: 24
///
/// // Ejemplo con función nombrada
/// func max(_ a: Int, _ b: Int) -> Int { return a > b ? a : b }
/// let maximum = compress(sequence: numbers,
///                       initialValue: Int.min,
///                       combinationOperation: max)
/// print(maximum) // Output: 4
/// ```
typealias IntCombiner = (Int, Int) -> Int

func compress(_ sequence: [Int], initialValue: Int, combinationOperator: IntCombiner) -> Int {
    var acum = initialValue
    
    for number in sequence {
        acum = combinationOperator(acum, number)
    }
    
    return acum
}

// Test cases
// Another combinator function to test a case
func max(_ a: Int, _ b: Int) -> Int { return a > b ? a : b }
assert(compress([1, 2, 3, 4], initialValue: 0, combinationOperator: { $0 + $1 }) == 10, "Expected 10 in 153/compress")
assert(compress([1, 2, 3, 4], initialValue: 1, combinationOperator: { $0 * $1 }) == 24, "Expected 24 in 153/compress")
assert(compress([1, 2, 3, 4], initialValue: Int.min, combinationOperator: max) == 4, "Expected 4 in 153/compress")

// MARK: Sum with compress
/// Calcula la suma de todos los elementos en un array de enteros utilizando la función `compress`
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a sumar
///
/// - Returns: Un entero (`Int`) que representa la suma de todos los elementos del array.
/// Si el array está vacío, retorna 0 (el valor inicial)
///
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [1, 2, 3, 4, 5]
/// let result = sumWithCompress(sequence: numbers)
/// print(result) // Output: 15
///
/// let empty = [Int]()
/// let resultEmpty = sumWithCompress(sequence: empty)
/// print(resultEmpty) // Output: 0
/// ```
func sumWithCompress(_ sequence: [Int]) -> Int {
    compress(sequence,
             initialValue: 0,
             combinationOperator: { $0 + $1 }
    )
}

// Test cases
assert(sumWithCompress([1, 2, 3, 4, 5]) == 15, "Expected 15 in 189/sumWithCompress")
assert(sumWithCompress([]) == 0, "Expected 0 in 189/sumWithCompress")

print("All syntax_review tests passed (12) ✅")
PlaygroundPage.current.needsIndefiniteExecution = false

//: [Next](@next)
