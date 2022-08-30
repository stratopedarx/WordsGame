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
    case exclamationmark_bubble = "exclamationmark.bubble"
    case minus = "minus.circle"
    case multiply_circle_fill = "multiply.circle.fill"
    case plus = "plus.circle"
    case scribble_variable = "scribble.variable"
    
    var type: IconType {
        switch self {
        case .arrow_clockwise,
            .gamecontroller,
            .gear,
            .exclamationmark_bubble,
            .minus,
            .multiply_circle_fill,
            .plus,
            .scribble_variable:
            return .system
        }
    }
}
