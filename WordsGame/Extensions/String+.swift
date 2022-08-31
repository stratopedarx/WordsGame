//
//  String+.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 31.08.2022.
//

import Foundation

extension String {
    var isLatin: Bool {
        let upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let lower = "abcdefghijklmnopqrstuvwxyz"

        for c in self.map({ String($0) }) {
            if !upper.contains(c) && !lower.contains(c) {
                return false
            }
        }

        return true
    }

    var isCyrillic: Bool {
        let upper = "АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЬЮЯ"
        let lower = "абвгдежзийклмнопрстуфхцчшщьюя"

        for c in self.map({ String($0) }) {
            if !upper.contains(c) && !lower.contains(c) {
                return false
            }
        }

        return true
    }

    var isBothLatinAndCyrillic: Bool {
        return self.isLatin && self.isCyrillic
    }
}
