//
//  CheckWordResponse.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 28.08.2022.
//

import Foundation

// MARK: - WordResponse

struct WordResponse: Codable {
    let head: Head
    let def: [Def]
}

// MARK: - Def

struct Def: Codable {
    let text, pos: String
    let tr: [Tr]
}

// MARK: - Tr

struct Tr: Codable {
    let text, pos: String
    let fr: Int
    let syn: [Tr]?
}

// MARK: - Head

struct Head: Codable {
}
