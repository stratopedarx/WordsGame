//
//  GameTabViewModel.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 30.07.2022.
//

import SwiftUI

class GameTabViewModel: ObservableObject {
    @Published var mainWord = ""
    @Published var players: [Player] = []
    @Published var quantityOfPlayers: Int = GWConstants.minNumberOfPlayers
    @Published var placeholderNames: [String] = []
    @Published var isDisabledMinusButton: Bool = false
    @Published var isDisabledPlusButton: Bool = false
    @Published var isShowGameView = false
    @Published var isError = false
    var errorDescription = ""
    
    init() {
        for _ in 0..<GWConstants.minNumberOfPlayers {
            players.append(Player())
            placeholderNames.append("")
        }
    }
    
    func resetState() {
        mainWord = ""
        quantityOfPlayers = GWConstants.minNumberOfPlayers
        placeholderNames.removeAll()
        
        players.removeAll()
        Player.resetCountPlayers()
        for _ in 0..<GWConstants.minNumberOfPlayers {
            players.append(Player())
            placeholderNames.append("")
        }
    }
}

// MARK: - startButtonAction

extension GameTabViewModel {
    func startButtonAction() {
        guard !mainWord.isEmpty else {
            isError = true
            errorDescription = Localizable.mainWordInfo.localized
            return
        }
        guard mainWord.count >= GWConstants.minimumWordLength else {
            isError = true
            errorDescription = Localizable.minimumWordLengthInfo.localized
            return
        }
        guard mainWord.count <= GWConstants.maximumWordLength else {
            isError = true
            errorDescription = Localizable.maximumWordLengthInfo.localized
            return
        }
        
        guard mainWord.first(where: { !$0.isLetter }) == nil else {
            isError = true
            errorDescription = Localizable.bigWordContainsOnlyLettersInfo.localized
            return
        }
        
        _ = placeholderNames.enumerated().map { index, name in
            players[index].name = name.isEmpty ? players[index].placeholder : name
        }
        isShowGameView = true
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
            placeholderNames.append("")
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
            placeholderNames.removeLast()
            Player.decreaseCountPlayers()
        }
    }
}
