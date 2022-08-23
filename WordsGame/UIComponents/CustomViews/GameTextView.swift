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
    var topPadding: CGFloat = MagicNumber.x
    private let horizontalPadding: CGFloat = MagicNumber.x3
    private let cornerRadius: CGFloat = MagicNumber.x2

    var body: some View {
        TextField(placeholder, text: $text)
            .showClearButton($text)
            .font(.title2)
            .padding(.all, MagicNumber.x)
            .background(.white)
            .cornerRadius(cornerRadius)
            .padding(.horizontal, horizontalPadding)
            .padding(.top, topPadding)
    }
}
