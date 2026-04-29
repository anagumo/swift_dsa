import SwiftData
import Foundation

final class EntryRepository: EntryRepositoryContract {
    private let modelContainer: ModelContainer
    private lazy var modelContext: ModelContext = {
        let context = ModelContext(modelContainer)
        context.autosaveEnabled = true
        return context
    }()
    
    init(persistenceType: PersistenceType = .disk) {
        let modelConfiguration: ModelConfiguration?
        // Add type persistence for testing
        if persistenceType == .disk {
            let urlBBDD = URL.applicationSupportDirectory.appending(component: "MemoryLog.sqlite")
            modelConfiguration = ModelConfiguration(url: urlBBDD)
        } else {
            modelConfiguration = ModelConfiguration(isStoredInMemoryOnly: true)
        }
        
        do {
            if let modelConfiguration {
                modelContainer = try ModelContainer(
                    for: EntryEntity.self,
                    configurations: modelConfiguration
                )
            } else {
                debugPrint("Unexpected error creating the model container")
                throw SwiftDataError.loadIssueModelContainer
            }
        } catch {
            debugPrint("Swift Data couln not load BBDD")
            fatalError("Swift Data could not load BBDD: \(error)")
        }
    }
    
    private func saveContext() throws {
        guard modelContext.hasChanges else {
            debugPrint("There is no changes to apply in BBDD")
            return
        }
        
        do {
            try modelContext.save()
        } catch {
            debugPrint("Unexpected error saving BBDD context: \(error)")
            throw EntryError.saveFailed
        }
    }
    
    func insert(_ entry: Entry) throws {
        do {
            modelContext.insert(
                EntryDomainToEntity().map(entity: entry)
            )
            try saveContext()
        } catch {
            debugPrint("Unexpected error inserting an entry in BBDD: \(error)")
            throw EntryError.insertFailed
        }
    }
    
    func fetch(query: String?, sortType: SortType?) throws -> [Entry] {
        var descriptor = FetchDescriptor<EntryEntity>()
        
        // Filter entries by title
        if let query {
            descriptor.predicate = #Predicate { $0.title == query }
        }
        
        // Sort entries by category or date
        switch sortType {
        case .category:
            descriptor = FetchDescriptor<EntryEntity>(
                sortBy: [SortDescriptor(\.category.rawValue, comparator: .lexical)]
            )
        case .date:
            descriptor = FetchDescriptor<EntryEntity>(
                sortBy: [SortDescriptor(\.date, order: .reverse)]
            )
        case .none: break
        }
        
        do {
            let entityList = try modelContext.fetch(descriptor)
            let domainList = entityList.map { entity in
                EntryEntityToDomain().map(entity)
            }
            
            return domainList
        } catch {
            debugPrint("Entry entities not found in BBDD")
            throw EntryError.fetchFailed
        }
    }
}
