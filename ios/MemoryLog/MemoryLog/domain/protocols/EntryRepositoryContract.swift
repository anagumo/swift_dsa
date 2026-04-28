import SwiftData
import Foundation

protocol EntryRepositoryContract {
    func insert(_ entry: Entry) throws
    func fetchAll(sortType: SortType) throws -> [Entry]
}

extension EntryRepositoryContract {
    func fetchAll(sortType: SortType = .none) {}
}
