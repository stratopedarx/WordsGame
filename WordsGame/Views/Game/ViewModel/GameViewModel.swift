//
//  GameViewModel.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 23.08.2022.
//

import SwiftUI

class GameViewModel: ObservableObject {
    var gameWord: String
    var players: [Player]
    var placeholderNames: [String]
    
    init(gameWord: String, players: [Player], placeholderNames: [String]) {
        self.gameWord = gameWord
        self.players = players
        self.placeholderNames = placeholderNames
    }
}
