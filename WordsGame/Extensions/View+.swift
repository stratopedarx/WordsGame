//
//  View.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 07.08.2022.
//

import SwiftUI

// MARK: - To wrap in ScrollView

extension View {
    func wrapInScroll(showsIndicators: Bool = false) -> some View {
        self.modifier(WrapInScrollWiewModifier(showsIndicators: showsIndicators))
    }
}

// MARK: - Add clear button to TextField

extension View {
    func showClearButton(_ text: Binding<String>) -> some View {
        self.modifier(TextFieldClearButton(fieldText: text))
    }
}

// MARK: - Add style for Text

extension View {
    func gameWordStyle() -> some View {
        modifier(CharacterModifier())
    }
}

extension View {
    func titleStyle(fontSize: CGFloat = MagicNumber.x3, colorShadow: Color = .blue) -> some View {
        modifier(TitleModifier(fontSize: fontSize, colorShadow: colorShadow))
    }
}

// MARK: - View's gradient method

extension View {
    @ViewBuilder func backgroundGradient(colors: [Color] = [.red, .gray.opacity(0.5)]) -> some View {
        self.modifier(GradientBackgroundModifier(colors: colors))
    }
}

// MARK: - View's method for Text Field placeholder

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
