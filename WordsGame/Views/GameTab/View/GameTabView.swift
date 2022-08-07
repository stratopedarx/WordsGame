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
    @State var player1Name = ""
    @State var player2Name = ""
    @State var player3Name = ""
    @State var player4Name = ""
    @State var isShowGameView = false
    @State var quantityOfPlayers: Int = 2
    
    init(viewModel: GameTabViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            GameTextView(placeholder: .enterBigWord, text: $mainWord, topPadding: MagicNumber.x8)
            GameTextView(placeholder: .player1, text: $player1Name)
            GameTextView(placeholder: .player2, text: $player1Name, topPadding: MagicNumber.x2)
            
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
