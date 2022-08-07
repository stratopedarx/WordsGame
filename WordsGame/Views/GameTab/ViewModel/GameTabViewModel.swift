//
//  GameTabViewModel.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 30.07.2022.
//

import SwiftUI

class GameTabViewModel: ObservableObject {
    @Published var quantityOfPlayers: Int = 2
    @Published var isDisabledMinusButton: Bool = false
    @Published var isDisabledPlusButton: Bool = false
    @Published var isError = false
    var errorDescription = ""
}

extension GameTabViewModel {
    func onIncrementPlayers() {
        isDisabledMinusButton = false
        if quantityOfPlayers >= GWConstants.maxNumberOfPlayers {
            isDisabledPlusButton = true
            isError = true
            errorDescription = Localizable.numberOfPlayersExceeded.localized
        } else {
            quantityOfPlayers += 1
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
        }
    }
}
