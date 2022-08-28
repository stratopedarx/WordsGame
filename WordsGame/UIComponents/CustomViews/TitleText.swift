//
//  TitleText.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 07.08.2022.
//

import SwiftUI

struct TitleText: View {
    var title: Localizable = .wordsGameTitle
    
    var body: some View {
        Text(title.localized)
            .font(.appFont(size: MagicNumber.x4, weight: .bold))
            .frame(maxWidth: .infinity)
            .background(Color.black)
            .foregroundColor(.white)
            .shadow(color: .blue.opacity(0.8), radius: 6)
            .padding(.top, MagicNumber.x/2)
    }
}
