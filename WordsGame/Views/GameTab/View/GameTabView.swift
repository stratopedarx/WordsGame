//
//  GameTab.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 25.06.2022.
//

import SwiftUI

struct GameTabView: View {
    @StateObject private var viewModel: GameTabViewModel
    private let gameComponent: GameComponentProtocol
    
    init(viewModel: GameTabViewModel, gameComponent: GameComponentProtocol) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.gameComponent = gameComponent
    }

    var body: some View {
        VStack {
            TitleText()
            GameTextFieldView(
                placeholder: Localizable.enterBigWord.localized,
                text: $viewModel.mainWord
            )
            ForEach(Array(viewModel.players.enumerated()), id: \.offset) { index, player in
                GameTextFieldView(
                    placeholder: player.placeholder,
                    text: $viewModel.placeholderNames[index]
                )
            }
            
            VStack(spacing: MagicNumber.x) {
                QuantityOfPlayersView(
                    quantityOfPlayers: $viewModel.quantityOfPlayers,
                    isDisabledMinusButton: $viewModel.isDisabledMinusButton,
                    isDisabledPlusButton: $viewModel.isDisabledPlusButton,
                    onIncrement: viewModel.onIncrementPlayers,
                    onDecrement: viewModel.onDecrementPlayers
                )
                .padding(.top, MagicNumber.x)
                
                StartButtonView(title: .start, action: viewModel.startButtonAction)
            }
        }
        .wrapInScroll()
        .onDisappear(perform: viewModel.resetState)
        .fullScreenCover(isPresented: $viewModel.isShowGameView) {
            // ToDo: try to use Needle components. The problem that view model creates two times
//            GameView(
//                viewModel: GameViewModel(
//                    gameWord: viewModel.mainWord.uppercased(),
//                    players: viewModel.players,
//                    cacheManager: CacheManager.shared
//                )
//            )
            gameComponent.buildView(
                gameWord: viewModel.mainWord.uppercased(),
                players: viewModel.players
            )
            .onAppear(perform: viewModel.resetState)
        }
        .commonAlert(
            isPresented: $viewModel.isError,
            errorDescription: viewModel.errorDescription
        )
    }
}
