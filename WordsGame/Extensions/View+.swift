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
