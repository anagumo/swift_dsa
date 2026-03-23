//: [Previous](@previous)

/**
 The problem:
 Implement a node of a Singly Linked List and a function to print all elements
 
 ![Linked List](linked-list.png)
 **/

class Node<T> {
    var value: T
    var next: Node<T>?
    
    init(_ value: T) {
        self.value = value
        self.next = nil
    }
}

class LinkedList<T> {
    private var head: Node<T>?
    
    /// Inserts an element in the last position
    /// - Parameter value: The value of the element
    /// - Complexity: -> O(n) where while node.next != nil
    ///     -> O(n) linear complexity because the work is based on the size of the list
    ///     - In the worst case reads all elements in the list
    ///     - In the best case the list is empty
    func append(_ value: T) {
        let newNode = Node(value)
        
        guard let _ = head else {
            head = newNode
            return
        }
        
        var current = head
        while let _ = current?.next {
            current = current?.next
        }
        current?.next = newNode
    }
    
    /// Inserts an element in the first position
    /// - Parameter value: The value of the element
    /// - Complexity: 0(1) constant time
    func prepend(_ value: T) {
        let newNode = Node(value)
        
        guard let current = head else {
            head = newNode
            return
        }
        
        head = newNode
        newNode.next = current
    }
    
    /// Removes the first element on the list
    /// - Returns: The value of the element, or `nil` if the element is not exist
    /// - Complexity: O(1) constant time
    func removeFirst() -> T? {
        guard let current = head else {
            return nil
        }
        
        head = current.next
        return current.value
    }
    
    /// Returns the element at position n
    /// - Parameter index: The position of the element in the list
    /// - Returns: The element at position n, or `nil` if the index is not exist
    /// - Complexity: -> O(n) where while node.next != nil
    ///     -> O(n) linear complexity because the work is based on the size of the list
    ///     - In the worst case reads all elements in the list
    ///     - In the best case the first element is the n position - O(1) efective
    func node(at index: Int) -> Node<T>? {
        guard let _ = head else {
            return nil
        }
        
        var currentIndex = 0
        var currentNode = head
        
        while let node = currentNode {
            guard currentIndex != index else {
                return currentNode
            }
            currentIndex += 1
            currentNode = node.next
        }
        
        return nil
    }
    
    /// Prints all elements in the list
    func printAll() {
        var current = head
        while let node = current {
            let arrow = node.next != nil ? " -> " : " -> nil"
            print("\(node.value)\(arrow)", terminator: "")
            current = node.next
        }
    }
}

// Must works this way:
var list = LinkedList<Int>()
list.append(3)
list.append(7)
list.append(2)
list.removeFirst()
list.prepend(4)
list.printAll() // prints 4 -> 7 -> 2 -> nil
list.node(at: 1)?.value

//: [Next](@next)
