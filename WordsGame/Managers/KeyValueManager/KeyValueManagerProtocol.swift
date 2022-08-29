//
//  KeyValueManagerProtocol.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 29.08.2022.
//

protocol KeyValueManagerProtocol {
    func setValue<TypeValue>(key: KeyTitle, value: TypeValue)
    func getValue(_ key: KeyTitle) -> Any?
    func removeValue(_ key: KeyTitle)
}
