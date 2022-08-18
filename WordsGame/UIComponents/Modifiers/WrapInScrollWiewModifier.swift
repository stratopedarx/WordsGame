//
//  WrapInScrollWiewModifier.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 07.08.2022.
//

import SwiftUI

struct WrapInScrollWiewModifier: ViewModifier {
    var showsIndicators: Bool

    func body(content: Content) -> some View {
        ScrollView(showsIndicators: showsIndicators) {
            content
        }
    }
}
