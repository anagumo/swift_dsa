import SwiftData
import Foundation

protocol EntryRepositoryContract {
    func insert(_ entry: Entry) throws
    func fetch(query: String?, sortType: SortType?) throws -> [Entry]
}

