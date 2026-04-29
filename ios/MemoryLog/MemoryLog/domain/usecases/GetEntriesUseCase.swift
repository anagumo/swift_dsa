
protocol GetEntriesUseCaseContract {
    /// Executes a one bussines action to get sorted entries
    /// - Parameters:
    ///   - query: Represents how filter the data
    ///   - sortType: Represents how sort the data
    /// - Returns: A list of sorted entries, all otherwise
    /// - Throws: `EntryError` if ocurres an error fetching entries from the BBDD
    func run(query: String?, sortType: SortType?) throws -> [Entry]
}

final class GetEntriesUseCase: GetEntriesUseCaseContract {
    private let entryRepository: EntryRepositoryContract
    
    init(entryRepository: EntryRepositoryContract) {
        self.entryRepository = entryRepository
    }
    
    func run(query: String?, sortType: SortType?) throws -> [Entry] {
        try entryRepository.fetch(query: query, sortType: sortType)
    }
}
