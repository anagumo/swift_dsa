
final class GetEntriesUseCase: GetEntriesUseCaseContract {
    private let entryRepository: EntryRepositoryContract
    
    init(entryRepository: EntryRepositoryContract) {
        self.entryRepository = entryRepository
    }
    
    func run(query: String? = nil, sortType: SortType? = nil) throws -> [Entry] {
        try entryRepository.fetch(query: query, sortType: sortType)
    }
}
