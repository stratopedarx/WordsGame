//
//  TitleModifier.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 24.08.2022.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    var fontSize: CGFloat
    var colorShadow: Color
    func body(content: Content) -> some View {
        content
            .font(.appFont(size: fontSize, weight: .medium))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, MagicNumber.x/2)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(.black)
                    .shadow(color: colorShadow.opacity(0.8), radius: 6)
            )
            .padding(.horizontal, MagicNumber.x)
    }
}
