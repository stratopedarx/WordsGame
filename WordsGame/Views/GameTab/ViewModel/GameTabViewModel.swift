//
//  GameTabViewModel.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 30.07.2022.
//

import SwiftUI

class GameTabViewModel: ObservableObject {
    @Published var players: [Player] = []
    @Published var quantityOfPlayers: Int = GWConstants.minNumberOfPlayers
    @Published var isDisabledMinusButton: Bool = false
    @Published var isDisabledPlusButton: Bool = false
    @Published var isError = false
    var errorDescription = ""
    
    init() {
        print("!!! init GameTabViewModel")
        for _ in 0..<GWConstants.minNumberOfPlayers {
            players.append(Player())
        }
    }
    
    deinit {
        print("!!! deinit GameTabViewModel")
    }
}

// MARK: - Increment/Decrement functions for number of players

extension GameTabViewModel {
    func onIncrementPlayers() {
        isDisabledMinusButton = false
        if quantityOfPlayers >= GWConstants.maxNumberOfPlayers {
            isDisabledPlusButton = true
            isError = true
            errorDescription = Localizable.numberOfPlayersExceeded.localized
        } else {
            quantityOfPlayers += 1
            players.append(Player())
        }
    }
    
    func onDecrementPlayers() {
        isDisabledPlusButton = false
        if quantityOfPlayers <= GWConstants.minNumberOfPlayers {
            isDisabledMinusButton = true
            isError = true
            errorDescription = Localizable.minimumNumberOfPlayers.localized
        } else {
            quantityOfPlayers -= 1
            players.removeLast()
            Player.decreaseCountPlayers()
        }
    }
}
