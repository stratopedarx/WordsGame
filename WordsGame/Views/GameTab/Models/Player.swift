//
//  Player.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 07.08.2022.
//

import Foundation
import SwiftUI

struct Player: Identifiable, Equatable, Hashable {
    static var countPlayers = 1
    static func decreaseCountPlayers() {
        countPlayers -= 1
    }
    static func resetCountPlayers() {
        countPlayers = 1
    }
    
    var id = UUID()
    var name = ""
    var placeholder = ""
    var points: Int = 0
    
    init() {
        placeholder = "\(Localizable.player.localized) \(Player.countPlayers)"
        Player.countPlayers += 1
    }
    
    mutating func update(points: Int) {
        self.points += points
    }
    
    mutating func resetPoints() {
        self.points = 0
    }
}

extension Player {
    private var playerIndex: Int {
        guard let playerIndex = Int(placeholder.suffix(1)) else {
            return 0
        }
        return playerIndex
        
    }
    var color: Color {
        var color: Color
        switch playerIndex {
        case 1:
            color = .red
        case 2:
            color = .white
        case 3:
            color = .green
        case 4:
            color = .indigo
        default:
            color = .blue
        }
        return color
    }
}
