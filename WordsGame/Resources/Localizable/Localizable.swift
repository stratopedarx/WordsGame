//
//  Localizable.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 26.06.2022.
//

import Foundation

enum Localizable: String {
    // MARK: - General
    
    case wordsGameTitle = "WORDS_GAME"
    case errorTitle = "ERROR_TITLE"
    case retry = "RETRY"
    case ok = "OK"
    case cancel = "CANCEL"
    
    // MARK: - Main View
    
    case gameTabTitle = "GAME_TAB_TITLE"
    case settingsTabTitle = "SETTINGS_TAB_TITLE"
    
    // MARK: - Game Tab View
    
    case enterBigWord = "ENTER_BIG_WORD"
    case player = "PLAYER"
    case start = "START"
    case quantityOfPlayers = "QUANTITY_OF_PLAYERS"
    case currentNumberOfPlayers = "CURRENT_NUMBER_OF_PLAYERS"
    case numberOfPlayersExceeded = "NUMBER_OF_PLAYERS_EXCEEDED"
    case minimumNumberOfPlayers = "MINIMUM_NUMBER_OF_PLAYERS"
    case mainWordInfo = "MAIN_WORD_INFO"
    case minimumWordLengthInfo = "MINIMUM_WORD_LENGTH_INFO"
    case bigWordContainsOnlyLettersInfo = "BIG_WORD_CONTAINS_ONLY_LETTERS_INFO"
    case enterPlayerNames = "ENTER_PLAYER_NAMES"
    
    // MARK: - Game View

    case saveGameAlert = "SAVE_GAME_ALERT"
    case saveGame = "SAVE_GAME"
    case doesNotSaveGame = "DOES_NOT_SAVE_GAME"
    
    // MARK: - Settings Tab View

    // MARK: - General Network Errors
    case alamofireError = "ALAMOFIRE_ERROR"
    case custom = "CUSTOM"
    case internalServerError = "INTERNAL_SERVER_ERROR"
    case invalidJSON = "INVALID_JSON"
    case invalidRequest = "INVALID_REQUEST"
    case noConnection = "NO_CONNECTION"
    case unknown = "UNKNOWN"
    case unknownCode = "UNKNOWN_CODE"
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
