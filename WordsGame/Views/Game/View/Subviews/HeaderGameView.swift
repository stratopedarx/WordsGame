//
//  HeaderGameView.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 24.08.2022.
//

import SwiftUI

struct HeaderGameView: View {
    var action: () -> Void
    var size: Double = 1.2
    
    var body: some View {
        ZStack {
            TitleText()
            HStack {
                Spacer()
                Button {
                    action()
                } label: {
                    IconView(iconName: .multiply_circle_fill, color: .gray)
                }
                .padding(.trailing, MagicNumber.x)
                .scaleEffect(size)
            }
        }
        .padding(.top, MagicNumber.x4)
    }
}
