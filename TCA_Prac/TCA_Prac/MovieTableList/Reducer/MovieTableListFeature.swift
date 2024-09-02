//
//  MovieTableListFeature.swift
//  BoxOffice
//
//  Created by Dongmin on 9/1/24.
//

import ComposableArchitecture
import Foundation

@Reducer
struct MovieTableListFeature {
    
    @ObservableState
    struct State: Equatable {
        @Presents var confirmationDialog: ConfirmationDialogState<Action.ConfirmationDialog>?
        var movies: [MovieTableItemViewModel]
    }
    
    enum Action {
        case onAppear
        case movieResponse(movies: [MovieTableItemViewModel])
        case didTapMovie
        case didTapMore
        case confimationDialog(PresentationAction<ConfirmationDialog>)
        
        @CasePathable
        enum ConfirmationDialog {
            case didTapDefault
            case didTapCuration
            case didTapReleaseDate
        }
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .run { send in
                    let movies = await self.repository.requestMovies(order_type: 0)
                    await send(.movieResponse(movies: movies))
                }
                
            case .movieResponse(let movies):
                state.movies = movies
                return .none
                
            case .didTapMovie:
                // TODO: - 디테일 페이지로 이동 ?
                return .none
                
            case .didTapMore:
                state.confirmationDialog = ConfirmationDialogState {
                    TextState("순서")
                } actions: {
                    ButtonState(action: .didTapDefault) {
                        TextState("예매율순")
                    }
                    ButtonState(action: .didTapCuration) {
                        TextState("큐레이션순")
                    }
                    ButtonState(action: .didTapReleaseDate) {
                        TextState("개봉일순")
                    }
                } message: {
                    TextState("순서대로 나열하길 원하는 옵션을 선택하세요.")
                }
                return .none
                                
            case .confimationDialog(.dismiss):
                return .none
                
            case .confimationDialog(.presented(.didTapDefault)):
                return .run { send in
                    let movies = await self.repository.requestMovies(order_type: 0)
                    await send(.movieResponse(movies: movies))
                }
                
            case .confimationDialog(.presented(.didTapCuration)):
                return .run { send in
                    let movies = await self.repository.requestMovies(order_type: 1)
                    await send(.movieResponse(movies: movies))
                }
                
            case .confimationDialog(.presented(.didTapReleaseDate)):
                return .run { send in
                    let movies = await self.repository.requestMovies(order_type: 2)
                    await send(.movieResponse(movies: movies))
                }
            }
        }
        .ifLet(\.$confirmationDialog, action: \.confimationDialog)
    }
    
    init(repository: MovieTableRepository = MovieTableRepository()) {
        self.repository = repository
    }
    
    private let repository: MovieTableRepository
    
}
