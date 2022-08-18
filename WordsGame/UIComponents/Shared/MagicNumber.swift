//
//  MagicNumber.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 26.06.2022.
//

import SwiftUI

struct MagicNumber {
    static let defaultValue: CGFloat = 10
    static let x05: CGFloat = x / 2
    static let x: CGFloat = 8
    static let x2: CGFloat = x * 2
    static let x3: CGFloat = x * 3
    static let x4: CGFloat = x * 4
    static let x5: CGFloat = x * 5
    static let x6: CGFloat = x * 6
    static let x7: CGFloat = x * 7
    static let x8: CGFloat = x * 8
}

extension CGFloat {
    var responsive: CGFloat {
        let width = UIScreen.main.bounds.width
        if width < 375 {
            return self / 2
        } else if width > 768 {
            return self * 2
        }
        return self
    }
}
