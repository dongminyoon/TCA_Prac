//
//  NetworkProvider.swift
//  BoxOffice
//
//  Created by Dongmin on 9/2/24.
//

import Foundation

final class NetworkProvider {
    
    let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request<E: Endpointable>(endPoint: E) async -> Result<E.Response, NetworkError> {
        do {
            let urlRequest = endPoint.makeURLRequest()
            let (data, response) = try await self.session.data(for: urlRequest)
            
            guard let httpResponse = response as? HTTPURLResponse else { return .failure(.unknown) }
            guard httpResponse.statusCode == 200 else { return .failure(.invalidStatusCode) }
            
            guard let decoded = try? JSONDecoder().decode(E.Response.self, from: data) else { return .failure(.mappingObject) }
            return .success(decoded)
        } catch {
            return .failure(.underlying(error))
        }
    }
        
}
