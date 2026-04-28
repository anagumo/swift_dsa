struct EntryEntityToDomain {
    
    func map(_ entity: EntryEntity) -> Entry {
        Entry(
            indentifier: entity.identifier,
            title: entity.title,
            content: entity.content,
            category: entity.category,
            date: entity.date
        )
    }
}
