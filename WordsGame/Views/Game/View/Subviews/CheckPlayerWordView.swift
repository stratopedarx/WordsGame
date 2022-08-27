//
//  CheckPlayerWordView.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 26.08.2022.
//

import SwiftUI

struct CheckPlayerWordView: View {
    var placeholder: PlayerWordPlaceholders
    var isDisabled: Bool
    var action: () -> Void
    
    var body: some View {
        Button(Localizable.areYouReady.localized) {
            action()
        }
        .buttonStyle(PrimaryButtonStyle(fontSize: MagicNumber.x2))
        .modifier(Disabled(disabled: isDisabled || placeholder != .allIsGood))
        .overlay(isDisabled ? GWProgressView() : nil)
    }
}
