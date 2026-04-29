
protocol GetEntriesUseCaseContract {
    /// Get filtered and sorted entries from the local storage
    /// - Parameters:
    ///   - query: Represents the predicate to filter the data
    ///   - sortType: Represents how sort the data
    /// - Returns: A list of sorted entries, all otherwise
    /// - Throws: `EntryError.fetchFailed` if fetch fails
    func run(query: String?, sortType: SortType?) throws -> [Entry]
}

extension GetEntriesUseCaseContract {
    func run(query: String? = nil, sortType: SortType? = nil) throws -> [Entry] {
        try run(query: query, sortType: sortType)
    }
}
