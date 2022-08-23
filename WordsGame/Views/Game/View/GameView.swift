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
    
    init(viewModel: GameViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            HeaderGameView(action: viewModel.cancelAction)

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
    }
}
