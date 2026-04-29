
/// Creates a domain error, the Domain layer shouldn't know about SwiftData errors
enum EntryError: Error {
    case insertFailed, fetchFailed, saveFailed
}
