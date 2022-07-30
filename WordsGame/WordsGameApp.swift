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
    }
    
    var body: some Scene {
        WindowGroup {
            BasicComponent().mainView
        }
    }
}
