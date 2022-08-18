//
//  GameTab.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 25.06.2022.
//

import SwiftUI

struct GameTabView: View {
    @StateObject private var viewModel: GameTabViewModel
    
    init(viewModel: GameTabViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            TitleText()
            GameTextView(
                placeholder: Localizable.enterBigWord.localized,
                text: $viewModel.mainWord
            )
            ForEach(Array(viewModel.players.enumerated()), id: \.offset) { index, player in
                GameTextView(
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
        .fullScreenCover(isPresented: $viewModel.isShowGameView) {
            GameView()
        }
        .commonAlert(
            isPresented: $viewModel.isError,
            errorDescription: viewModel.errorDescription
        )
    }
}
