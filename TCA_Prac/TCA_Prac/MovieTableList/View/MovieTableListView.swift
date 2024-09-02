//
//  MovieTableListView.swift
//  BoxOffice
//
//  Created by Dongmin on 8/26/24.
//

import ComposableArchitecture
import SwiftUI

struct MovieTableListView: View {
    
    let store: StoreOf<MovieTableListFeature>
    @ObservedObject var viewStore: ViewStoreOf<MovieTableListFeature>
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(self.viewStore.movies) { movie in
                    MovieTableItemView(movie: movie)
                        .onTapGesture { self.viewStore.send(.didTapMovie) }
                }
            }
            .listStyle(.grouped)
            .navigationTitle("예매율순")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                Button(
                    action: { self.viewStore.send(.didTapMore) },
                    label: { Image(systemName: "pencil.circle") }
                )
                .tint(.black)
            }
        }
        .onAppear {
            self.store.send(.onAppear)
        }
        .confirmationDialog(store: self.store.scope(state: \.$confirmationDialog, action: \.confimationDialog))
    }
    
    init(store: StoreOf<MovieTableListFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
}

extension StoreOf<MovieTableListFeature> {
    
    static var initial: StoreOf<MovieTableListFeature> {
        Store(initialState: State(movies: []), reducer: { MovieTableListFeature() })
    }
    
}

#Preview {
    MovieTableListView(
        store: Store(
            initialState: MovieTableListFeature.stateMock,
            reducer: { MovieTableListFeature() }
        )
    )
}
