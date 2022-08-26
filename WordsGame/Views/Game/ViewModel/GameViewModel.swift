//
//  GameViewModel.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 23.08.2022.
//

import SwiftUI
import Combine
import Alamofire

final class GameViewModel: ObservableObject {
    @Published var playerWord: String = ""
    @Published var placeholderPlayerWord: String = ""
    @Published var showCloseAlert = false

    var gameWord: String
    var players: [Player]
    var placeholderNames: [String]

    private var currentPlayerIndex: Int = 0
    var currentPlayer: Player {
        players[currentPlayerIndex]
    }
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init(gameWord: String, players: [Player], placeholderNames: [String]) {
        self.gameWord = gameWord
        self.players = players
        self.placeholderNames = placeholderNames
        playerWordObserve()
    }
    
    func cancelAction() {
        showCloseAlert = true
    }
    
    func saveGame() {
        // Todo need to implement saving the game
    }
    
    func validate(_ newWord: String) {
        let value = newWord.replacingOccurrences(of: "\\W", with: "", options: .regularExpression)
        if value != newWord {
            playerWord = value
        }
    }
    
    func playerWordObserve() {
        $playerWord
            .sink { [weak self] newWord in
                guard let self = self else { return }
                
                guard !newWord.isEmpty else {
                    self.placeholderPlayerWord.removeAll()
                    return
                }
                
                guard !(newWord.count == 1) else {
                    self.placeholderPlayerWord = Localizable.minimumTwoLetters.localized
                    return
                }
                self.placeholderPlayerWord = Localizable.allIsGood.localized
            }
            .store(in: &cancellableSet)
    }
}
