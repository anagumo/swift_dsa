import SwiftData
import Foundation

protocol EntryRepositoryContract {
    func insert(_ entry: Entry) throws
    func fetch(sortType: SortType) throws -> [Entry]
}

extension EntryRepositoryContract {
    func fetch(sortType: SortType = .none) {}
}
