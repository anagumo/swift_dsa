//: [Previous](@previous)

import Foundation

/**
 
 The problem: Implement Queue using Stacks
 Implement a first in frist out (FIFO) Queue using only two Stacks. The implemented queue should support al the functions
 of a normal queue: `queue (push)`, `peek`, `dequeue (pop)` and `empty`.
 
 Implement `MyQueue` class:
 `push` pushes the element n to the back of the queue
 `pop` removes the element form the front of the queue and returns it
 `peek` returns rhe element at the front of the queue
 `empty` returns true if the queue is empty, false otherwise
 
 Constraints:
 - 1 <= x <= 9
 - At most 100 calls will be made to push, pop, peek, and empty.
 - All the calls to pop and peek are valid.
 
 Notes:
 You must use only standard operations of a stack, which means only push to top, pop to dequeue, peek, size and is empty operations are valid.
 Depending on your language, the stack may not be supported natively. You may simulate a stack using a list or deque (double-ended queue) as long as you use only a stack's standard operations.
 
 Work out with examples out loud. Understan the data.
 1. `[]`
 -> push 1: `[1]`
 -> push 2: `[1, 2]`
 -> peek: `1`
 -> pop: `1`
 -> empty: `false`
 
 Define clarifying questions:
 - Input/Output
 1. To dequeue should I reverse the stack using reverse linked list?
 - Constrains
 2. Should I validate that x is between 1 and 9?
 3. Should be thread safety?
 - Trade-offs
 4. Should I priorize velocity over memory?
 
 Sketch solution
 - Dsa selected: Stack
 - Trigger: Queue/Stack
 - Pseudocode:
 
 Algorithm complexity analyisis
 */

//: [Next](@next)
