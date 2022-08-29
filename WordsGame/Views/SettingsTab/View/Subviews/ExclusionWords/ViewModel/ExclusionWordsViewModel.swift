//
//  ExclusionWordsViewModel.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 29.08.2022.
//

import SwiftUI

final class ExclusionWordsViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var exclusionWords: [String] = []
    @Published var newExclusionWord = ""
    var keyValueManager: KeyValueManager
    
    var disabled: Bool {
        isLoading || newExclusionWord.isEmpty
    }
    
    init() {
        keyValueManager = KeyValueManager()
    }
}

// MARK: - actions

extension ExclusionWordsViewModel {
    func loadExclusionWords() {
        isLoading = true
        
        guard let exclusionWords = keyValueManager.getValue(.exclusionWords) as? [String] else {
            isLoading = false
            return
        }
        self.exclusionWords = exclusionWords
        isLoading = false
    }
    
    func addExclusionWord() {
        exclusionWords.append(newExclusionWord.lowercased())
        keyValueManager.setValue(key: .exclusionWords, value: exclusionWords)
        newExclusionWord.removeAll()
    }
    
    func removeExclusionWords() {
        keyValueManager.removeValue(.exclusionWords)
        exclusionWords.removeAll()
    }
}
