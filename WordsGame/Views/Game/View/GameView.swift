//
//  GameView.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 26.06.2022.
//

import SwiftUI

struct GameView: View, KeyboardReadable {
    @StateObject private var viewModel: GameViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var keyboardOffset: CGFloat = .zero
    
    init(viewModel: GameViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    private var headerGameView: some View {
        HeaderGameView(action: viewModel.cancelAction, refresh: true, refreshAction: { viewModel.showAlertRefreshGame = true })
            .commonAlert(
                isPresented: $viewModel.showCloseAlert,
                errorTitle: Localizable.endGameAlert.localized,
                errorDescription: Localizable.endGameAlertDescription.localized,
                actionButtonTitle: Localizable.endGameAlert.localized,
                cancelButtonTitle: Localizable.cancel.localized,
                action: {
                    viewModel.resetGame()
                    presentationMode.wrappedValue.dismiss()
                }
            )
    }
    
    private var gameWordView: some View {
        GameWordView(gameWord: viewModel.gameWord)
            .commonAlert(
                isPresented: $viewModel.showAlertRefreshGame,
                errorTitle: Localizable.newGame.localized,
                errorDescription: Localizable.newGameAlertDescription.localized,
                actionButtonTitle: Localizable.newGame.localized,
                cancelButtonTitle: Localizable.cancel.localized,
                action: viewModel.refreshGame
            )
    }
    
    private var checkPlayerWordView: some View {
        CheckPlayerWordView(
            placeholder: viewModel.placeholderPlayerWord,
            isDisabled: viewModel.isLoading,
            action: viewModel.checkEnteredWord
        )
        .commonAlert(
            isPresented: $viewModel.showAlertCheckedWord,
            errorTitle: (viewModel.isCorrectWord ? Localizable.gameOkAlertTitle : Localizable.gameNotOkAlertTitle).localized,
            errorDescription: (viewModel.isCorrectWord ? Localizable.gameOkAlertDescription : Localizable.gameNotOkAlertDescription).localized,
            cancel: { viewModel.isCorrectWord ? viewModel.toNextPlayer() : viewModel.tryAgain() }
        )
    }
    
    var body: some View {
        VStack {
            headerGameView
            gameWordView
            InfoBoardView(name: viewModel.currentPlayer.name, players: viewModel.players)
            GameTextFieldView(placeholder: Localizable.playerWordPlaceholder.localized, text: $viewModel.playerWord)
                .disabled(viewModel.isLoading)
                .onChange(of: viewModel.playerWord) { newWord in
                    viewModel.validate(newWord)
                }
            PlaceholderPlayerWordView(placeholder: viewModel.placeholderPlayerWord)
            checkPlayerWordView
            GameWordsList(gameCells: viewModel.allWordsForCurrentGame)
        }
        .wrapInScroll()
        .onReceive(keyboardPublisher, perform: { newIsKeyboardVisible in
            if UIScreen.main.bounds.height < 670 {
                withAnimation {
                    keyboardOffset = newIsKeyboardVisible ? -120 : .zero
                }
            }
        })
        .offset(y: keyboardOffset)
        .background(Image("background"))
        .edgesIgnoringSafeArea(.all)
    }
}
