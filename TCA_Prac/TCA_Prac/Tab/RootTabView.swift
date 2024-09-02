//
//  RootTabView.swift
//  BoxOffice
//
//  Created by Dongmin on 9/2/24.
//

import ComposableArchitecture
import SwiftUI

struct RootTabView: View {
    
    var body: some View {
        TabView {
            MovieTableListView(store: .initial)
                .tabItem {
                    Image(systemName: "table")
                    Text("Table")
                }
            
            MovieCollectionListView()
                .tabItem {
                    Image(systemName: "table")
                    Text("Collection")
                }
        }
    }
    
}

#Preview {
    RootTabView()
}
