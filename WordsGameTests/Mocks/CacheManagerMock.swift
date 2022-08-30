//
//  CacheManagerMock.swift
//  WordsGameTests
//
//  Created by Sergey Lobanov on 30.08.2022.
//

import Foundation
@testable import WordsGame

final class CacheManagerMock: CacheManagerProtocol {
    static let shared = CacheManagerMock()

    var currentGame: Game = [:]
    var savedGame: Game?
    
    func saveCurrentGame() {
        savedGame = currentGame
    }
    
    func resetCurrentGame() {
        savedGame = nil
    }
}
