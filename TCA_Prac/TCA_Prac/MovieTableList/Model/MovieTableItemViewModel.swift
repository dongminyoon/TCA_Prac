//
//  MovieTableItemViewModel.swift
//  BoxOffice
//
//  Created by Dongmin on 9/2/24.
//

import SwiftUI
import Foundation

struct MovieTableItemViewModel: Hashable, Identifiable {
    var id: String
    var title: String
    var thumb: String
    var reservation_grade: Int // 예매순위
    var reservation_rate: Double // 예매율
    var grade: Grade? // 관람등급
    var user_rating: Double // 사용자 평점
    var date: String // 개봉일
    
    enum Grade: Int {
        case allAges = 0
        case ages12 = 12
        case ages15 = 15
        case ages19 = 19
        
        var image: Image {
            switch self {
            case .allAges: return  Image("ic_allages", bundle: .main)
            case .ages12: return Image("ic_12", bundle: .main)
            case .ages15: return Image("ic_15", bundle: .main)
            case .ages19: return Image("ic_19", bundle: .main)
            }
        }
    }
}
