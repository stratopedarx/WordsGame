//
//  SettingsTabView.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 30.07.2022.
//

import SwiftUI

struct SettingsTabView: View {
    @ObservedObject private var viewModel: SettingsTabViewModel

    init(viewModel: SettingsTabViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            TitleText(title: .settings)
            NumberOfPlayersCell(numberOfPlayers: $viewModel.numberOfPlayers)

            HStack {
                Button {
                    viewModel.showExclusionWordsSheet = true
                } label: {
                    Text(Localizable.exclusionWords.localized)
                }
            }
            .titleStyle()
            Spacer()
        }
        .sheet(isPresented: $viewModel.showExclusionWordsSheet) {
            ExclusionWordsView(viewModel: ExclusionWordsViewModel())
        }
    }
}
