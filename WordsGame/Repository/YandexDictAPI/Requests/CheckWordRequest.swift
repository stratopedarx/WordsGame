//
//  CheckWordRequest.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 28.08.2022.
//

import Foundation
import Alamofire

struct CheckWordRequest: NetworkRequestProtocol {
    typealias ResponseType = WordResponse
    
    private let lang: String
    private let text: String
    
    init(fromLanguageToLanguage: String, text: String) {
        self.lang = fromLanguageToLanguage
        self.text = text
    }
    
    func getRequestDescriptor() -> RequestDescriptorProtocol {
        RequestDescriptor(
            path: GWConstants.YandexAPI.lookUpPath,
            method: .get,
            params: [
                "key": GWConstants.YandexAPI.publicKey,
                "lang": lang,
                "text": text
            ],
            encoding: URLEncoding.default
        )
    }
}
