//
//  MovieCollectionItemView.swift
//  BoxOffice
//
//  Created by Dongmin on 9/3/24.
//

import SwiftUI

struct MovieCollectionItemView: View {
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack {
                    Image("ic_15")
                        .frame(width: geometry.size.width, height: geometry.size.width * 1.2)
                    Image("ic_19")
                        .offset(x: (geometry.size.width / 2) - 10, y: -(geometry.size.width * 1.2) / 2 + 12)
                }
                Text("신과함께 - 죄와벌")
                    .font(.largeTitle)
                (Text("1위(7.98)") + Text(" / ") + Text("35.5%"))
                    .font(.subheadline)
                Text("2017-12-20")
                    .font(.subheadline)
            }
        }
    }
    
}

struct MovieCollectionItemPreviews: PreviewProvider {
    
    static var previews: some View {
        MovieCollectionItemView()
            .previewLayout(.sizeThatFits)
    }
    
}
