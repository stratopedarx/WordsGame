//
//  TitleModifier.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 24.08.2022.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.appFont(size: MagicNumber.x3, weight: .medium))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, MagicNumber.x/2)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(.black)
                    .shadow(color: .blue.opacity(0.8), radius: 6)
            )
            .padding(.horizontal, MagicNumber.x)
    }
}
