
protocol GetEntriesUseCaseContract {
    /// Executes a one bussines action to get sorted entries
    /// - Parameter sortType: Represents how sort the data
    /// - Returns: A list of sorted entries, all otherwise
    /// - Throws: `EntryError` if ocurres an error fetching entries from the BBDD
    func run(sortType: SortType) throws -> [Entry]
}

final class GetEntriesUseCase: GetEntriesUseCaseContract {
    private let entryRepository: EntryRepositoryContract
    
    init(entryRepository: EntryRepositoryContract) {
        self.entryRepository = entryRepository
    }
    
    func run(sortType: SortType) throws -> [Entry] {
        try entryRepository.fetch(sortType: .none)
    }
}
