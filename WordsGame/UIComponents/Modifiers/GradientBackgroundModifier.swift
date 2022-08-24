//
//  GradientBackgroundModifier.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 24.08.2022.
//

import SwiftUI

struct GradientBackgroundModifier: ViewModifier {
    var colors: [Color]

    func body(content: Content) -> some View {
        content
            .background(
                LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
            )
    }
}
