//
//  QuantityOfPlayersView.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 07.08.2022.
//

import SwiftUI

private struct StepButton: View {
    var iconName: IconName
    var isDisabled: Bool
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            IconView(iconName: iconName)
                .scaleEffect(2)
        }
        .modifier(Disabled(disabled: isDisabled))
    }
}

struct QuantityOfPlayersView: View {
    @Binding var quantityOfPlayers: Int
    @Binding var isDisabledMinusButton: Bool
    @Binding var isDisabledPlusButton: Bool
    var onIncrement: () -> Void
    var onDecrement: () -> Void
    
    var body: some View {
        VStack(spacing: MagicNumber.x2) {
            Text("\(Localizable.currentNumberOfPlayers.localized): \(quantityOfPlayers)")
            
            HStack(spacing: MagicNumber.x4) {
                StepButton(iconName: .minus, isDisabled: isDisabledMinusButton, action: onDecrement)
                StepButton(iconName: .plus, isDisabled: isDisabledPlusButton, action: onIncrement)
            }
        }
        .padding()
        .modifier(PrimaryFontStyle())
        .background(Color.blue)
        .cornerRadius(MagicNumber.x2)
    }
}
