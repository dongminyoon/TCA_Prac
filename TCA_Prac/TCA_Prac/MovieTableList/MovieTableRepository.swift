//
//  MovieTableRepository.swift
//  BoxOffice
//
//  Created by Dongmin on 9/2/24.
//

import Foundation

struct MovieTableRepository {
    
    init(
        converter: MovieTableConverter = MovieTableConverter(),
        provider: NetworkProvider = NetworkProvider()
    ) {
        self.converter = converter
        self.provider = provider
    }
    
    func requestMovies(order_type: Int = 0) async -> [MovieTableItemViewModel] {
        let endPoint = MoviesAPI(order_type: order_type)
        let result = await self.provider.request(endPoint: endPoint)
        
        switch result {
        case .success(let response):
            return (response.movies ?? []).compactMap { self.converter.convertMovieEntity($0) }
            
        case .failure(let error):
            return []
        }
    }
    
    private let converter: MovieTableConverter
    private let provider: NetworkProvider
    
}
