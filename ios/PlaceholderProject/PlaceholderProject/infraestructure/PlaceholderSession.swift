import Foundation

final class PlaceholderSession: PlaceholderSessionContract {
    private let urlSession: URLSession

    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }

    func fetchPhotos() async throws -> [PhotoDTO] {
        // Builder pattern
        let urlRequest = try URLRequestBuilder().build()

        let (data, response) = try await urlSession.data(for: urlRequest)
        let statusCode = (response as? HTTPURLResponse)?.statusCode

        guard let statusCode else {
            throw URLError(.badServerResponse)
        }

        switch statusCode {
        case 200..<300:
            do {
                return try JSONDecoder().decode([PhotoDTO].self, from: data)
            } catch {
                throw URLError(.cannotDecodeContentData)
            }
        default:
            throw URLError(.badServerResponse)
        }
    }
}


