//
//  PrimaryButtonStyle.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 07.08.2022.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    var disabled: Bool = false
    var fontSize: CGFloat = MagicNumber.x4
    var minWidth: CGFloat = GWConstantsUI.Button.minWidthPrimary
    var maxWidth: CGFloat?
    var pressedBrightness: Double = -MagicNumber.x05 * 0.05
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .lineLimit(1)
            .font(.appFont(size: fontSize, weight: .bold))
            .frame(minWidth: minWidth, maxWidth: maxWidth ?? .none)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue.brightness(
                configuration.isPressed ? pressedBrightness : .zero))
            .cornerRadius(MagicNumber.x8)
            .animation(.easeInOut, value: configuration.isPressed)
            .modifier(Disabled(disabled: disabled))
    }
}
