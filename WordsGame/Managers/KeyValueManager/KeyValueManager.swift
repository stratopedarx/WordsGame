//
//  KeyValueManager.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 29.08.2022.
//

import Foundation

class KeyValueManager: KeyValueManagerProtocol {
    func setValue<TypeValue>(key: KeyTitle, value: TypeValue) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }

    func getValue(_ key: KeyTitle) -> Any? {
        guard let value = UserDefaults.standard.object(forKey: key.rawValue) else {
            return nil
        }
        return value
    }

    func removeValue(_ key: KeyTitle) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
    }
}

extension KeyValueManager {
    static var numberOfPlayers: Int {
        guard let numberOfPlayers = KeyValueManager().getValue(.numberOfPlayers) as? Int else {
            return GWConstants.minNumberOfPlayers
        }
        return numberOfPlayers
    }
}
