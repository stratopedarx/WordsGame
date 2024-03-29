//
//  GameTextFieldView.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 26.06.2022.
//

import SwiftUI

struct GameTextFieldView: View {
    var placeholder: String
    @Binding var text: String
    var topPadding: CGFloat = MagicNumber.x
    var disableAutocorrection = true
    private let horizontalPadding: CGFloat = MagicNumber.x3
    private let cornerRadius: CGFloat = MagicNumber.x2

    var body: some View {
        TextField(placeholder, text: $text)
            .placeholder(when: text.isEmpty) {
                Text(placeholder).foregroundColor(.gray)
            }
            .foregroundColor(Color.black)
            .showClearButton($text)
            .disableAutocorrection(disableAutocorrection)
            .font(.title2)
            .padding(.all, MagicNumber.x)
            .background(.white)
            .cornerRadius(cornerRadius)
            .padding(.horizontal, horizontalPadding)
            .padding(.top, topPadding)
    }
}
