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
    @Published var showAlertRefreshGame = false
    @Published var allWordsForCurrentGame: [GameCell] = []

    private var cancellableSet: Set<AnyCancellable> = []
    private var currentPlayerIndex: Int = 0
    var currentPlayer: Player {
        players[currentPlayerIndex]
    }
    var isCorrectWord: Bool {
        wordStatus == .correct
    }
    
    var gameWord: String
    var players: [Player]
    var cacheManager: CacheManagerProtocol
    var yandexDictAPI: YandexDictAPIProtocol
    
    init(gameWord: String, players: [Player], cacheManager: CacheManagerProtocol, yandexDictAPI: YandexDictAPIProtocol) {
        print("!!! init GameViewModel")
        self.gameWord = gameWord
        self.players = players
        self.cacheManager = cacheManager
        self.yandexDictAPI = yandexDictAPI
        initCache()
        playerWordObserve()
    }
    
    func initCache() {
        cacheManager.resetCurrentGame()
        for player in players {
            cacheManager.currentGame[player] = []
        }
    }
}

// MARK: - Actions

extension GameViewModel {
    func cancelAction() {
        showCloseAlert = true
    }
    
    func resetGame() {
        cacheManager.resetCurrentGame()
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
        yandexDictAPI.checkWord(text: playerWord)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("!!! error \(error)")
                case .finished:
                    break
                }
            } receiveValue: { [weak self] response in
                guard let self = self else { return }
                self.isLoading = false
                guard !response.def.isEmpty else {
                    self.wordStatus = .notCorrect
                    self.showAlertCheckedWord = true
                    return
                }
                self.isLoading = false
                self.wordStatus = .correct
                self.showAlertCheckedWord = true
            }
            .store(in: &cancellableSet)

    }
    
    func toNextPlayer() {
        saveWordForCurrentPlayer()
        let nextIndex = currentPlayerIndex + 1
        currentPlayerIndex = players.indices.contains(nextIndex) ? nextIndex : 0
        
        resetState()
    }
    
    func tryAgain() {
        resetState()
    }
    
    func refreshGame() {
        resetState()
        resetGame()
        allWordsForCurrentGame.removeAll()
        for index in 0..<players.count {
            players[index].resetPoints()
        }
    }
}

// MARK: - private helpers

private extension GameViewModel {
    func resetState() {
        playerWord.removeAll()
        placeholderPlayerWord = .initPlaceholder
    }
    
    func saveWordForCurrentPlayer() {
        players[currentPlayerIndex].update(points: playerWord.count)
        cacheManager.currentGame[currentPlayer]?.append(playerWord)
        allWordsForCurrentGame.append(GameCell(name: currentPlayer.name, color: currentPlayer.color, word: playerWord))
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
