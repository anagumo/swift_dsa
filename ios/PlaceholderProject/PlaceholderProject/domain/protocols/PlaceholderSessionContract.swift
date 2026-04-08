
protocol PlaceholderSessionContract {
    func fetchPhotos() async throws -> [PhotoDTO]
}
