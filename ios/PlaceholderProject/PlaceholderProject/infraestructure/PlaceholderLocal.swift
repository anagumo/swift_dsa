import Foundation

final class PlaceholderLocal {
    
    func getPhotos() -> [PhotoDTO] {
        guard let url = Bundle.main.url(forResource: "photos", withExtension: "json") else {
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            return try decoder.decode([PhotoDTO].self, from: data)
        } catch {
            return []
        }
    }
}
