//
//  SettingsTabView.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 30.07.2022.
//

import SwiftUI

struct SettingsTabView: View {
    @ObservedObject private var viewModel: SettingsTabViewModel
    private let exclusionWordsComponent: ExclusionWordsComponentProtocol

    init(viewModel: SettingsTabViewModel, exclusionWordsComponent: ExclusionWordsComponentProtocol) {
        self.viewModel = viewModel
        self.exclusionWordsComponent = exclusionWordsComponent
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
            exclusionWordsComponent.buildView()
//            ExclusionWordsView(viewModel: ExclusionWordsViewModel())
        }
    }
}
