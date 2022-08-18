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
