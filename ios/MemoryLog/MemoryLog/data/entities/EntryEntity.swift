import SwiftData
import Foundation

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
