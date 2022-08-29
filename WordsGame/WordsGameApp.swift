//
//  WordsGameApp.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 25.06.2022.
//

import SwiftUI
import NeedleFoundation

@main
struct WordsGameApp: App {
    init() {
        registerProviderFactories()
        
        // set initial number of players for the first launch
        let keyValueManager = KeyValueManager()
        guard keyValueManager.getValue(.numberOfPlayers) != nil else {
            keyValueManager.setValue(key: .numberOfPlayers, value: GWConstants.minNumberOfPlayers)
            return
        }
    }
    
    var body: some Scene {
        WindowGroup {
            BasicComponent().mainView
                .preferredColorScheme(.dark)
        }
    }
}
