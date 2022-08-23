//
//  GameViewModel.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 23.08.2022.
//

import SwiftUI

class GameViewModel: ObservableObject {
    var players: [Player]
    var placeholderNames: [String]
    
    init(players: [Player], placeholderNames: [String]) {
        self.players = players
        self.placeholderNames = placeholderNames
    }
}
