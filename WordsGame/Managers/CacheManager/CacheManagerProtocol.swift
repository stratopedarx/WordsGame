//
//  CacheManagerProtocol.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 27.08.2022.
//

typealias PlayerWords = [String]
typealias Game = [Player: PlayerWords]

protocol CacheManagerProtocol {
    var currentGame: Game { get set }
    var savedGame: Game? { get set }
    
    func saveCurrentGame()
    func resetCurrentGame()
}
