//
//  MovieCollectionListView.swift
//  BoxOffice
//
//  Created by Dongmin on 8/26/24.
//

import ComposableArchitecture
import SwiftUI

struct MovieCollectionListView: View {
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVGrid(
                    columns: [
                        GridItem(.fixed(geometry.size.width / 2)),
                        GridItem(.fixed(geometry.size.width / 2))
                    ],
                    content: {
                        Text("Placeholder")
                            .frame(width: geometry.size.width / 2, height: 100)
                            .background(Color.red)
                        Text("Placeholder")
                            .frame(width: geometry.size.width / 2, height: 100)
                            .background(Color.red)
                    }
                )
            }
        }
    }
}

#Preview {
    MovieCollectionListView()
}
