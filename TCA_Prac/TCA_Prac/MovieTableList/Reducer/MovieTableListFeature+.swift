//
//  MovieTableListFeature+.swift
//  BoxOffice
//
//  Created by Dongmin on 9/2/24.
//

import Foundation

extension MovieTableListFeature {
    
    static var stateMock: State {
        return State(
            movies: [
                MovieTableItemViewModel(
                    id: UUID().uuidString,
                    title: "신과함께 - 죄와벌",
                    thumb: "awd",
                    reservation_grade: 1,
                    reservation_rate: 35.5,
                    grade: .ages12,
                    user_rating: 7.98,
                    date: "2011-09-11"
                ),
                MovieTableItemViewModel(
                    id: UUID().uuidString,
                    title: "저스티스 리그",
                    thumb: "awd",
                    reservation_grade: 2,
                    reservation_rate: 12.63,
                    grade: .ages15,
                    user_rating: 7.98,
                    date: "2011-09-11"
                ),
                MovieTableItemViewModel(
                    id: UUID().uuidString,
                    title: "토르 라그나로크",
                    thumb: "awd",
                    reservation_grade: 3,
                    reservation_rate: 6.73,
                    grade: .ages15,
                    user_rating: 9.8,
                    date: "2011-09-11"
                ),
                MovieTableItemViewModel(
                    id: UUID().uuidString,
                    title: "러빙 빈센트",
                    thumb: "awd",
                    reservation_grade: 4,
                    reservation_rate: 8.5,
                    grade: .ages19,
                    user_rating: 3.82,
                    date: "2011-09-11"
                )
            ]
        )
    }
    
}
