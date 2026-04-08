import Foundation

struct PhotoDTOToDomainMapper {
    func map(_ dto: PhotoDTO) -> Photo {
        Photo(
            id: dto.id,
            title: dto.title,
            url: dto.thumbnailUrl,
            date: dto.date ?? Date()
        )
    }
}
