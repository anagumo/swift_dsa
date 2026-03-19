//: [Previous](@previous)

// Implement a node of a Singly Linked List
// and a function to print all elements

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
list.append(1)
list.append(2)
list.append(3)
list.printAll() // prints 1 -> 2 -> 3 -> nil

//: [Next](@next)
