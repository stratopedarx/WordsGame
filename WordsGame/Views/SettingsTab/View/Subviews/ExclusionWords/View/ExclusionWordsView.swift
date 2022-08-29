//
//  ExclusionWordsView.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 29.08.2022.
//

import SwiftUI

struct ExclusionWordsView: View {
    @ObservedObject var viewModel: ExclusionWordsViewModel
    
    var body: some View {
        VStack {
            TitleText(title: .exclusionWords)
            if !viewModel.isLoading {
                if viewModel.exclusionWords.isEmpty {
                    PlaceholderView(iconName: .exclamationmark_bubble, title: .emptyListOfExclusionWords)
                } else {
                    ScrollView(showsIndicators: false) {
                        ForEach(viewModel.exclusionWords, id: \.self) { word in
                            Text(word)
                                .titleStyle()
                        }
                    }
                }
            }
            Spacer()
            
            GameTextFieldView(placeholder: Localizable.exclusionWord.localized, text: $viewModel.newExclusionWord)
            
            ExclusionWordsButtonView(
                title: .addWord,
                disabled: viewModel.disabled,
                withBottomPadding: false,
                action: viewModel.addExclusionWord
            )
            ExclusionWordsButtonView(
                title: .removeAllWords,
                disabled: viewModel.isLoading,
                action: viewModel.removeExclusionWords
            )
        }
        .overlay(viewModel.isLoading ? GWProgressView() : nil)
        .onAppear {
            viewModel.loadExclusionWords()
        }
    }
}
