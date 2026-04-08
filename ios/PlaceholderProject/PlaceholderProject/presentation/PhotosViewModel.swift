import Foundation

@Observable
final class PhotosViewModel: PhotosViewModelContract {
    @ObservationIgnored
    private let placeholderSessionContract: PlaceholderSessionContract
    private let placeholderLocal: PlaceholderLocal
    var photosState: PhotosState
    var photos: [Photo]
    
    init(placeholderSessionContract: PlaceholderSessionContract,
         placeholderLocal: PlaceholderLocal) {
        self.placeholderSessionContract = placeholderSessionContract
        self.placeholderLocal = placeholderLocal
        photosState = .loading
        photos = []
    }
    
    func load() {
        photosState = .loading
        
        /*Task { @MainActor in
            do {
                let photosDTO = try await placeholderSessionContract.fetchPhotos()
                let photos = photosDTO.map { PhotoDTOToDomainMapper().map($0) }
                self.photos = photos
                photosState = .loaded
            } catch {
                photosState = .error
            }
        }*/
        
        let photosDTO = placeholderLocal.getPhotos()
        let photos = photosDTO
            .map { PhotoDTOToDomainMapper().map($0) }
            .sorted { $0.date > $1.date }
        self.photos = photos
        photosState = .loaded
    }
}
