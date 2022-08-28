//
//  PlayerWordPlaceholders.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 27.08.2022.
//

import SwiftUI

enum PlayerWordPlaceholders: String {
    case initPlaceholder
    case minimumTwoLetters
    case allIsGood
    
    var value: String {
        var value: Localizable
        switch self {
        case .initPlaceholder:
            value = .initGameWordPlaceholder
        case .minimumTwoLetters:
            value = .minimumTwoLetters
        case .allIsGood:
            value = .allIsGood
        }
        return value.localized
    }
    
    var color: Color {
        var color: Color
        switch self {
        case .initPlaceholder:
            color = .blue
        case .minimumTwoLetters:
            color = .red
        case .allIsGood:
            color = .green
        }
        return color
    }
}
