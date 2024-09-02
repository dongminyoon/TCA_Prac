//
//  MoviesAPI.swift
//  BoxOffice
//
//  Created by Dongmin on 9/2/24.
//

import Foundation

struct MoviesAPI: Endpointable {
    
    struct Response: Decodable {
        let movies: [MovieEntity]?
    }
    
    let baseURL: URL = URL(string: "https://connect-boxoffice.run.goorm.io")!
    let path: String = "/movies"
    let method: HTTPMethod = .GET
    let headers: [String : String]? = nil
    let bodyParameters: [String : Any]? = nil
    let queryParameters: [String : Any]?
    
    init(order_type: Int = 0) {
        self.queryParameters = ["order_type": order_type]
    }
    
}
