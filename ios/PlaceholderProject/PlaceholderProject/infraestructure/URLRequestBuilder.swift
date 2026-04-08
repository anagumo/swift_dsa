import Foundation

final class URLRequestBuilder {
    
    private func url() throws -> URL {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "jsonplaceholder.typicode.com"
        urlComponents.path = "/photos"
        urlComponents.queryItems = [URLQueryItem(name: "_limit", value: "20")]
        
        guard let url = urlComponents.url else {
            throw URLError(.badURL)
        }
        
        return url
    }
    
    func build() throws -> URLRequest {
        do {
            var urlRequest = try URLRequest(url: url())
            urlRequest.httpMethod = "GET"
            urlRequest.allHTTPHeaderFields = [
                "Content-Type": "application/json",
                "Accept": "application/json"
            ]
            
            return urlRequest
        } catch {
            throw URLError(.badURL)
        }
    }
}
