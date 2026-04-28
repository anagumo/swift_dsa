import SwiftData
import Foundation

/// Category enumeration that conforms Codable to persist the data as String in Swift Data
enum EntryCategory: String, Codable {
    case memory, algorithms, architecture, concurrency
}

@Model
class EntryEntity {
    @Attribute(.unique)
    var identifier: UUID
    var title: String
    var content: String?
    var category: EntryCategory
    var date: Date
    
    init(identifier: UUID,
         title: String,
         content: String? = nil,
         category: EntryCategory,
         date: Date) {
        self.identifier = identifier
        self.title = title
        self.content = content
        self.category = category
        self.date = date
    }
}
