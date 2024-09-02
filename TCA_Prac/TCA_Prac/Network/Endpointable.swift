//
//  Endpointable.swift
//  BoxOffice
//
//  Created by Dongmin on 9/2/24.
//

import Foundation

enum HTTPMethod: String {
    case GET = "GET"
    case POST = "POST"
}

protocol Endpointable<Response> {
    associatedtype Response: Decodable
    
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var queryParameters: [String: Any]? { get }
    var bodyParameters: [String: Any]? { get }
    
    func makeURLRequest(cachePolicy: URLRequest.CachePolicy) -> URLRequest
}

extension Endpointable {
    
    func makeURLRequest(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> URLRequest {
        let url = self.baseURL
            .appending(path: self.path)
            .appending(queryItems: self.queryItems)
        var urlRequest = URLRequest(url: url, cachePolicy: cachePolicy)
        urlRequest.httpMethod = self.method.rawValue
        self.headers?.forEach { urlRequest.setValue($0.value, forHTTPHeaderField: $0.key) }
        if let bodyParameters = self.bodyParameters, JSONSerialization.isValidJSONObject(bodyParameters),
           let data = try? JSONSerialization.data(withJSONObject: bodyParameters) {
            urlRequest.httpBody = data
        }
        return urlRequest
    }
    
    private var queryItems: [URLQueryItem] {
        guard let queryParameters = self.queryParameters else { return [] }
        return queryParameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
    }
    
}
