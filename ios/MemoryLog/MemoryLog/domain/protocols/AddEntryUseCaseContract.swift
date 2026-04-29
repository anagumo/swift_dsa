
protocol AddEntryUseCaseContract {
    /// Persists a new entry to the local storage
    /// Executes bussines logic, if builds the domain model too breaks the Single Responsability principle
    /// - Parameter entry: represents the domain model to persists
    /// - Throws: `EntryError.savedFailed` if persistence fails
    func run(_ entry: Entry) throws
}
