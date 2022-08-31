//
//  GWConstants.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 30.07.2022.
//

struct GWConstants {
    static let initialSelectedTab: MainTabsSelection = .game
    static let minimumWordLength = 8
    static let maximumWordLength = 25
    static let maxNumberOfPlayers = 4
    static let minNumberOfPlayers = 2
    
    struct YandexAPI {
        static let baseUrl = "https://dictionary.yandex.net/api/v1/dicservice.json/"
        static let lookUpPath = "lookup"
        static let publicKey = "dict.1.1.20220828T131515Z.68a463f211909cd6.8cdfb6f6fcc1c558e30312c6bd0078af65bd7c43"
        static let langFromRuToRu = "ru-ru"
        static let langFromEnToEn = "en-en"
    }
}
