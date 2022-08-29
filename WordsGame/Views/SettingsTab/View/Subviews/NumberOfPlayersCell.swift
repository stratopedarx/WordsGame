//
//  NumberOfPlayersCell.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 29.08.2022.
//

import SwiftUI

struct NumberOfPlayersCell: View {
    @Binding var numberOfPlayers: Int

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(Localizable.quantity.localized)
                Text(Localizable.players.localized)
            }
                
            Spacer()
            VStack(alignment: .center) {
                Stepper("", value: $numberOfPlayers, in: GWConstants.minNumberOfPlayers...GWConstants.maxNumberOfPlayers)
                    .labelsHidden()
                Text("\(Localizable.players.localized): \(numberOfPlayers)")
                    .modifier(PrimaryFontStyle(size: MagicNumber.x2, weight: .light))
            }
        }
        .padding(.horizontal, MagicNumber.x)
        .titleStyle()
    }
}
