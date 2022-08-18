//
//  IconName.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 30.07.2022.
//

enum IconType {
    case custom
    case system
}

enum IconName: String {
    case gamecontroller
    case gear
    case minus = "minus.circle"
    case plus = "plus.circle"
    
    var type: IconType {
        switch self {
        case .gamecontroller,
            .gear,
            .minus,
            .plus:
            return .system
        }
    }
}
