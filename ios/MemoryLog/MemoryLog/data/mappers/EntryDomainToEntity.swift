struct EntryDomainToEntity {
    
    func map(entity: Entry) -> EntryEntity {
        EntryEntity(
            identifier: entity.indentifier,
            title: entity.title,
            category: entity.category,
            date: entity.date
        )
    }
}
