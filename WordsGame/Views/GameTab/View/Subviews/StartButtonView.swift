//
//  StartButtonView.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 26.06.2022.
//

import SwiftUI

struct StartButtonView: View {
    var title: Localizable
    var action: () -> Void

    var body: some View {
        Button(title.localized) {
            action()
        }
        .buttonStyle(PrimaryButtonStyle())
    }
}
