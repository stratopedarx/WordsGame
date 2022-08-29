//
//  ExclusionWordsButtonView.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 30.08.2022.
//

import SwiftUI

struct ExclusionWordsButtonView: View {
    var title: Localizable
    var disabled: Bool
    var withBottomPadding: Bool = true
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title.localized)
        }
        .buttonStyle(PrimaryButtonStyle(fontSize: MagicNumber.x2, maxWidth: .infinity))
        .padding(.horizontal, MagicNumber.x2)
        .padding(.bottom, withBottomPadding ? MagicNumber.x2 : .zero)
        .modifier(Disabled(disabled: disabled))
    }
}
