//
//  YandexDictAPIProtocol.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 28.08.2022.
//

import Foundation
import Combine

protocol YandexDictAPIProtocol: AnyObject {
    func checkWord(fromLanguageToLanguage: String, text: String) -> AnyPublisher<WordResponse, NetworkError>
}

extension YandexDictAPIProtocol {
    func checkWord(text: String) -> AnyPublisher<WordResponse, NetworkError> {
        return checkWord(fromLanguageToLanguage: GWConstants.YandexAPI.langFromRuToRu, text: text)
    }
}
