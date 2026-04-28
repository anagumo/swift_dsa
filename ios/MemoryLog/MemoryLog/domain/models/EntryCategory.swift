import SwiftData
import Foundation

/// Category enumeration that conforms Codable to persist the data as String in Swift Data
enum EntryCategory: String, Codable {
    case memory, algorithms, architecture, concurrency
}
