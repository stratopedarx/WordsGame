//
//  CacheManager.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 27.08.2022.
//

import Foundation

final class CacheManager: CacheManagerProtocol {
    static let shared = CacheManager()

    var currentGame: Game = [:]
    var savedGame: Game?
    
    func saveCurrentGame() {
        // Todo need to implement saving the game
        print("!!! save current game")
        savedGame = currentGame
        currentGame.removeAll()
    }
    
    func resetCurrentGame() {
        // Todo need to implement reseting the game
        print("!!! reset current game")
        currentGame.removeAll()
    }
}
