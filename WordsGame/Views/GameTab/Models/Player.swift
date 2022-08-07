//
//  Player.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 07.08.2022.
//

import Foundation

struct Player: Identifiable, Equatable {
    static var countPlayers = 1
    static func decreaseCountPlayers() {
        countPlayers -= 1
    }
    
    var id = UUID()
    var name = ""
    var placeholder = ""
    
    init() {
        placeholder = "\(Localizable.player.localized) \(Player.countPlayers)"
        Player.countPlayers += 1
    }
}
