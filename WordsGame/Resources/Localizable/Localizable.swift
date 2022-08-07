//
//  Localizable.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 26.06.2022.
//

import Foundation

enum Localizable: String {
    // MARK: - General
    
    case errorTitle = "ERROR_TITLE"
    case retry = "RETRY"
    case ok = "OK"
    case cancel = "CANCEL"
    
    // MARK: - Main View
    
    case gameTabTitle = "GAME_TAB_TITLE"
    case settingsTabTitle = "SETTINGS_TAB_TITLE"
    
    // MARK: - Game Tab View
    
    case enterBigWord = "ENTER_BIG_WORD"
    case player1 = "PLAYER_1"
    case player2 = "PLAYER_2"
    case player3 = "PLAYER_3"
    case player4 = "PLAYER_4"
    case start = "START"
    case quantityOfPlayers = "QUANTITY_OF_PLAYERS"
    case currentNumberOfPlayers = "CURRENT_NUMBER_OF_PLAYERS"
    case numberOfPlayersExceeded = "NUMBER_OF_PLAYERS_EXCEEDED"
    case minimumNumberOfPlayers = "MINIMUM_NUMBER_OF_PLAYERS"
    
    // MARK: - Settings Tab View

}

// MARK: - Localized string

extension Localizable {
    var localized: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }

    func localizedWithParametr(_ parametr: String) -> String {
        return String(format: self.localized, parametr)
    }
}
