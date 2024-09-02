//
//  MovieTableItemView.swift
//  BoxOffice
//
//  Created by Dongmin on 8/26/24.
//

import SwiftUI

struct MovieTableItemView: View {
    
    let movie: MovieTableItemViewModel
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: self.movie.thumb), content: { image in
                image.resizable()
            }, placeholder: {
                ProgressView()
            })
            .frame(width: 100, height: 150)
            
            MovieDescriptionView(
                title: self.movie.title,
                rating: self.movie.user_rating,
                rank: self.movie.reservation_grade,
                grade: self.movie.grade ?? .allAges,
                reservationRating: self.movie.reservation_rate,
                date: self.movie.date
            )
        }
        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
    }
    
}

private struct MovieDescriptionView: View {
    
    let title: String
    let rating: Double
    let rank: Int
    let grade: MovieTableItemViewModel.Grade
    let reservationRating: Double
    let date: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text(self.title)
                    .font(.title)
                self.grade.image
                    .aspectRatio(contentMode: .fit)
            }
            Text("평점 : \(self.rating) 예매순위 : \(self.rank) 예매율 : \(self.reservationRating)")
                .font(.subheadline)
            Text("개봉일 : \(self.date)")
                .font(.caption)
        }
    }
    
}

struct MovieItemViewPreviews: PreviewProvider {
    
    static var previews: some View {
        MovieTableItemView(
            movie: MovieTableItemViewModel(
                id: "awd",
                title: "신과 함께",
                thumb: "ㅁㅈㅇ",
                reservation_grade: 2,
                reservation_rate: 1,
                grade: .allAges,
                user_rating: 1,
                date: "2020-12-20"
            )
        )
        .previewLayout(.sizeThatFits)
    }
    
}
