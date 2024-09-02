//
//  NetworkError.swift
//  BoxOffice
//
//  Created by Dongmin on 9/2/24.
//

import Foundation

enum NetworkError: Error {
    case underlying(Swift.Error)
    case invalidData
    case invalidStatusCode
    case mappingObject
    case unknown
}
