//: [Previous](@previous)

import Foundation

class Record {
    var song: Song?
    
    deinit {
        print("Record deallocated")
    }
}

class Song {
    //var record: Record? // retain cycle
    weak var record: Record?
    
    deinit {
        print("Song deallocated")
    }
}

let start = Date()
var record: Record? = Record()
var song: Song? = Song()

record?.song = song
song?.record = record

record = nil
song = nil

let elapsed = Date().timeIntervalSince(start)
print(elapsed)

//: [Next](@next)
