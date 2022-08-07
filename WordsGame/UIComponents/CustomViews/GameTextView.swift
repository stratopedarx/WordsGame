//
//  GameTextView.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 26.06.2022.
//

import SwiftUI

struct GameTextView: View {
    var placeholder: String
    @Binding var text: String
    var topPadding: CGFloat = MagicNumber.x4
    private let horizontalPadding: CGFloat = MagicNumber.x3
    private let cornerRadius: CGFloat = MagicNumber.x2

    var body: some View {
        TextField(placeholder, text: $text)
            .font(.title2)
            .padding()
            .background(.white)
            .cornerRadius(cornerRadius)
            .padding(.horizontal, horizontalPadding)
            .padding(.top, topPadding)
    }
}
