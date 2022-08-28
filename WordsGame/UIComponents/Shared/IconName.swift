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
    case arrow_clockwise = "arrow.clockwise"
    case gamecontroller
    case gear
    case minus = "minus.circle"
    case multiply_circle_fill = "multiply.circle.fill"
    case plus = "plus.circle"
    
    var type: IconType {
        switch self {
        case .arrow_clockwise,
            .gamecontroller,
            .gear,
            .minus,
            .multiply_circle_fill,
            .plus:
            return .system
        }
    }
}
