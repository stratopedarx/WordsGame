//
//  InfoBoardView.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 24.08.2022.
//

import SwiftUI

struct InfoBoardView: View {
    var name: String
    var players: [Player]

    var body: some View {
        VStack {
            Text("\(Localizable.currentPlayerInfo.localized) \(name.capitalized)")
                .titleStyle(colorShadow: .brown)
            VStack {
                ForEach(players) { player in
                    Text("\(player.name): \(player.points)")
                        .titleStyle(fontSize: MagicNumber.x2, colorShadow: player.color)
                }
            }

        }
        .titleStyle()
    }
}
