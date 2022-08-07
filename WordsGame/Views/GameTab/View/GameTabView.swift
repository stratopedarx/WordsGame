//
//  GameTab.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 25.06.2022.
//

import SwiftUI

struct GameTabView: View {
    @ObservedObject private var viewModel: GameTabViewModel
    @State var mainWord = ""
    @State var placeholderNames = [String](repeating: "", count: GWConstants.maxNumberOfPlayers)
    @State var isShowGameView = false
    @State var quantityOfPlayers: Int = 2
    
    init(viewModel: GameTabViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            GameTextView(
                placeholder: Localizable.enterBigWord.localized,
                text: $mainWord,
                topPadding: MagicNumber.x8
            )
            ForEach(Array(viewModel.players.enumerated()), id: \.offset) { index, player in
                GameTextView(placeholder: player.placeholder, text: $placeholderNames[index])
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
                
                StartButtonView(title: .start, action: { isShowGameView = true })
            }
        }
        .fullScreenCover(isPresented: $isShowGameView) {
            GameView()
        }
        .commonAlert(
            isPresented: $viewModel.isError,
            errorDescription: viewModel.errorDescription
        )
    }
}
