import Foundation

struct PhotoDTO: Decodable {
    let id: Int
    let title: String
    let thumbnailUrl: String
    let date: Date?
}
