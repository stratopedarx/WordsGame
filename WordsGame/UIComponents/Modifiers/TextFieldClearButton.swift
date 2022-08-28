//
//  TextFieldClearButton.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 23.08.2022.
//

import SwiftUI

struct TextFieldClearButton: ViewModifier {
    @Binding var fieldText: String

    func body(content: Content) -> some View {
        content
            .overlay {
                if !fieldText.isEmpty {
                    HStack {
                        Spacer()
                        Button {
                            fieldText = ""
                        } label: {
                            IconView(iconName: .multiply_circle_fill)
                        }
                        .foregroundColor(.gray)
                        .padding(.trailing, 4)
                    }
                }
            }
    }
}
