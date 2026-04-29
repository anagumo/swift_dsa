
protocol AddEntryUseCaseContract {
    /// Executes bussines logic, if builds the domain model too breaks the Single Responsability principle
    /// - Parameter entry: represents the raw input collected from the user
    /// - Throws: EntryError if ocurres an error inserting the entry in the BBDD
    func run(_ entry: Entry) throws
}

final class AddEntryUseCase: AddEntryUseCaseContract {
    private let entryRepository: EntryRepository
    
    init(entryRepository: EntryRepository) {
        self.entryRepository = entryRepository
    }
    
    func run(_ entry: Entry) throws {
        try entryRepository.insert(entry)
    }
}
