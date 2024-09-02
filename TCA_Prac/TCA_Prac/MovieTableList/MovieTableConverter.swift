//
//  MovieTableConverter.swift
//  BoxOffice
//
//  Created by Dongmin on 9/2/24.
//

import Foundation

struct MovieTableConverter {
    
    func convertMovieEntity(_ entity: MovieEntity) -> MovieTableItemViewModel? {
        guard let id = entity.id else { return nil }
        guard let title = entity.title else { return nil }
        guard let thumb = entity.thumb else { return nil }
        guard let reservation_grade = entity.reservation_grade else { return nil }
        guard let reservation_rate = entity.reservation_rate else { return nil }
        guard let grade = entity.grade else { return nil }
        guard let user_rating = entity.user_rating else { return nil }
        guard let date = entity.date else { return nil }
        return MovieTableItemViewModel(
            id: id,
            title: title,
            thumb: thumb,
            reservation_grade: reservation_grade,
            reservation_rate: reservation_rate,
            grade: MovieTableItemViewModel.Grade(rawValue: grade),
            user_rating: user_rating,
            date: date
        )
    }
    
}
