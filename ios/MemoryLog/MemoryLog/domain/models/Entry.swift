import Foundation

struct Entry {
    let indentifier: UUID
    let title: String
    let content: String?
    let category: EntryCategory
    let date: Date
}
