//
//  GameView.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 26.06.2022.
//

import SwiftUI

struct GameView: View {
    @StateObject private var viewModel: GameViewModel
    @Environment(\.presentationMode) var presentationMode
    var cacheManager: CacheManager
    
    init(viewModel: GameViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.cacheManager = CacheManager.shared
    }
    
    private var headerGameView: some View {
        HeaderGameView(action: viewModel.cancelAction)
            .commonAlert(
                isPresented: $viewModel.showCloseAlert,
                errorDescription: Localizable.saveGameAlert.localized,
                actionButtonTitle: Localizable.saveGame.localized,
                cancelButtonTitle: Localizable.doesNotSaveGame.localized,
                action: {
                    viewModel.saveGame()
                    presentationMode.wrappedValue.dismiss()
                },
                cancel: {
                    presentationMode.wrappedValue.dismiss()
                }
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
            GameWordView(gameWord: viewModel.gameWord)
            CurrentPlayerView(name: viewModel.currentPlayer.name)
            GameTextFieldView(placeholder: Localizable.playerWordPlaceholder.localized, text: $viewModel.playerWord)
                .disabled(viewModel.isLoading)
                .onChange(of: viewModel.playerWord) { newWord in
                    viewModel.validate(newWord)
                }
            PlaceholderPlayerWordView(placeholder: viewModel.placeholderPlayerWord)
            checkPlayerWordView
        }
        .wrapInScroll()
        .background(Image("background"))
        .edgesIgnoringSafeArea(.all)
    }
}
