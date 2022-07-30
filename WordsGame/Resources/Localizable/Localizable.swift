//
//  Localizable.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 26.06.2022.
//

import Foundation

enum Localizable: String {
    case mainPlaceholder = "MAIN_PLACEHOLDER"
    case player1 = "PLAYER_1"
    case player2 = "PLAYER_2"
    case player3 = "PLAYER_3"
    case player4 = "PLAYER_4"
    case start = "START"
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
