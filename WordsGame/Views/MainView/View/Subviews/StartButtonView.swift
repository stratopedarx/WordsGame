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
        Button {
            action()
        } label: {
            Text(title.localized)
                .font(.custom("AvenirNext-Bold", size: MagicNumber.x4))
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal, MagicNumber.x8)
                .background(.blue)
                .cornerRadius(MagicNumber.x8)
                .padding(.top, MagicNumber.x4)
        }
    }
}
