//
//  SettingsTabViewModel.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 30.07.2022.
//

import SwiftUI

class SettingsTabViewModel: ObservableObject {
    var keyValueManager: KeyValueManagerProtocol
    @Published var numberOfPlayers: Int = GWConstants.minNumberOfPlayers {
        didSet {
            keyValueManager.setValue(key: .numberOfPlayers, value: numberOfPlayers)
        }
    }
    @Published var showExclusionWordsSheet = false
    
    init() {
        self.keyValueManager = KeyValueManager()
        guard let numberOfPlayers = keyValueManager.getValue(.numberOfPlayers) as? Int else {
            return
        }
        self.numberOfPlayers = numberOfPlayers
    }
}
