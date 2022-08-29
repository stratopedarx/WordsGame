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
    case maximumWordLengthInfo = "MAXIMUM_WORD_LENGTH_INFO"
    case bigWordContainsOnlyLettersInfo = "BIG_WORD_CONTAINS_ONLY_LETTERS_INFO"
    case enterPlayerNames = "ENTER_PLAYER_NAMES"
    case currentPlayerInfo = "CURRENT_PLAYER_INFO"
    
    // MARK: - Game View

    case endGameAlert = "END_GAME_ALERT"
    case endGameAlertDescription = "END_GAME_ALERT_DESCRIPTION"
    case doesNotSaveGame = "DOES_NOT_SAVE_GAME"
    case playerWordPlaceholder = "PLAYER_WORD_PLACEHOLDER"
    case initGameWordPlaceholder = "INIT_GAME_WORD_PLACEHOLDER"
    case minimumTwoLetters = "MINIMUM_TWO_LETTERS"
    case allIsGood = "ALL_IS_GOOD"
    case areYouReady = "ARE_YOU_READY"
    case gameOkAlertTitle = "GAME_OK_ALERT_TITLE"
    case gameOkAlertDescription = "GAME_OK_ALERT_DESCRIPTION"
    case gameNotOkAlertTitle = "GAME_NOT_OK_ALERT_TITLE"
    case gameNotOkAlertDescription = "GAME_NOT_OK_ALERT_DESCRIPTION"
    case newGame = "NEW_GAME"
    case newGameAlertDescription = "NEW_GAME_ALERT_DESCRIPTION"
    
    // MARK: - Settings Tab View
    
    case settings = "SETTINGS"
    case quantity = "QUANTITY"
    case players = "PLAYERS"
    
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
