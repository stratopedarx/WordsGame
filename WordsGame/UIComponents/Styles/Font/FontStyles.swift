//
//  FontStyles.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 07.08.2022.
//

import SwiftUI

// MARK: - Priary font Style

struct PrimaryFontStyle: ViewModifier {
    var size: CGFloat = MagicNumber.x2
    var color: Color = .white
    var weight: Font.WeightType = .medium

    func body(content: Content) -> some View {
        content
            .font(.appFont(size: size, weight: weight))
            .foregroundColor(color)
    }
}
