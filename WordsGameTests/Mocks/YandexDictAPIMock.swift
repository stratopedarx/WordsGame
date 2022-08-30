//
//  YandexDictAPIMock.swift
//  WordsGameTests
//
//  Created by Sergey Lobanov on 30.08.2022.
//

import Combine
import Foundation
@testable import WordsGame

final class YandexDictAPIMock: YandexDictAPIProtocol {
    func checkWord(fromLanguageToLanguage: String, text: String) -> AnyPublisher<WordResponse, NetworkError> {
        return Future { promise in
            promise(.success(WordResponseMock.successResponse()))
        }
        .eraseToAnyPublisher()
    }
    
    func checkWordNotSuccess(fromLanguageToLanguage: String, text: String) -> AnyPublisher<WordResponse, NetworkError> {
        return Future { promise in
            promise(.success(WordResponseMock.notSuccessResponse()))
        }
        .eraseToAnyPublisher()
    }
    
    func checkWordNotFailed(fromLanguageToLanguage: String, text: String) -> AnyPublisher<WordResponse, NetworkError> {
        return Future { promise in
            promise(.failure(NetworkError.invalidJSON))
        }
        .eraseToAnyPublisher()
    }
}
