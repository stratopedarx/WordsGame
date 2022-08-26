//
//  PlaceholderPlayerWordView.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 26.08.2022.
//

import SwiftUI

struct PlaceholderPlayerWordView: View {
    var placeholder: String
    
    var body: some View {
        Text(placeholder)
            .titleStyle(
                fontSize: MagicNumber.x2,
                colorShadow: placeholder == Localizable.allIsGood.localized ? .green : .red
            )
    }
}
