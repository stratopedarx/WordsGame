//
//  Disabled.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 07.08.2022.
//

import SwiftUI

struct Disabled: ViewModifier {
    var disabled: Bool
    var opacityValue: Double = MagicNumber.x * 0.01
    
    func body(content: Content) -> some View {
        content
            .opacity(disabled ? opacityValue : 1)
            .disabled(disabled)
    }
}
