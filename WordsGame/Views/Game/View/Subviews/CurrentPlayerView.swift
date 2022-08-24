//
//  CurrentPlayerView.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 24.08.2022.
//

import SwiftUI

struct CurrentPlayerView: View {
    var name: String

    var body: some View {
        Text("\(Localizable.currentPlayerInfo.localized) \(name.capitalized)")
            .titleStyle()
    }
}
