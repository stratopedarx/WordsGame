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
        savedGame = currentGame
        currentGame.removeAll()
    }
    
    func resetCurrentGame() {
        currentGame.removeAll()
    }
}
