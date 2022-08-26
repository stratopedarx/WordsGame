//
//  GameView.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 26.06.2022.
//

import SwiftUI

typealias PlayerName = String
typealias PlayerWords = [String]
typealias CurrunetGame = [PlayerName: PlayerWords]

final class CacheManager {
    static let shared = CacheManager()

    var currentGame: CurrunetGame = [:]
}

struct GameView: View {
    @StateObject private var viewModel: GameViewModel
    @Environment(\.presentationMode) var presentationMode
    var cacheManager: CacheManager
    
    // ToDo: try to fix runtime bug
    var displayPlaceholder: Bool {
        return !viewModel.placeholderPlayerWord.isEmpty
    }
    
    init(viewModel: GameViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.cacheManager = CacheManager.shared
    }
    
    var body: some View {
        VStack {
            HeaderGameView(action: viewModel.cancelAction)
            GameWordView(gameWord: viewModel.gameWord)
            CurrentPlayerView(name: viewModel.currentPlayer.name)
            
            GameTextFieldView(placeholder: Localizable.playerWordPlaceholder.localized, text: $viewModel.playerWord)
                .disabled(viewModel.isLoading)
                .onChange(of: viewModel.playerWord) { newWord in
                    viewModel.validate(newWord)
                }
            
            if displayPlaceholder {
                PlaceholderPlayerWordView(placeholder: viewModel.placeholderPlayerWord)
            }
            CheckPlayerWordView(
                placeholderWord: viewModel.placeholderPlayerWord,
                isDisabled: viewModel.isLoading,
                action: viewModel.checkEnteredWord
            )
        }
        .wrapInScroll()
        .background(Image("background"))
        .edgesIgnoringSafeArea(.all)
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
        .commonAlert(
            isPresented: $viewModel.showAlertCheckedWord,
            errorTitle: (viewModel.isCorrectWord ? Localizable.gameOkAlertTitle : Localizable.gameNotOkAlertTitle).localized,
            errorDescription: (viewModel.isCorrectWord ? Localizable.gameOkAlertDescription : Localizable.gameNotOkAlertDescription).localized,
            cancel: { viewModel.isCorrectWord ? viewModel.toNextPlayer() : viewModel.tryAgain() }
        )
    }
}
