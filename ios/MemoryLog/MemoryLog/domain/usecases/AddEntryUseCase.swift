
final class AddEntryUseCase: AddEntryUseCaseContract {
    private let entryRepository: EntryRepositoryContract
    
    init(entryRepository: EntryRepositoryContract) {
        self.entryRepository = entryRepository
    }
    
    func run(_ entry: Entry) throws {
        try entryRepository.insert(entry)
    }
}
