//
//  PlaceholderPlayerWordView.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 26.08.2022.
//

import SwiftUI

struct PlaceholderPlayerWordView: View {
    var placeholder: PlayerWordPlaceholders
    
    var body: some View {
        Text(placeholder.value)
            .titleStyle(fontSize: MagicNumber.x2, colorShadow: placeholder.color)
    }
}
