//
//  YandexDictAPI.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 28.08.2022.
//

import Foundation
import Combine

// MARK: - YandexDictAPI

final class YandexDictAPI {
    private let networking: NetworkGatewayProtocol
    
    init(networking: NetworkGatewayProtocol) {
        self.networking = networking
    }
}

// MARK: - YandexDictAPIProtocol

extension YandexDictAPI: YandexDictAPIProtocol {
    func checkWord(fromLanguageToLanguage: String, text: String) -> AnyPublisher<WordResponse, NetworkError> {
        networking
            .json(
                CheckWordRequest(
                    fromLanguageToLanguage: fromLanguageToLanguage,
                    text: text
                )
            )
            .eraseToAnyPublisher()
    }
}
