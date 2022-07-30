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
    
    var type: IconType {
        switch self {
        case .gamecontroller,
            .gear:
            return .system
        }
    }
}
