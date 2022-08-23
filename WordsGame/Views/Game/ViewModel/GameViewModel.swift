//
//  GameViewModel.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 23.08.2022.
//

import SwiftUI

final class GameViewModel: ObservableObject {
    var gameWord: String
    var players: [Player]
    var placeholderNames: [String]
    
    @Published var showCloseAlert = false
    
    init(gameWord: String, players: [Player], placeholderNames: [String]) {
        self.gameWord = gameWord
        self.players = players
        self.placeholderNames = placeholderNames
    }
    
    func cancelAction() {
        showCloseAlert = true
    }
    
    func saveGame() {
        // Todo need to implement saving the game
    }
}
