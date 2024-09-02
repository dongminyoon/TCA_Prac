//
//  MovieEntity.swift
//  BoxOffice
//
//  Created by Dongmin on 9/2/24.
//

import Foundation

struct MovieEntity: Codable {
    let id: String?
    let grade: Int?
    let thumb: String?
    let reservation_grade: Int?
    let title: String?
    let reservation_rate: Double?
    let user_rating: Double?
    let date: String?
}
