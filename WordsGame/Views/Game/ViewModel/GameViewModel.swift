//
//  GameViewModel.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 23.08.2022.
//

import SwiftUI
import Combine

final class GameViewModel: ObservableObject {
    @Published var playerWord: String = ""
    @Published var placeholderPlayerWord: PlayerWordPlaceholders = .initPlaceholder
    @Published var showCloseAlert = false
    @Published var isLoading = false
    @Published var wordStatus: WordStatus = .notChecked
    @Published var showAlertCheckedWord = false

    var gameWord: String
    var players: [Player]
    var placeholderNames: [String]

    private var currentPlayerIndex: Int = 0
    var currentPlayer: Player {
        players[currentPlayerIndex]
    }
    var isCorrectWord: Bool {
        wordStatus == .correct
    }
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init(gameWord: String, players: [Player], placeholderNames: [String]) {
        self.gameWord = gameWord
        self.players = players
        self.placeholderNames = placeholderNames
        playerWordObserve()
    }
}

// MARK: - Actions

extension GameViewModel {
    func cancelAction() {
        showCloseAlert = true
    }
    
    func saveGame() {
        // Todo need to implement saving the game
    }
    
    func validate(_ newWord: String) {
        let value = newWord.replacingOccurrences(of: "\\s", with: "", options: .regularExpression)
                           .replacingOccurrences(of: "\\d", with: "", options: .regularExpression)
        if value != newWord {
            playerWord = value
        }
    }
    
    func checkEnteredWord() {
        self.isLoading = true
//         ToDo: implement checking
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.isLoading = false
            self.wordStatus = .notCorrect
            self.showAlertCheckedWord = true
        }
    }
    
    func toNextPlayer() {
        resetState()
    }
    
    func tryAgain() {
        resetState()
    }
}

// MARK: - private helpers

private extension GameViewModel {
    func resetState() {
        playerWord.removeAll()
        placeholderPlayerWord = .initPlaceholder
    }
}

// MARK: - Observers

extension GameViewModel {
    func playerWordObserve() {
        $playerWord
            .sink { [weak self] newWord in
                guard let self = self else { return }
                
                guard !newWord.isEmpty else {
                    self.placeholderPlayerWord = .initPlaceholder
                    return
                }
                
                guard !(newWord.count == 1) else {
                    self.placeholderPlayerWord = .minimumTwoLetters
                    return
                }
                self.placeholderPlayerWord = .allIsGood
            }
            .store(in: &cancellableSet)
    }
}
