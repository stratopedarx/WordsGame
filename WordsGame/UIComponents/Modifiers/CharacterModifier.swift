//
//  CharacterModifier.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 24.08.2022.
//

import SwiftUI

struct CharacterModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(.gray)
                    .frame(
                        minWidth: 30,
                        minHeight: 30,
                        alignment: .center
                    )
                    .shadow(color: .white.opacity(0.5), radius: 5)
            )
            .padding(MagicNumber.x)
    }
}
