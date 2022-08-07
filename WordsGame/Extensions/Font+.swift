//
//  Font+.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 07.08.2022.
//

import SwiftUI

extension Font {
    enum WeightType: String {
        case light = "Light"
        case regular = "Regular"
        case medium = "Medium"
        case semiBold = "Semibold"
        case bold = "Bold"
    }
    
    private static let prefix = "AvenirNext-"
    
    static func appFont(size: CGFloat = MagicNumber.x2, weight: WeightType = .regular) -> Font {
        return Font(UIFont(name: "\(prefix)\(weight.rawValue)", size: size) ?? .systemFont(ofSize: size))
    }
}
