//
//  GameCell.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 28.08.2022.
//

import SwiftUI

struct GameCell: Identifiable {
    let id = UUID()
    var name: String
    var color: Color
    var word: String
}
